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

class JYLShard: SKSpriteNode {
  
  init(direction: ShardDirection) {
    let shardTexture: SKTexture
    if direction == ShardDirection.left {
      shardTexture = SKTexture(imageNamed: "shardLeft")
    } else {
      shardTexture = SKTexture(imageNamed: "shardRight")
    }
    super.init(texture: shardTexture, color: SKColor.clearColor(), size: shardTexture.size())
    self.physicsBody = SKPhysicsBody.init(texture: shardTexture, size: shardTexture.size())
    if direction == ShardDirection.left {
      self.physicsBody!.velocity = CGVectorMake(100, 0)
    } else {
      self.physicsBody!.velocity = CGVectorMake(-100, 0)
    }
    self.physicsBody!.affectedByGravity = false
    self.physicsBody?.categoryBitMask = ColliderType.shard.rawValue
    self.physicsBody?.collisionBitMask = ColliderType.bird.rawValue
    self.physicsBody?.contactTestBitMask = ColliderType.bird.rawValue
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}