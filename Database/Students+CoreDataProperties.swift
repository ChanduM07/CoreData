//
//  Students+CoreDataProperties.swift
//  CoreData 1
//
//  Created by Chandan Mondal on 24/11/24.
//
//

import Foundation
import CoreData


extension Students {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Students> {
        return NSFetchRequest<Students>(entityName: "Students")
    }

    @NSManaged public var phoneNumber: String?
    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?

}

extension Students : Identifiable {

}
