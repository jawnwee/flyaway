//
//  JYLSpikes.swift
//  Hold The Ball
//
//  Created by John Lee on 12/24/15.
//  Copyright © 2015 wwwww. All rights reserved.
//

import SpriteKit

class JYLSpikes: SKSpriteNode {
  
  init() {
    let texture = SKTexture.init(imageNamed: "spikes")
    super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
    self.physicsBody = SKPhysicsBody.init(texture: texture, size: texture.size())
    self.physicsBody?.allowsRotation = false
    self.physicsBody!.affectedByGravity = false
    self.physicsBody!.dynamic = false
    self.physicsBody!.friction = 0
    self.physicsBody!.restitution = 1
    self.physicsBody?.categoryBitMask = ColliderType.spikes.rawValue
    self.physicsBody?.collisionBitMask = ColliderType.bird.rawValue
    self.physicsBody?.contactTestBitMask = ColliderType.bird.rawValue
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}