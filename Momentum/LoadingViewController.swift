//
//  LoadingViewController.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    let viewModel = LoadingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel.delegate = self
        
        viewModel.fetchData()
        
    }
}

extension LoadingViewController: LoadingViewModelProtocol{
    
    func didDownloadData(success: Bool, error: String?) {
        
        
        let when = DispatchTime.now() + 1.5
        DispatchQueue.main.asyncAfter(deadline: when) {
          self.performSegue(withIdentifier: "PresentTabBarSegue", sender: nil)
        }
    }
    
    func noInternetConnection() {
        
    }
    
}
