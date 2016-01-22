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
    let randomStage = Int(arc4random_uniform(45))
    print(randomStage)
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
    case 7:
      easyStage8()
    case 8:
      easyStage9()
    case 9:
      easyStage10()
    case 10:
      easyStage11()
    case 11:
      easyStage12()
    case 12:
      easyStage13()
    case 13:
      easyStage14()
    case 14:
      easyStage15()
    case 15:
      easyStage16()
    case 16:
      easyStage17()
    case 17:
      easyStage18()
    case 18:
      easyStage19()
    case 19:
      easyStage20()
    case 20:
      easyStage21()
    case 21:
      easyStage22()
    case 22:
      easyStage23()
    case 23:
      easyStage24()
    case 24:
      easyStage25()
    case 25:
      easyStage26()
    case 26:
      easyStage27()
    case 27:
      easyStage28()
    case 28:
      easyStage29()
    case 29:
      easyStage30()
    case 30:
      easyStage31()
    case 31:
      easyStage32()
    case 32:
      easyStage33()
    case 33:
      easyStage34()
    case 34:
      easyStage35()
    case 35:
      easyStage36()
    case 36:
      easyStage37()
    case 37:
      easyStage38()
    case 38:
      easyStage39()
    case 39:
      easyStage40()
    case 40:
      easyStage41()
    case 41:
      easyStage42()
    case 42:
      easyStage43()
    case 43:
      easyStage44()
    case 44:
      easyStage45()
    default:
      easyStage6()
    }
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
  
  func easyStage10() {
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
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 8 * height)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 6 * height)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    let seventh = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard, thirdShard, delay, fourthShard, delay, fifth, sixth, seventh]))
  }
  
  func easyStage11() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(1.0)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight +  6 * height)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard, thirdShard, delay, fourthShard]))
  }
  
  func easyStage12() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight )
    shard.setVelocity(ShardVelocity.hardVelocity)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(1.0)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight +  4 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 6 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 8 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 10 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, delay, thirdShard, fourthShard, delay, fifth, sixth]))
  }
  
  func easyStage13() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight )
    shard.setVelocity(ShardVelocity.hardVelocity)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(0.75)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight +  4 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 6 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 8 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 10 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard, delay, thirdShard, delay, fourthShard, delay, fifth, sixth]))
  }
  
  func easyStage14() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMaxStartHeight)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(0.75)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight -  4 * height)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 6 * height)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard, delay, thirdShard, delay, fourthShard, delay, fifth, sixth]))
  }
  
  func easyStage15() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(1.0)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight -  2 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 4 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 6 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let seventh = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([delay, secondShard, thirdShard, fourthShard, fifth, sixth, seventh]))
  }
  
  func easyStage16() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(3.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight -  2 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 4 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 6 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    let seventh = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([sixth, seventh, secondShard, thirdShard, fourthShard, fifth, delay, secondShard, thirdShard, fourthShard, fifth]))
  }
  
  func easyStage17() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(3.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.hardVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight -  2 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let fourthShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 4 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 6 * height)
      shard.setVelocity(ShardVelocity.hardVelocity)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    let seventh = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([sixth, seventh, secondShard, thirdShard, fourthShard, fifth, delay, secondShard, thirdShard, fourthShard, fifth]))
  }
  
  func easyStage18() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight -  2 * height)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    let seventh = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard, sixth, seventh]))
  }
  
  func easyStage19() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight -  2 * height)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    let seventh = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
      shard.setVelocity(ShardVelocity.slugVelocity)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard, sixth, seventh]))
  }
  
  func easyStage20() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let delay = SKAction.waitForDuration(1.5)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 6 * height)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 8 * height)
      self.addChild(shard)
    }

    self.runAction(SKAction.sequence([secondShard, thirdShard, delay, fourth, fifth]))
  }
  
  func easyStage21() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard]))
  }
  
  func easyStage22() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 5 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard]))
  }
  
  func easyStage23() {
    let delay = SKAction.waitForDuration(0.75)
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard, delay, fourth, delay, fifth, delay, sixth]))
  }
  
  func easyStage24() {
    let delay = SKAction.waitForDuration(0.75)
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let thirdShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    let fifth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let sixth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, thirdShard, delay, fourth, delay, fifth, delay, sixth]))
  }
  
  func easyStage25() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard]))
  }
  
  func easyStage26() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard]))
  }
  
  func easyStage27() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard]))
  }
  
  func easyStage28() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard]))
  }
  
  func easyStage29() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard]))
  }
  
  func easyStage30() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard]))
  }
  
  func easyStage31() {
    let delay = SKAction.waitForDuration(0.75)
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.easyVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.easyVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.easyVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.easyVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight + 2 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, delay, third, fourth]))
  }
  
  func easyStage32() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, third, fourth]))
  }
  
  func easyStage33() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, third, fourth]))
  }
  
  func easyStage34() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, third, fourth]))
  }
  
  func easyStage35() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let secondShard = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([secondShard, third, fourth]))
  }
  
  func easyStage36() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([third, fourth]))
  }
  
  func easyStage37() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([third, fourth]))
  }
  
  func easyStage38() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([third, fourth]))
  }
  
  func easyStage39() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.slugVelocity)
    self.addChild(shard)
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.slugVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([third, fourth]))
  }
  
  func easyStage40() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([third, fourth]))
  }
  
  func easyStage41() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([third, fourth]))
  }
  
  func easyStage42() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([third, fourth]))
  }
  
  func easyStage43() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMinStartHeight)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMinStartHeight + 2 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMinStartHeight + 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([third, fourth]))
  }
  
  func easyStage44() {
    var shard = JYLShard.init(direction: ShardDirection.right)
    let height = shard.height()
    shard.position = CGPointMake(rightShardStart, shardMaxStartHeight)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.right)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(rightShardStart, shardMaxStartHeight - 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([third, fourth]))
  }
  
  func easyStage45() {
    var shard = JYLShard.init(direction: ShardDirection.left)
    let height = shard.height()
    shard.position = CGPointMake(leftShardStart, shardMaxStartHeight)
    shard.setVelocity(ShardVelocity.insaneVelocity)
    self.addChild(shard)
    let third = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 2 * height)
      self.addChild(shard)
    }
    let fourth = SKAction.runBlock {
      shard = JYLShard.init(direction: ShardDirection.left)
      shard.setVelocity(ShardVelocity.insaneVelocity)
      shard.position = CGPointMake(leftShardStart, shardMaxStartHeight - 4 * height)
      self.addChild(shard)
    }
    self.runAction(SKAction.sequence([third, fourth]))
  }
  
}
