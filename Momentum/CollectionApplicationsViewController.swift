//
//  CollectionApplicationsViewController.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit

class CollectionApplicationsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = ApplicationsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.initializeFetchedResultsController()
        
        collectionView.register(UINib(nibName: "ApplicationsCollectionCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(didSelectDetail(notification:)), name:NSNotification.Name(Constants.Notifications.didSelectTableDetail), object: nil)
    }
    
    func didSelectDetail(notification: Notification){
        let _ = navigationController?.popToRootViewController(animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.Segues.collectionDetailSegue{
            let detailVC = segue.destination as! DetailViewController
            detailVC.application = sender! as? CDApplication
        }
    }
    
}


extension CollectionApplicationsViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowsIn(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let application = viewModel.object(at: indexPath) as! CDApplication
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ApplicationsCollectionCell
        cell.initializeCell(withApplication: application)
        
        return cell
    }
}

extension CollectionApplicationsViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let application = viewModel.object(at: indexPath) as! CDApplication
        performSegue(withIdentifier: Constants.Segues.collectionDetailSegue, sender: application)
       
    }
}
