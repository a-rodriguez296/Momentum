//
//  AppDelegate.swift
//  Momentum
//
//  Created by Alejandro Rodriguez on 5/11/17.
//  Copyright © 2017 ARF. All rights reserved.
//

import UIKit
import MagicalRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //Initialize Core Data
        initializeCoreData()
        
        
        return true
    }
    
    func initializeCoreData(){
        MagicalRecord.setupCoreDataStack(withAutoMigratingSqliteStoreNamed: "Model")
        MagicalRecord.setLoggingLevel(.error)
        autoSave()
    }

    func autoSave(){
        NSManagedObjectContext.mr_default().mr_saveToPersistentStore { (success, error) in
            if let e = error{
                print(e.localizedDescription)
            }
        }
        
        //Block to "auto call" this function every 3 seconds
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.autoSave()
        }
    }
}

