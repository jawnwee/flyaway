//
//  JYLBirdTest.swift
//  Fly Away
//
//  Created by John Lee on 12/27/15.
//  Copyright © 2015 wwwww. All rights reserved.
//

import XCTest
import SpriteKit

class JYLBirdTest: XCTestCase {
  
  func testInit() {
    let bird = JYLBird.init()
    XCTAssertTrue(bird.physicsBody!.affectedByGravity)
    XCTAssertFalse(bird.physicsBody!.allowsRotation)
    XCTAssertEqual(bird.physicsBody!.categoryBitMask, ColliderType.bird.rawValue)
    XCTAssertEqual(0, bird.physicsBody!.friction)
    XCTAssertEqual(0, bird.physicsBody!.mass)
    XCTAssertEqual(0, bird.physicsBody!.restitution)
  }
  
}
