//
//  UserModel+CoreDataProperties.swift
//  
//
//  Created by David Norman on 8/29/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension UserModel {

    @NSManaged var id: String?
    @NSManaged var userName: String?
    @NSManaged var userOwnedAccount: AccountModel?
    @NSManaged var secondUserOwnedAccount: AccountModel?

}
