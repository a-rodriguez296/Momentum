//
//  CDApplication+CoreDataProperties.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import CoreData


extension CDApplication {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDApplication> {
        return NSFetchRequest<CDApplication>(entityName: "CDApplication");
    }

    @NSManaged public var name: String?
    @NSManaged public var summary: String?
    @NSManaged public var thumbnailURL: String?
    @NSManaged public var photo: CDPhoto?

}
