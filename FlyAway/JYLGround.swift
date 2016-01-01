//
//  JYLGround.swift
//  Fly Away
//
//  Created by John Lee on 12/27/15.
//  Copyright © 2015 wwwww. All rights reserved.
//

import SpriteKit

class JYLGround: SKSpriteNode {
  
  init(withWidth width: CGFloat) {
    super.init(texture: nil, color: SKColor.clearColor(), size: CGSizeZero)
    self.physicsBody = SKPhysicsBody.init(edgeLoopFromRect:
      CGRectMake(0, 0, width, startPositionYDifference))
    self.physicsBody?.categoryBitMask = ColliderType.ground.rawValue
    self.physicsBody?.collisionBitMask = ColliderType.bird.rawValue
    self.physicsBody?.contactTestBitMask = ColliderType.bird.rawValue
    self.physicsBody?.dynamic = false
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
}
