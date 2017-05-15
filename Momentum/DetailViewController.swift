//
//  DetailViewController.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var cstToTopLayout: NSLayoutConstraint!
    @IBOutlet weak var cstToThumbanil: NSLayoutConstraint!
    
    @IBOutlet weak var btnAppThumbnail: UIButton!
    @IBOutlet weak var txtApplicationDescription: UITextView!
    @IBOutlet weak var lblAppTitle: UILabel!
    
    var application:CDApplication?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnAppThumbnail.setBackgroundImage(application?.photo?.image(), for: .normal)
        lblAppTitle.text = application?.name!
        txtApplicationDescription.text = application?.summary!
        
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let _ = navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        txtApplicationDescription.setContentOffset(.zero, animated: true)
    }
    
    
    @IBAction func didPressThumbnail(_ sender: Any) {
        
        btnAppThumbnail.isHidden = true
        
        NSLayoutConstraint.deactivate([cstToThumbanil])
        NSLayoutConstraint.activate([cstToTopLayout])
        view.layoutIfNeeded()
    }
    
}
