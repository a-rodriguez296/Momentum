//
//  ApplicationsResponse.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import SwiftyJSON
import MagicalRecord

struct ApplicationsResponse{
    
    
    let applicationsArray:Array<Application>
    var categoriesArray = Array<String>()
    
    init(json: JSON) {
        
        
        var responseArray = Array<Application>()
        
        for applicationJSON in json[Constants.Endpoints.TopApplications.feed][Constants.Endpoints.TopApplications.entry].arrayValue{
            
            let auxApplication = Application(json: applicationJSON)
            responseArray.append(auxApplication)
            
        }
        
        applicationsArray = responseArray
        
    }
}

