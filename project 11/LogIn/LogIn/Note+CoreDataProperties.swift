//
//  Note+CoreDataProperties.swift
//  LogIn
//
//  Created by Miguel Angel Rubio Caballero on 07/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Note {

    @NSManaged var date: NSDate?
    @NSManaged var noteText: String?

}
