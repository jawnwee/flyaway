//
//  GameScene.swift
//  Skip
//
//  Created by John Lee on 11/29/15.
//  Copyright (c) 2015 wwwww. All rights reserved.
//

import SpriteKit

enum ColliderType: UInt32 {
  case ball = 1
  case ground = 2
  case shard = 4
}

let startPositionYDifference = CGFloat.init(floatLiteral: 100.0)
let ballBounceForce = CGFloat.init(floatLiteral: 2500)

class OBMainGameScene: SKScene, SKPhysicsContactDelegate {
  
  let ball = JYLBall.init()
  var tapped = false
  
  override init(size: CGSize) {
    super.init(size: size)
    let rectangleSize = CGRectMake(self.frame.origin.x, startPositionYDifference,
      self.frame.size.width, self.frame.size.height - startPositionYDifference)
    self.physicsBody = SKPhysicsBody.init(edgeLoopFromRect: rectangleSize)
    self.physicsBody?.restitution = 0
    self.physicsBody?.collisionBitMask = ColliderType.ground.rawValue
    self.physicsBody?.contactTestBitMask = ColliderType.ball.rawValue
    self.physicsWorld.contactDelegate = self
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  override func didMoveToView(view: SKView) {
    ball.physicsBody?.collisionBitMask = ColliderType.ball.rawValue
    ball.physicsBody?.contactTestBitMask = ColliderType.ground.rawValue
    ball.position = CGPointMake(self.view!.center.x, self.view!.center.y - startPositionYDifference)
    self.addChild(ball)
  }

  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    let bounceVectorForce = CGVector.init(dx: 0, dy: ballBounceForce);
    ball.physicsBody?.applyImpulse(bounceVectorForce)
  }
   
  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
  }
  
  func didBeginContact(contact: SKPhysicsContact) {
    
  }

  func beginShootingShards() {
    
  }
  
  
}
