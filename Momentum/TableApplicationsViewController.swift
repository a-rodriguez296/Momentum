//
//  TableApplicationsViewController.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class TableApplicationsViewController: UIViewController {
    
    
    @IBOutlet weak var table: UITableView!
    
    
    let viewModel = ApplicationsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel.initializeFetchedResultsController()
        viewModel.delegate = self
        
        table.register(UINib.init(nibName: "ApplicationsViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.Segues.tableDetailSegue{
            
            let detailVC = segue.destination as! DetailViewController
            detailVC.application = sender! as? CDApplication
        }
    }
    
}

extension TableApplicationsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsIn(section: section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let application = viewModel.object(at: indexPath) as! CDApplication
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ApplicationsViewCell
        
        cell.initializeCell(withApplication: application)
        cell.rightButtons = [MGSwipeButton.init(title: "Delete", backgroundColor: .red, callback: { (cell) -> Bool in
            let auxIndex = self.table.indexPath(for: cell)
            self.viewModel.deleteObjectAt(indexPath: auxIndex!)
            return true
        })]
        
        return cell
    }
}


extension TableApplicationsViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let application = viewModel.object(at: indexPath) as! CDApplication
        performSegue(withIdentifier: Constants.Segues.tableDetailSegue, sender: application)
    }
}


extension TableApplicationsViewController: ApplicationsViewModelProtocol{
    
    func didDeleteObject(atIndexPath indexPath: IndexPath) {
        table.beginUpdates()
        table.deleteRows(at: [indexPath], with: .fade)
        table.endUpdates()
    }
}
