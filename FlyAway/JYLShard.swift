//
//  JYLShard.swift
// DodgeTheShards
//
//  Created by John Lee on 12/22/15.
//  Copyright © 2015 wwwww. All rights reserved.
//

import SpriteKit

enum ShardDirection: UInt32 {
  case left = 1
  case right = 2
}

enum ShardVelocity: UInt32 {
  case easyVelocity = 1
  case mediumVelocity = 2
  case hardVelocity = 4
}

class JYLShard: SKSpriteNode {
  
  let easyVelocity = CGVectorMake(150, 0)
  let mediumVelocity = CGVectorMake(200, 0)
  let hardVelocity = CGVectorMake(250, 0)
  let shardDirection : ShardDirection
  
  init(direction: ShardDirection) {
    let shardTexture: SKTexture
    if direction == ShardDirection.left {
      shardTexture = SKTexture(imageNamed: "shardLeft")
    } else {
      shardTexture = SKTexture(imageNamed: "shardRight")
    }
    shardDirection = direction
    super.init(texture: shardTexture, color: SKColor.clearColor(), size: shardTexture.size())
    self.physicsBody = SKPhysicsBody.init(texture: shardTexture, size: shardTexture.size())
    if direction == ShardDirection.left {
      self.physicsBody!.velocity = easyVelocity
      self.physicsBody?.contactTestBitMask = ColliderType.bird.rawValue | ColliderType.rightWall.rawValue

    } else {
      self.physicsBody!.velocity = easyVelocity
      self.physicsBody?.velocity.dx *= -1
      self.physicsBody?.contactTestBitMask = ColliderType.bird.rawValue | ColliderType.leftWall.rawValue
    }
    self.physicsBody?.allowsRotation = false
    self.physicsBody!.affectedByGravity = false
    self.physicsBody!.friction = 0
    self.physicsBody!.restitution = 1
    self.physicsBody?.mass = 100
    self.physicsBody?.categoryBitMask = ColliderType.shard.rawValue
    self.physicsBody?.collisionBitMask = ColliderType.bird.rawValue
    self.setScale(scaleFactor)
  }
  
  func setVelocity(velocity : ShardVelocity) {
    switch velocity {
    case ShardVelocity.easyVelocity:
      self.physicsBody?.velocity = easyVelocity
    case ShardVelocity.mediumVelocity:
      self.physicsBody?.velocity = mediumVelocity
    case ShardVelocity.hardVelocity:
      self.physicsBody?.velocity = hardVelocity
    }
    if shardDirection == ShardDirection.right {
      self.physicsBody?.velocity.dx *= -1
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}