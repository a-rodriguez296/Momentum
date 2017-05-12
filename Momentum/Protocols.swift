//
//  Protocols.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation

protocol LoadingViewModelProtocol:class {
    
    func didDownloadData(success:Bool, error:String?)
    func noInternetConnection()
}


protocol ApplicationsViewModelProtocol:class{
    
    func didDeleteObject(atIndexPath indexPath: IndexPath)
}
