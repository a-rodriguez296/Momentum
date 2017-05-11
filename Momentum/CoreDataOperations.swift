//
//  CoreDataOperations.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import MagicalRecord

class CoreDataOperations {
    
    
    class func saveApplications(with applicationsResponse: ApplicationsResponse){
        
        let applications = applicationsResponse.applicationsArray
        
        //Iterate over all the applications and save them to the context. The autoSave() function, on the appDelegate, takes care of saving the data to disk
        for application in applications{
            
            let _ = CDApplication(application: application, context: NSManagedObjectContext.mr_default())
        }
    }
    
    
    class func isDataAvailable() -> Bool{
        
        //Determine if there's data available
        guard let _ = CDApplication.mr_findFirst() else{
            return false
        }
        
        return true
    }
}


