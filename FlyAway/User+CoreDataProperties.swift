//
//  User+CoreDataProperties.swift
//  Fly Away
//
//  Created by John Lee on 1/4/16.
//  Copyright © 2016 wwwww. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

  @NSManaged var hasAds: NSNumber?
  @NSManaged var highScore: NSNumber?
  @NSManaged var playerId: String?

}
