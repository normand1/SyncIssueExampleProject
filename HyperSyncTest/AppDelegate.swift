//
//  AppDelegate.swift
//  HyperSyncTest
//
//  Created by David Norman on 8/29/16.
//

import UIKit
import DATAStack


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var dataStack: DATAStack = DATAStack(modelName: "HyperExample")

    class func sharedAppDelegate() -> AppDelegate {
      return UIApplication.sharedApplication().delegate as! AppDelegate
    }

    class func sharedDataStack() -> DATAStack {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).dataStack
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }

}

