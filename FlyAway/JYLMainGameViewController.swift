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
import StoreKit


class JYLMainGameViewController: UIViewController, GKGameCenterControllerDelegate, SKProductsRequestDelegate, SKPaymentTransactionObserver {
  
  var managedObjectContext: NSManagedObjectContext
  
  var gcEnabled = Bool() // Stores if the user has Game Center enabled
  var gcDefaultLeaderBoard = String() // Stores the default leaderboardID
  var list = [SKProduct]()
  var p = SKProduct()
  var adsRemoved = false
  var isRestoringPurchases = true
  
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
    if(SKPaymentQueue.canMakePayments()) {
      let productID:NSSet = NSSet(objects: "wwwww.FlyAway.removeAds")
      let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
      
      request.delegate = self
      request.start()
    } else {
      print("please enable IAPS")
    }
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
  
  func purchaseRemoveAds() {
    for product in list {
      let prodID = product.productIdentifier
      if(prodID == "wwwww.FlyAway.removeAds") {
        p = product
        buyProduct()
        break;
      }
    }
  }
  
  func removeAds() {
    let player = GKLocalPlayer.localPlayer()
    let moc = self.managedObjectContext
    let userFetch = NSFetchRequest(entityName: "User")
    let user : User
    do {
      let result = try moc.executeFetchRequest(userFetch)
      if result.isEmpty {
        user = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: self.managedObjectContext) as! User
        user.highScore = 0
        user.hasAds = true
        user.mute = false
        user.playerId = player.playerID
      } else {
        user = result.first as! User
        user.hasAds = false
      }
      try moc.save()
    } catch {
      fatalError("Failed to fetch user: \(error)")
    }
    adsRemoved = true
    if isRestoringPurchases {
      let alert = UIAlertController(title: "Thank You", message:"Your purchase(s) were restored.", preferredStyle: .Alert)
      alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
      self.presentViewController(alert, animated: true){}
    }
  }
  
  // MARK - Store Kit
  func buyProduct() {
    let pay = SKPayment(product: p)
    SKPaymentQueue.defaultQueue().addTransactionObserver(self)
    SKPaymentQueue.defaultQueue().restoreCompletedTransactions()
    if adsRemoved {
      SKPaymentQueue.defaultQueue().addPayment(pay as SKPayment)
    }
  }
  
  func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
    let myProduct = response.products
    for product in myProduct {
      list.append(product )
    }
  }
  
  func paymentQueueRestoreCompletedTransactionsFinished(queue: SKPaymentQueue) {
    for transaction in queue.transactions {
      let t: SKPaymentTransaction = transaction
      
      let prodID = t.payment.productIdentifier as String
      
      switch prodID {
      case "wwwww.FlyAway.removeAds":
        removeAds()
      default:
        print("IAP not setup")
      }
    }
    if adsRemoved == false {
      isRestoringPurchases = false
    }
  }
  
  func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
    for transaction:AnyObject in transactions {
      let trans = transaction as! SKPaymentTransaction
      
      switch trans.transactionState {
        
      case .Purchased:
        
        let prodID = p.productIdentifier as String
        switch prodID {
        case "wwwww.FlyAway.removeAds":
          removeAds()
        default:
          print("IAP not setup")
        }
        
        queue.finishTransaction(trans)
        break;
      case .Failed:
        queue.finishTransaction(trans)
        break;
      default:
        break;
        
      }
    }
  }
  
  func finishTransaction(trans:SKPaymentTransaction) {
    SKPaymentQueue.defaultQueue().finishTransaction(trans)
  }
  
  func paymentQueue(queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]) {
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
