//
//  GameViewController.swift
//  Skip
//
//  Created by John Lee on 11/29/15.
//  Copyright (c) 2015 wwwww. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit
import CoreData


class JYLMainGameViewController: UIViewController, GKGameCenterControllerDelegate {
  
  var managedObjectContext: NSManagedObjectContext
  
  var gcEnabled = Bool() // Stores if the user has Game Center enabled
  var gcDefaultLeaderBoard = String() // Stores the default leaderboardID
  
  init() {
    // This resource is the same name as your xcdatamodeld contained in your project.
    guard let modelURL = NSBundle.mainBundle().URLForResource("JYLModelMapping", withExtension:"momd") else {
      fatalError("Error loading model from bundle")
    }
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    guard let mom = NSManagedObjectModel(contentsOfURL: modelURL) else {
      fatalError("Error initializing mom from: \(modelURL)")
    }
    let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
    self.managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
    self.managedObjectContext.persistentStoreCoordinator = psc
    
    let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
    let docURL = urls[urls.endIndex-1]
    /* The directory the application uses to store the Core Data store file.
    This code uses a file named "DataModel.sqlite" in the application's documents directory.
    */
    let storeURL = docURL.URLByAppendingPathComponent("JYLModelMapping.sqlite")
    do {
      try psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
    } catch {
      fatalError("Error migrating store: \(error)")
    }
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    self.view = SKView(frame: UIScreen.mainScreen().bounds)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "presentGameCenter:", name:"showGameCenter", object: nil)
    let sceneSize = CGSizeMake(self.view.frame.width, self.view.frame.height)
    let scene = JYLMainGameScene.init(size: sceneSize, managedObjectContext: self.managedObjectContext)
    scene.mainVc = self
    let skView = self.view as! SKView
    skView.showsFPS = false
    skView.showsNodeCount = false
    skView.showsPhysics = false
    self.authenticateLocalPlayer()
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
  
  // MARK - Game Center
  
  func authenticateLocalPlayer() {
    let localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
    
    localPlayer.authenticateHandler = {(ViewController, error) -> Void in
      if((ViewController) != nil) {
        self.presentViewController(ViewController!, animated: true, completion: nil)
      } else if (localPlayer.authenticated) {
        self.gcEnabled = true
        
        localPlayer.loadDefaultLeaderboardIdentifierWithCompletionHandler({ (leaderboardIdentifer: String?, error: NSError?) -> Void in
          if error != nil {
            print(error)
          } else {
            self.gcDefaultLeaderBoard = leaderboardIdentifer!
          }
        })
        
        
      } else {
        self.gcEnabled = false
        print("Local player could not be authenticated, disabling game center")
        print(error)
      }
      
    }
  }
  
  func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
    gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)

  }
  
  func presentGameCenter(notification: NSNotification) {
    let gcVC: GKGameCenterViewController = GKGameCenterViewController()
    gcVC.gameCenterDelegate = self
    gcVC.viewState = GKGameCenterViewControllerState.Leaderboards
    gcVC.leaderboardIdentifier = "HighScores"
    self.presentViewController(gcVC, animated: true, completion: nil)
  }
}
