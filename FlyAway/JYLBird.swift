//
//  JYLBird.swift
// DodgeTheShards
//
//  Created by John Lee on 12/22/15.
//  Copyright © 2015 wwwww. All rights reserved.
//

import SpriteKit

class JYLBird: SKSpriteNode {
  
  let SleepingActionKey = "sleepingAction"
  let sleepNode = SKNode()
  let playDeadTexture = SKTexture.init(imageNamed: "birdDead")
  let chirpTextures : [SKTexture]
  var playingDead = false
  
  init() {
    let sleepingBirdTexture = SKTexture.init(imageNamed: "sleepingBird")
    let normalBirdTexture = SKTexture.init(imageNamed: "bird")
    let chirpTexture = SKTexture.init(imageNamed: "birdChirp")
    self.chirpTextures = [chirpTexture, normalBirdTexture]
    super.init(texture:sleepingBirdTexture, color: SKColor.clearColor(), size: sleepingBirdTexture.size())
    self.physicsBody = SKPhysicsBody.init(texture: sleepingBirdTexture, size: sleepingBirdTexture.size())
    self.physicsBody?.allowsRotation = true
    self.physicsBody?.friction = 0
    self.physicsBody?.restitution = 0
    self.physicsBody?.linearDamping = 0.8
    self.physicsBody?.mass = 0
    self.physicsBody?.categoryBitMask = ColliderType.bird.rawValue
    self.physicsBody?.collisionBitMask =
      (ColliderType.shard.rawValue
      | ColliderType.ground.rawValue
      | ColliderType.spikes.rawValue)
    self.physicsBody?.contactTestBitMask =
      (ColliderType.shard.rawValue | ColliderType.spikes.rawValue)
    self.setScale(scaleFactor)
    sleepNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
    self.addChild(sleepNode)
    startSleeping()
  }
  
  func startSleeping() {
    let zzzTextureAltas = SKTextureAtlas(named: "zzz")
    let z0Texture = zzzTextureAltas.textureNamed("z_0")
    let z1Texture = zzzTextureAltas.textureNamed("z_1")
    let z2Texture = zzzTextureAltas.textureNamed("z_2")
    let z0Node = SKSpriteNode.init(texture: z0Texture)
    z0Node.position = CGPointMake(0, 0)
    let z1Node = SKSpriteNode.init(texture: z1Texture)
    z1Node.position = CGPointMake(10 * scaleFactor, 10 * scaleFactor)
    let z2Node = SKSpriteNode.init(texture: z2Texture)
    z2Node.position = CGPointMake(20 * scaleFactor, 25 * scaleFactor)
    
    
    let sleepingAction = SKAction.repeatActionForever(
      SKAction.sequence([
        SKAction.runBlock({ self.sleepNode.addChild(z0Node) }),
        SKAction.waitForDuration(0.15),
        SKAction.runBlock({ self.sleepNode.addChild(z1Node) }),
        SKAction.waitForDuration(0.15),
        SKAction.runBlock({ self.sleepNode.addChild(z2Node) }),
        SKAction.waitForDuration(0.5),
        SKAction.runBlock({ z2Node.removeFromParent() }),
        SKAction.waitForDuration(0.15),
        SKAction.runBlock({ z1Node.removeFromParent() }),
        SKAction.waitForDuration(0.15),
        SKAction.runBlock({ z0Node.removeFromParent() }),
        SKAction.waitForDuration(0.15)
        ])
    )
    self.sleepNode.runAction(sleepingAction, withKey: SleepingActionKey)
  }
  
  func chirp() {
    let chirpAnimation = SKAction.animateWithTextures(chirpTextures, timePerFrame: 0.15)
    self.runAction(chirpAnimation)
  }
  
  func turn() {
    self.xScale *= -1
  }
  
  func playDead() {
    self.removeAllActions()
    self.texture = playDeadTexture
    self.physicsBody?.collisionBitMask = ColliderType.ground.rawValue
      | ColliderType.rightWall.rawValue
      | ColliderType.leftWall.rawValue
    playingDead = true
  }
  
  func stopSleeping() {
    self.sleepNode.removeActionForKey(SleepingActionKey)
    self.sleepNode.removeFromParent()
    let texture = SKTexture.init(imageNamed: "bird")
    self.texture = texture
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}