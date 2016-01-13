//
//  JYLAcorn.swift
//  Fly Away
//
//  Created by John Lee on 1/7/16.
//  Copyright © 2016 wwwww. All rights reserved.
//

import SpriteKit

let AcornXPosition = screenWidth / 2.0

class JYLAcorn: SKSpriteNode {
  
  init() {
    let texture = SKTexture.init(imageNamed: "acorn")
    super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
    self.physicsBody = SKPhysicsBody.init(circleOfRadius: texture.size().width / 2)
    self.physicsBody?.categoryBitMask = ColliderType.acorn.rawValue
    self.physicsBody?.dynamic = false
    let leftRotation = SKAction.rotateByAngle(CGFloat(-M_PI / 8.0) , duration: 0.5)
    let rightRotation = SKAction.rotateByAngle(CGFloat(M_PI / 8.0) , duration: 0.5)
    
    let hanging = SKAction.repeatActionForever(
      SKAction.sequence([
        leftRotation,
        rightRotation
        ])
    )
    self.runAction(hanging)
  }
  
  func plusOne() {
    self.physicsBody?.categoryBitMask = 0
    let plusOne = SKLabelNode(fontNamed: "Dosis-SemiBold")
    plusOne.text = "+1"
    plusOne.fontColor = JYLFlyAwayColors.plusOneColor()
    plusOne.fontSize = 20.0 * scaleFactor
    plusOne.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
    self.addChild(plusOne)
    let moveYAnimate = SKAction.moveBy(CGVectorMake(0, 3.0), duration: 0.3)
    let fadeOut = SKAction.fadeOutWithDuration(0.3);
    let plusOneAnimate = SKAction.sequence([moveYAnimate, fadeOut, SKAction.runBlock({
      self.removeFromParent()
    })])
    self.runAction(plusOneAnimate)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
