//
//  LoadingViewModel.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import ReachabilitySwift


class LoadingViewModel{
    
     weak var delegate:LoadingViewModelProtocol?
    
    
    func fetchData(){
        
        //Data status
        let isDataAvailable = CoreDataOperations.isDataAvailable()
        
        //Network status
        let reachabilityObject = Reachability()!
        let networkStatus = reachabilityObject.currentReachabilityStatus
        
        
        //Cases
        
        // No data and no internet
        if !isDataAvailable  && networkStatus == .notReachable{
            
            //Display alert
            delegate?.didDownloadData(success: false, error: NSLocalizedString("You need to have an internet connection the first time you run the app.", comment: ""))
            delegate?.noInternetConnection()
        }
        
        //No data and there is an internet connection
        else if !isDataAvailable && networkStatus != .notReachable{
            
            //Donwload data
            
            fetchDataFromNetwork()
        }
        //Theres data available, do nothing
        else{
            delegate?.didDownloadData(success: true, error: nil)
        }
    }
    
    
    fileprivate func fetchDataFromNetwork(){
        
        MomentumApiClient.sharedInstance.getTopApplications(completion: {[unowned self] (success, error) in
            
            if success{
                self.delegate?.didDownloadData(success: true, error: nil)
            }
            else{
                self.delegate?.didDownloadData(success: false, error:  NSLocalizedString("An error occured. Try again later", comment: ""))
            }
        })
    }

    
}
