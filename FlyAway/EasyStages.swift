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
    let randomStage = Int(arc4random_uniform(8))
    switch randomStage {
    case 0:
      easyStage0()
    case 1:
      easyStage1()
    case 2:
      easyStage2()
    case 3:
      easyStage3()
    case 4:
      easyStage4()
    case 5:
      easyStage5()
    case 6:
      easyStage7()
    default:
      easyStage8()
    }
    print(randomStage)
    isRunning = true
  }
  
  func easyStage0() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    self.addChild(shard)
    let height = shard.height()
    let delay = SKAction.waitForDuration(0.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight +  4 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 8 * height)
      self.addChild(shard)
    }

    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 12 * height)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 14 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard, delay, thirdShard, delay, fourth, delay, fifth, delay, sixth]))
  }
  
  func easyStage1() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
    self.addChild(shard)
    let height = shard.height()
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight +  6 * height)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 8 * height)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 14 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard, fourthShard, fifth]))
  }
  
  func easyStage2() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    self.addChild(shard)
    let height = shard.height()
    let delay = SKAction.waitForDuration(1.0)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight +  4 * height)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 6 * height)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 8 * height)
      self.addChild(shard)
    }
    
    let seventh = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 12 * height)
      self.addChild(shard)
    }
    let eigth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 14 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard, delay, thirdShard, delay, fourthShard, delay, fifth, delay, seventh, delay, eigth]))
  }
  
  func easyStage3() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    self.addChild(shard)
    let height = shard.height()
    let delay = SKAction.waitForDuration(0.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight -  2 * height)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 6 * height)
      self.addChild(shard)
    }
    
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 6 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, delay, thirdShard, fourthShard, delay, fifth, sixth]))
  }
  
  func easyStage4() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    self.addChild(shard)
    let height = shard.height()
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, scaleFactor * (shardMinStartHeight + 2 * height))
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, scaleFactor * (shardMinStartHeight + 4 * height))
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, scaleFactor * (shardMinStartHeight + 7 * height))
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, scaleFactor * (shardMinStartHeight + 9 * height))
      self.addChild(shard)
    }
    
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, scaleFactor * (shardMinStartHeight + 11 * height))
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard, fourthShard, fifth, sixth]))
  }
  
  func easyStage5() {
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
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 200 * scaleFactor)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard, delay, fourthShard]))
  }
  
  func easyStage6() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    self.addChild(shard)
    let height = shard.height()
    let delay = SKAction.waitForDuration(0.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight +  4 * height)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 6 * height)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 8 * height)
      self.addChild(shard)
    }
    
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 12 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, delay, thirdShard, fourthShard, delay, fifth, sixth]))
  }
  
  func easyStage7() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
    self.addChild(shard)
    let height = shard.height()
    let delay = SKAction.waitForDuration(0.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight +  4 * height)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 6 * height)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 8 * height)
      self.addChild(shard)
    }
    
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 12 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, delay, thirdShard, fourthShard, delay, fifth, sixth]))
  }
  
  func easyStage8() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let height = shard.height()
    let delay = SKAction.waitForDuration(1.0)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight +  4 * height)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 6 * height)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 8 * height)
      self.addChild(shard)
    }
    
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 12 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard, delay, thirdShard, delay, fourthShard, fifth, sixth]))
  }
  
  func easyStage9() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
    shard.setVelocity(ShardVelocity.insaneVelocity)
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
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard, thirdShard, delay, fourthShard]))
  }
  
}
