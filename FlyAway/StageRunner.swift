//
//  StageRunner.swift
//  Fly Away
//
//  Created by John Lee on 12/27/15.
//  Copyright © 2015 wwwww. All rights reserved.
//

import Foundation

let StageRunnerActionKey = "StageRunnerActionKey"

class StageRunner : NSObject {
  
  var stageIsRunning = false
  
  func startRunner(currentScore: NSInteger) {
    if !stageIsRunning {
      stageIsRunning = true
    }
  }
  
}