//
//  EasyStages.swift
//  Fly Away
//
//  Created by John Lee on 12/27/15.
//  Copyright © 2015 wwwww. All rights reserved.
//

import SpriteKit

class EasyStages: SKNode {
  
  var isRunning: Bool
  
  override init() {
    isRunning = false
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func runRandomStage() {
    let randomStage = Int(arc4random_uniform(4))
    switch randomStage {
    case 0:
      easyStage0()
    case 1:
      easyStage1()
    case 2:
      easyStage2()
    default:
      easyStage3()
    }
    isRunning = true
  }
  
  func easyStage0() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(1.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 200 * scaleFactor)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 100 * scaleFactor)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard, delay, thirdShard]))

  }
  
  func easyStage1() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 50 * scaleFactor)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(1.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 50 * scaleFactor)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 100 * scaleFactor)
      self.addChild(shard)
    }
    
    self.runAction(SKAction.sequence([delay, secondShard, delay, thirdShard, delay, fourthShard]))
  }
  
  func easyStage2() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 150 * scaleFactor)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(1.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 100 * scaleFactor)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 200 * scaleFactor)
      self.addChild(shard)
    }
    let fifthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight )
      self.addChild(shard)
    }
    
    self.runAction(SKAction.sequence([delay, secondShard, delay, thirdShard, delay, fourthShard, fifthShard]))
  }
  
  func easyStage3() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 200 * scaleFactor)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(0.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 150 * scaleFactor)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 80 * scaleFactor)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard, delay, thirdShard]))
  }
  
}
