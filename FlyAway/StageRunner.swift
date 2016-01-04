//
//  StageRunner.swift
//  Fly Away
//
//  Created by John Lee on 12/27/15.
//  Copyright © 2015 wwwww. All rights reserved.
//

import SpriteKit

let StageRunnerActionKey = "StageRunnerActionKey"

let shardMinStartHeight : CGFloat = startPositionYDifference - (50 / scaleFactor)
let shardMaxStartHeight : CGFloat = screenHeight - ((screenHeight / 4) / scaleFactor)
let leftShardStart : CGFloat = -100
let rightShardStart : CGFloat = screenWidth + 100

class StageRunner : SKNode {
  
  var stageIsRunning = false
  let easyStages : EasyStages
  let mediumStages : MediumStages
  
  override init() {
    self.easyStages = EasyStages.init()
    self.mediumStages = MediumStages.init()
    super.init()
    self.addChild(easyStages)
    self.addChild(mediumStages)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func runStage(currentScore: Int) {
    if !self.easyStages.isRunning && currentScore < 10 {
      self.easyStages.runRandomStage()
    }
    if !self.mediumStages.isRunning && currentScore >= 10 {
      self.mediumStages.runRandomStage()
    }
    stageIsRunning = true 
  }
  
  func checkStages() {
    if easyStages.children.isEmpty {
      easyStages.isRunning = false
    }
    if mediumStages.children.isEmpty {
      mediumStages.isRunning = false
    }
  }
  
  
}