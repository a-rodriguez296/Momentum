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
            delegate?.didDownloadData(success: false, error: NSLocalizedString("Debes tener Internet la primera vez que usas la aplicación", comment: ""))
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
                self.delegate?.didDownloadData(success: false, error:  NSLocalizedString("Ocurrió un error. Intenta de nuevo más tarde", comment: ""))
            }
        })
    }

    
}
