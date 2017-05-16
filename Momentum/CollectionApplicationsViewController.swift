//
//  CollectionApplicationsViewController.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit
import MagicalRecord

class CollectionApplicationsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = ApplicationsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        
        collectionView.register(UINib(nibName: Constants.NibNames.ApplicationsCollection.cellNibName, bundle: nil), forCellWithReuseIdentifier: Constants.CellIdentifiers.ApplicationsCollection.cell)
        
        initializeLongPressGesture()
        
    }
    
    func setupViewModel(){
        viewModel.delegate = self
        viewModel.initializeFetchedResultsController()
    }
    
    
    func initializeLongPressGesture(){
        let longPressGR = UILongPressGestureRecognizer(target: self, action:#selector(handleLongPress(gestureReconizer:)))
        longPressGR.minimumPressDuration = 0.5
        longPressGR.delaysTouchesBegan = true
        collectionView.addGestureRecognizer(longPressGR)
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifiers.ApplicationsCollection.cell, for: indexPath) as! ApplicationsCollectionCell
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


//Long Press gesture recognizer
extension CollectionApplicationsViewController{
    
    func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizerState.ended {
            return
        }
        
        let p = gestureReconizer.location(in: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: p)
        
        
        if let index = indexPath {
            let application = viewModel.object(at: index) as! CDApplication
            showAlertController(withApplicationName: application.name!, indexPath: index)
        } else {
            print("Could not find index path")
        }
    }
    
    func showAlertController(withApplicationName name: String, indexPath:IndexPath){
        
        let alertController = UIAlertController(title: "Attention",message: "Are you sure you want to delete " + name,preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK",style: .destructive){ (alert) in
            self.viewModel.deleteObjectAt(indexPath: indexPath)
        }

        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (alert) in
            
        }
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension CollectionApplicationsViewController: ApplicationsViewModelProtocol{
    
    func didDeleteObject(atIndexPath indexPath: IndexPath) {
        collectionView.beginInteractiveMovementForItem(at: indexPath)
        collectionView.deleteItems(at: [indexPath])
        collectionView.endInteractiveMovement()
    }
}
