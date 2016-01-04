//
//  JYLButton.swift
//  Fly Away
//
//  Created by John Lee on 1/3/16.
//  Copyright © 2016 wwwww. All rights reserved.
//

import SpriteKit

let RestartButtonName = "restart"
let ShareButtonName = "share"
let RateButtonName = "rate"
let ScoresButtonName = "scores"

enum ButtonType: UInt32 {
  case restart = 1
  case share = 2
  case rate = 4
  case scores = 8
}


class JYLButton: SKSpriteNode {
  
  init(buttonType : ButtonType) {
    let texture : SKTexture
    let name : String
    switch buttonType {
    case ButtonType.restart:
      texture = SKTexture.init(imageNamed: "restart")
      name = RestartButtonName
    case ButtonType.scores:
      texture = SKTexture.init(imageNamed: "scores")
      name = ScoresButtonName
    case ButtonType.rate:
      texture = SKTexture.init(imageNamed: "rate")
      name = RateButtonName
    case ButtonType.share:
      texture = SKTexture.init(imageNamed: "share")
      name = ShareButtonName
    }
    super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
    self.name = name
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}