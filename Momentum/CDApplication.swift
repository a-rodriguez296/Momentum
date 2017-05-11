//
//  CDApplication+CoreDataClass.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import CoreData
import MagicalRecord

@objc(CDApplication)
public class CDApplication: NSManagedObject {

    convenience init(application: Application, context: NSManagedObjectContext) {
        
        let entity = NSEntityDescription.entity(forEntityName: CDApplication.mr_entityName(), in: context)
        self.init(entity: entity!, insertInto: context)
        self.name = application.appName
        self.summary = application.summary
        self.thumbnailURL = application.thumbnailURL
    }
    
    func assignPhoto(image: UIImage){
        
        self.photo = CDPhoto(image: image, context: NSManagedObjectContext.mr_default())
        
    }
    
}
