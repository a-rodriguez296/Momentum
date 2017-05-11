//
//  CDPhoto+CoreDataClass.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import CoreData
import MagicalRecord

@objc(CDPhoto)
public class CDPhoto: NSManagedObject {

    convenience init(image: UIImage, context: NSManagedObjectContext) {
        
        let entity = NSEntityDescription.entity(forEntityName: CDPhoto.mr_entityName(), in: context)
        self.init(entity: entity!, insertInto: context)
        photoData = UIImageJPEGRepresentation(image, 1.0) as NSData!
    }
    
    func image() -> UIImage{
        return UIImage(data: photoData! as Data)!
    }
}
