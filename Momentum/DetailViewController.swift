//
//  DetailViewController.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblApplicationName: UILabel!
    
    var application:CDApplication?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblApplicationName.text = application!.name!
    }

}
