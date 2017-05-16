//
//  DetailViewModel.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/16/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import MagicalRecord

class DetailViewModel {
    
    weak var delegate:DetailViewModelProtocol?
    
    func delete(application: CDApplication){
        application.mr_deleteEntity()
        delegate?.didDeleteApplication()
    }
    
}
