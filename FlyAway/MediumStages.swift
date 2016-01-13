//
//  MediumStages.swift
//  Fly Away
//
//  Created by John Lee on 12/27/15.
//  Copyright © 2015 wwwww. All rights reserved.
//

import SpriteKit

class MediumStages: SKNode {
  
  var isRunning: Bool
  
  override init() {
    isRunning = false
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  
  func runRandomStage() {
//    let randomStage = Int(arc4random_uniform(6))
//    switch randomStage {
//    case 0:
//      mediumStage0()
//    case 1:
//      mediumStage1()
//    case 2:
//      mediumStage2()
//    case 3:
//      mediumStage3()
//    case 4:
//      mediumStage4()
//    default:
//      mediumStage5()
//    }
    mediumStage4()
    isRunning = true
  }
  
  func mediumStage0() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(1.0)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 200 * scaleFactor)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 100 * scaleFactor)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 200 * scaleFactor)
      self.addChild(shard)
    }
    let fifthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 100 * scaleFactor)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard, delay, thirdShard, delay,
      fourthShard, fifthShard]))
  }
  
  func mediumStage1() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
    shard.setVelocity(ShardVelocity.mediumVelocity)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(1.0)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight +  6 * height)
      shard.setVelocity(ShardVelocity.mediumVelocity)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 8 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard, thirdShard, delay, fourthShard]))
  }
  
  func mediumStage2() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMaxStartHeight)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(1.0)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight -  4 * height)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight -  6 * height)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    let fifthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard, fourthShard, delay, fifthShard]))
  }
  
  func mediumStage3() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMaxStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight -  4 * height)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight -  6 * height)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    let fifthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard, fourthShard, fifthShard, sixth]))
  }
  
  func mediumStage4() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMaxStartHeight)
    shard.setVelocity(ShardVelocity.mediumVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.mediumVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight -  4 * height)
      shard.setVelocity(ShardVelocity.mediumVelocity)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight -  6 * height)
      shard.setVelocity(ShardVelocity.mediumVelocity)
      self.addChild(shard)
    }
    let fifthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
      shard.setVelocity(ShardVelocity.mediumVelocity)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      shard.setVelocity(ShardVelocity.mediumVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard, fourthShard, fifthShard, sixth]))
  }
  
  func mediumStage5() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(1.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.mediumVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 200 * scaleFactor)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.mediumVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 100 * scaleFactor)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.mediumVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 200 * scaleFactor)
      self.addChild(shard)
    }
    let fifthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.mediumVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 100 * scaleFactor)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard, delay, fourthShard, delay, fifthShard]))
  }
  
  
}
