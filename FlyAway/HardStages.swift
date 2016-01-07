//
//  HardStages.swift
//  Fly Away
//
//  Created by John Lee on 12/27/15.
//  Copyright © 2015 wwwww. All rights reserved.
//

import SpriteKit


class HardStages: SKNode {
  
  var isRunning: Bool
  
  override init() {
    isRunning = false
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func runRandomStage() {
    let randomStage = Int(arc4random_uniform(6))
    switch randomStage {
    case 0:
      hardStage0()
    case 1:
      hardStage1()
    case 2:
      hardStage2()
    case 3:
      hardStage3()
    default:
      hardStage0()
    }
    isRunning = true
  }
  
  func hardStage0() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let delay = SKAction.waitForDuration(1.0)
    let firstShard = SKAction.runBlock {
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
      self.addChild(shard)
    }
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + (150 * scaleFactor))
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + (50 * scaleFactor))
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - (150 * scaleFactor))
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([firstShard, secondShard, delay, thirdShard, fourthShard]))
  }
  
  func hardStage1() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let delay = SKAction.waitForDuration(0.5)
    let firstShard = SKAction.runBlock {
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - (100 * scaleFactor))
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - (170 * scaleFactor))
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - (230 * scaleFactor))
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([firstShard, delay, secondShard, delay, thirdShard, delay, fourthShard]))
  }
  
  func hardStage2() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let delay = SKAction.waitForDuration(0.5)
    let firstShard = SKAction.runBlock {
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
      self.addChild(shard)
    }
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + (100 * scaleFactor))
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + (170 * scaleFactor))
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + (230 * scaleFactor))
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([firstShard, delay, secondShard, delay, thirdShard, delay, fourthShard]))
  }
  
  func hardStage3() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(1.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 200 * scaleFactor)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.easyVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 100 * scaleFactor)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.easyVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 200 * scaleFactor)
      self.addChild(shard)
    }
    let fifthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 100 * scaleFactor)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard, delay, fourthShard, delay, fifthShard]))
  }
  
  func hardStage4() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let delay = SKAction.waitForDuration(0.5)
    let firstShard = SKAction.runBlock {
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
      self.addChild(shard)
    }
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + (50 * scaleFactor))
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + (150 * scaleFactor))
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + (200 * scaleFactor))
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([firstShard, secondShard, delay, thirdShard, delay, fourthShard]))
  }
  
  func hardStage5() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight * scaleFactor)
    shard.setVelocity(ShardVelocity.easyVelocity)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(0.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 150 * scaleFactor)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard]))
  }
  
  func hardStage6() {
    
  }
  
}