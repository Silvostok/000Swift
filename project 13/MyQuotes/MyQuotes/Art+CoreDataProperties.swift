//
//  Art+CoreDataProperties.swift
//  MyQuotes
//
//  Created by Miguel Angel Rubio Caballero on 20/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Art {

    @NSManaged var title: String?
    @NSManaged var purchased: NSNumber?
    @NSManaged var imageName: String?
    @NSManaged var productIndentifier: String?

}
