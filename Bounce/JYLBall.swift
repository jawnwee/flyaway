//
//  JYLBall.swift
//  Bounce
//
//  Created by John Lee on 12/22/15.
//  Copyright © 2015 wwwww. All rights reserved.
//

import SpriteKit

class JYLBall: SKSpriteNode {
  
  init() {
    let texture = SKTexture.init(imageNamed: "ball")
    super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
    self.physicsBody = SKPhysicsBody.init(texture: texture, size: texture.size())
    self.physicsBody?.allowsRotation = false
    self.physicsBody?.friction = 0
    self.physicsBody?.restitution = 0
    self.physicsBody?.mass = 5
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}