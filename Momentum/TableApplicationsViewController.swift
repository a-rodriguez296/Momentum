//
//  TableApplicationsViewController.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit

class TableApplicationsViewController: UIViewController {

    
        @IBOutlet weak var table: UITableView!
    
    
    let viewModel = ApplicationsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewModel.initializeFetchedResultsController()
        
        table.register(UINib.init(nibName: "ApplicationsViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
  
    }
}

extension TableApplicationsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsIn(section: section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let application = viewModel.object(at: indexPath) as! CDApplication
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ApplicationsViewCell
        
       cell.lblApplication.text = application.name!
        
        return cell
    }
    
    
}
