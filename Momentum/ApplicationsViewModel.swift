//
//  ApplicationsViewModel.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import Foundation
import MagicalRecord

class ApplicationsViewModel: NSObject {
    
    weak var delegate:ApplicationsViewModelProtocol?
   
    
    lazy var fetchedResultsController:NSFetchedResultsController<CDApplication> = {
        
        
        let applicationsFetchedRequest = NSFetchRequest<CDApplication>(entityName: CDApplication.mr_entityName())
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        applicationsFetchedRequest.sortDescriptors = [sortDescriptor]
        
        
        let frc = NSFetchedResultsController(fetchRequest: applicationsFetchedRequest, managedObjectContext: NSManagedObjectContext.mr_default(), sectionNameKeyPath: nil, cacheName: nil)
        
        frc.delegate = self
        
        return frc

    }()
    
    func initializeFetchedResultsController(){
        do {
            try fetchedResultsController.performFetch()
            
        }
        catch {
            print("An error occurred")
        }
    }
    
    
    func numberOfRowsIn(section: Int) -> Int{
        
        guard let sections = fetchedResultsController.sections else{
            return 0
        }
        let currentSection = sections[section]
        return currentSection.numberOfObjects
    }
    
    
    func object(at indexPath: IndexPath) -> NSManagedObject{
        return fetchedResultsController.object(at: indexPath)
        
    }
    
    func deleteObjectAt(indexPath index:IndexPath){
        let object = self.object(at: index)
        object.mr_deleteEntity()
    }
}

extension ApplicationsViewModel: NSFetchedResultsControllerDelegate{
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if type == .delete{
            delegate?.didDeleteObject(atIndexPath: indexPath!)
        }
    }

}
