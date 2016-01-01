//
//  GameScene.swift
//  Skip
//
//  Created by John Lee on 11/29/15.
//  Copyright (c) 2015 wwwww. All rights reserved.
//

import SpriteKit

enum ColliderType: UInt32 {
  case bird = 1
  case ground = 2
  case shard = 4
  case spikes = 8
  case leftWall = 16
  case rightWall = 32
}

let screenRect = UIScreen.mainScreen().bounds
let screenWidth = screenRect.size.width;
let screenHeight = screenRect.size.height;
let GameStartActionString = "GameStart"
let spikesYPositionAdjustment = CGFloat.init(floatLiteral: 5)
let birdFlyingForce = CGFloat.init(floatLiteral: 400)
let scaleFactor = screenWidth / 414.0
let startPositionYDifference = (screenHeight / 6) * scaleFactor

class JYLMainGameScene: SKScene, SKPhysicsContactDelegate {
  
  var sleepingBird = SKSpriteNode.init()
  let bird = JYLBird.init()
  let spikes = JYLSpikes.init()
  let background = SKSpriteNode(imageNamed: "background")
  var tapped = false
  var gameStarted = false
  var score : Int = 0
  let stageRunner = StageRunner.init(currentScore: 0)
  let scoreLabel = SKLabelNode(fontNamed: "Dosis-SemiBold")
  let title = SKSpriteNode.init(imageNamed: "title")

// MARK: - Overrides
  override init(size: CGSize) {
    super.init(size: size)
    self.physicsWorld.contactDelegate = self
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  override func didMoveToView(view: SKView) {
    layoutGameSpriteNodes()
  }

  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    if gameStarted == false {
      gameStarted = true
      self.title.removeFromParent()
      sleepingBird.removeFromParent()
      scoreLabel.hidden = false
      startGame()
    }
    let bounceVectorForce = CGVector.init(dx: 0, dy: birdFlyingForce);
    bird.physicsBody?.velocity = CGVectorMake(0, 0)
    bird.physicsBody?.applyImpulse(bounceVectorForce)
  }
   
  override func update(currentTime: CFTimeInterval) {
    stageRunner.checkStages()
  }
  
// MARK: - SKPhysicsContactDelegate
  func didBeginContact(contact: SKPhysicsContact) {
    var firstBody: SKPhysicsBody
    var secondBody: SKPhysicsBody
    if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
      firstBody = contact.bodyA
      secondBody = contact.bodyB
    } else {
      firstBody = contact.bodyB
      secondBody = contact.bodyA
    }
    if (firstBody.categoryBitMask & ColliderType.bird.rawValue != 0)
      && (secondBody.categoryBitMask & ColliderType.shard.rawValue != 0) {
      removeActionForKey(GameStartActionString)
        print("LOSE")
    }
    if (firstBody.categoryBitMask & ColliderType.bird.rawValue != 0)
      && (secondBody.categoryBitMask & ColliderType.spikes.rawValue != 0) {
        removeActionForKey(GameStartActionString)
        print("LOSE")
    }
    if (firstBody.categoryBitMask & ColliderType.shard.rawValue != 0)
      && ((secondBody.categoryBitMask & ColliderType.rightWall.rawValue != 0)
      || (secondBody.categoryBitMask & ColliderType.leftWall.rawValue != 0)) {
        if firstBody.node?.parent != nil {
          firstBody.node?.removeFromParent()
          score++
          scoreLabel.text = String(score)
        }
    }
  }

// MARK - Game Logic
  func layoutGameSpriteNodes() {
    self.view!.ignoresSiblingOrder = false
    physicsWorld.gravity = CGVectorMake(0, -8)
    let ground = JYLGround.init(withWidth: screenWidth)
    let leftWall = JYLWall.init(withSide: WallSide.left)
    let rightWall = JYLWall.init(withSide: WallSide.right)
    self.addChild(leftWall)
    self.addChild(rightWall)
    self.addChild(ground)
    background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
    self.addChild(background)
    layoutTitle()
  }
  
  func layoutTitle() {
    title.position = CGPointMake(CGRectGetMidX(self.frame),
      CGRectGetMidY(self.frame) * 1.65);
    self.addChild(title)
    layoutScoreLabel()
    layoutWorld()
  }
  
  func layoutScoreLabel() {
    scoreLabel.hidden = true
    scoreLabel.text = String(score)
    scoreLabel.fontSize = 65 * scaleFactor
    scoreLabel.fontColor = SKColor.blackColor()
    scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame),
      CGRectGetMidY(self.frame) * 1.65);
    self.addChild(scoreLabel)
  }
  
  func layoutWorld() {
    let spikePosition = CGPointMake(self.frame.width / 2,
      self.frame.height - spikes.frame.height / 2 + spikesYPositionAdjustment)
    spikes.position = spikePosition
    self.addChild(spikes)
    bird.position = CGPointMake(self.view!.center.x,
      startPositionYDifference + (bird.size.height / 2))
    self.addChild(bird)
    layoutSleepingBird()
    let nestTexture = SKTexture.init(imageNamed: "nest")
    let birdNest = SKSpriteNode.init(texture: nestTexture)
    birdNest.setScale(scaleFactor)
    birdNest.position = CGPointMake(self.view!.center.x,
      startPositionYDifference + birdNest.size.height - (12 * scaleFactor))
    self.addChild(birdNest)
  }
  
  func layoutSleepingBird() {
    let sleepingBirdAtlas = SKTextureAtlas(named: "SleepingBird")
    var sleepingFrames = [SKTexture]()
    let numImages = sleepingBirdAtlas.textureNames.count
    for var i = 0; i < numImages; i++ {
      let sleepBirdTexture = "bird_sleep_\(i)"
      sleepingFrames.append(sleepingBirdAtlas.textureNamed(sleepBirdTexture))
    }
    
    let firstFrame = sleepingFrames[0]
    sleepingBird = SKSpriteNode(texture: firstFrame)
    sleepingBird.anchorPoint = CGPointMake(0, 0)
    let adjustedPosition = CGPointMake(bird.position.x - (bird.frame.width / 2),
      bird.position.y - (bird.frame.height / 2))
    sleepingBird.position = adjustedPosition
    self.addChild(sleepingBird)
    sleepingBird.runAction(SKAction.repeatActionForever(
      SKAction.animateWithTextures(sleepingFrames,
        timePerFrame: 0.5,
        resize: true,
        restore: true)),
      withKey:"sleepingBird")
  }
  
  func startGame() {
    stageRunner.position = CGPointMake(0, 100)
    self.addChild(stageRunner)
    let gameStartAction = SKAction.repeatActionForever(
      SKAction.sequence([
        SKAction.runBlock({ self.stageRunner.runStage(self.score) }),
        SKAction.waitForDuration(0.1)
        ])
    )
    runAction(gameStartAction, withKey: GameStartActionString)
  }
  
}
