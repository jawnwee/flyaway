//
//  GameViewController.swift
//  Skip
//
//  Created by John Lee on 11/29/15.
//  Copyright (c) 2015 wwwww. All rights reserved.
//

import UIKit
import SpriteKit

class OBMainGameViewController: UIViewController {
  
  override func loadView() {
    self.view = SKView(frame: UIScreen.mainScreen().bounds)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let sceneSize = CGSizeMake(self.view.frame.width, self.view.frame.height)
    let scene = OBMainGameScene(size:sceneSize)
    let skView = self.view as! SKView
    skView.showsFPS = true
    skView.showsNodeCount = true
    skView.ignoresSiblingOrder = true
    scene.size = self.view.frame.size
    scene.backgroundColor = SKColor.whiteColor()
    skView.presentScene(scene)
  }

  override func shouldAutorotate() -> Bool {
    return true
  }

  override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
    if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
        return .AllButUpsideDown
    } else {
      return .All
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }

  override func prefersStatusBarHidden() -> Bool {
    return true
  }
}
