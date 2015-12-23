//
//  GameScene.swift
//  Skip
//
//  Created by John Lee on 11/29/15.
//  Copyright (c) 2015 wwwww. All rights reserved.
//

import SpriteKit

class OBMainGameScene: SKScene {
  
  var hero = SKSpriteNode(imageNamed: "hero")
  let leftWall = SKSpriteNode(imageNamed: "wall")
  let rightWall = SKSpriteNode(imageNamed: "wall")
  
  override func didMoveToView(view: SKView) {
    leftWall.position = CGPointMake(leftWall.size.width / 2, leftWall.size.height / 2)
    leftWall.physicsBody = SKPhysicsBody(texture: leftWall.texture!, size: leftWall.texture!.size())
    leftWall.physicsBody?.affectedByGravity = false
    rightWall.position = CGPointMake(self.size.width - leftWall.size.width / 2, leftWall.size.height / 2)
    rightWall.physicsBody = SKPhysicsBody(texture: leftWall.texture!, size: leftWall.texture!.size())
    rightWall.physicsBody?.affectedByGravity = false
    self.addChild(leftWall)
    self.addChild(rightWall)
    hero.position = CGPointMake(leftWall.size.width / 2 + hero.size.width, hero.size.height);
    hero.physicsBody = SKPhysicsBody(circleOfRadius: hero.size.width / 2)
    hero.physicsBody?.affectedByGravity = false
    self.addChild(hero)
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    /* Called when a touch begins */
    
  }
   
  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
  }
}
