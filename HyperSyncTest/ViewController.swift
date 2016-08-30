//
//  ViewController.swift
//  HyperSyncTest
//
//  Created by David Norman on 8/29/16.
//

import UIKit
import Sync
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLocalItems { (error) in
            print("error: \( error)")
            self.getAllUsers()
        }
    }

    func fetchLocalItems(completion: (NSError?) -> Void) {
        let url = NSURL(string: "global-nested-users.json")!
        let filePath = NSBundle.mainBundle().pathForResource(url.URLByDeletingPathExtension?.absoluteString, ofType: url.pathExtension)!
        let data = NSData(contentsOfFile: filePath)!
        let json = try! NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String: AnyObject]

        Sync.changes(json["user_model"] as! Array, inEntityNamed: "UserModel", dataStack: AppDelegate.sharedDataStack(), operations: [.Insert, .Update], completion: { error in
                completion(error)
        })
    }

    func getAllUsers() {

        let fetchRequest = NSFetchRequest(entityName: "UserModel")

        do {
            let userModels = try AppDelegate.sharedDataStack().mainContext.executeFetchRequest(fetchRequest)

            for model in userModels as! [UserModel] {
                print("username: \(model.userName!)")
            }

        } catch let error {
            print(error)
        }
    }

    func getAllAccounts() {

        let fetchRequest = NSFetchRequest(entityName: "AccountModel")

        do {
            let accountModels = try AppDelegate.sharedDataStack().mainContext.executeFetchRequest(fetchRequest)

            for model in accountModels as! [AccountModel] {
                print(model.accountName)
                print(model.id)
            }

        } catch let error {
            print(error)
        }
    }

    func getAllTransactions() {

        let fetchRequest = NSFetchRequest(entityName: "TransactionModel")

        do {
            let transactionModels = try AppDelegate.sharedDataStack().mainContext.executeFetchRequest(fetchRequest)

            for model in transactionModels as! [TransactionModel] {
                print(model.amount)
                print(model.id)
            }

        } catch let error {
            print(error)
        }
    }

}

