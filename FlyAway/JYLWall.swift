//
//  JYLWall.swift
//  Fly Away
//
//  Created by John Lee on 12/30/15.
//  Copyright © 2015 wwwww. All rights reserved.
//

import SpriteKit

enum WallSide: UInt32 {
  case left = 1
  case right = 2
}

class JYLWall: SKSpriteNode {
  
  init(withSide side: WallSide) {
    super.init(texture: nil, color: SKColor.clearColor(), size: CGSizeZero)
    if side == WallSide.left {
      self.physicsBody = SKPhysicsBody.init(edgeLoopFromRect:
        CGRectMake(-50, 0, 3, screenHeight + 100))
      self.physicsBody?.categoryBitMask = ColliderType.leftWall.rawValue
    } else {
      self.physicsBody = SKPhysicsBody.init(edgeLoopFromRect:
        CGRectMake(screenWidth + 50, 0, 3, screenHeight + 100))
      self.physicsBody?.categoryBitMask = ColliderType.rightWall.rawValue
    }
    self.physicsBody?.collisionBitMask = 0
    self.physicsBody?.dynamic = false
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
