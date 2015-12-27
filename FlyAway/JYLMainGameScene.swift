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
}

let GameStartActionString = "GameStart"
let startPositionYDifference = CGFloat.init(floatLiteral: 100.0)
let spikesYPositionAdjustment = CGFloat.init(floatLiteral: 5)
let birdFlyingForce = CGFloat.init(floatLiteral: 500)

class JYLMainGameScene: SKScene, SKPhysicsContactDelegate {
  
  let bird = JYLBird.init()
  let spikes = JYLSpikes.init()
  let background = SKSpriteNode(imageNamed: "background")
  var tapped = false
  var gameStarted = false

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
      startGame()
    }
    let bounceVectorForce = CGVector.init(dx: 0, dy: birdFlyingForce);
    bird.physicsBody?.applyImpulse(bounceVectorForce)
  }
   
  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
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
    }
    if (firstBody.categoryBitMask & ColliderType.bird.rawValue != 0)
      && (secondBody.categoryBitMask & ColliderType.spikes.rawValue != 0) {
        removeActionForKey(GameStartActionString)
    }
  }
  
  func startGame() {
    let gameStartAction = SKAction.repeatActionForever(
      SKAction.sequence([
        SKAction.runBlock(addShards),
        SKAction.waitForDuration(1.0)
        ])
    )
    runAction(gameStartAction, withKey: GameStartActionString)
  }
  

// MARK - Game Logic
  func layoutGameSpriteNodes() {
    let ground = JYLGround.init(withHeight: frame.size.height)
    self.addChild(ground)
    background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
    self.addChild(background)
    self.view!.ignoresSiblingOrder = false
    let spikePosition = CGPointMake(self.frame.width / 2,
      self.frame.height - spikes.frame.height / 2 + spikesYPositionAdjustment)
    spikes.position = spikePosition
    self.addChild(spikes)
    bird.position = CGPointMake(self.view!.center.x, self.view!.center.y - startPositionYDifference)
    self.addChild(bird)
  }

  func addShards() {
    let randomDirection = Int(arc4random_uniform(2))
    let direction: ShardDirection
    let side: CGFloat
    if randomDirection == 0 {
      direction = ShardDirection.left
      side = 0
    } else {
      direction = ShardDirection.right
      side = self.frame.width + 100
    }
    let screenHeight = UInt32(self.frame.height)
    let randomY = CGFloat(arc4random_uniform(screenHeight) + UInt32(startPositionYDifference))
    let shard = JYLShard.init(direction: direction)
    let position = CGPointMake(side, randomY)
    shard.position = position
    self.addChild(shard)
  }
  
  
}
