//
//  JYLBird.swift
// DodgeTheShards
//
//  Created by John Lee on 12/22/15.
//  Copyright © 2015 wwwww. All rights reserved.
//

import SpriteKit

class JYLBird: SKSpriteNode {
  
  init() {
    let texture = SKTexture.init(imageNamed: "bird")
    super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
    self.physicsBody = SKPhysicsBody.init(texture: texture, size: texture.size())
    self.physicsBody?.allowsRotation = false
    self.physicsBody?.friction = 0
    self.physicsBody?.restitution = 0
    self.physicsBody?.mass = 0
    self.physicsBody?.categoryBitMask = ColliderType.bird.rawValue
    self.physicsBody?.collisionBitMask =
      (ColliderType.shard.rawValue
      | ColliderType.ground.rawValue
      | ColliderType.spikes.rawValue)
    self.physicsBody?.contactTestBitMask =
      (ColliderType.shard.rawValue | ColliderType.spikes.rawValue)
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}