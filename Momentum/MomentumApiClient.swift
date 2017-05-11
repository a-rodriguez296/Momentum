//
//  MomentumApiClient.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias TopApplicationsClosure = ( _: Bool, _:String?) -> Void

protocol RappiClientProtocolDelegate:class {
    func didDownloadData(success:Bool, error:String?)
}

class MomentumApiClient{
    
    static let sharedInstance = MomentumApiClient()
    
    weak var delegate:RappiClientProtocolDelegate?
}

extension MomentumApiClient{
    
    
    func getTopApplications(completion:@escaping TopApplicationsClosure){
        
        Alamofire.request(MomentumRouter.topApplications).responseJSON { (response) in
            
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let applicationsResponse = ApplicationsResponse(json: json)
                CoreDataOperations.saveApplications(with: applicationsResponse)
                completion(true, nil)
            case .failure(let error):
                completion(false, error.localizedDescription)
            }
        }
    }
}
