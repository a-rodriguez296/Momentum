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
