//
//  ClassData+CoreDataProperties.swift
//  NewCoredata
//
//  Created by H S Negi on 12/07/23.
//
//

import Foundation
import CoreData


extension ClassData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClassData> {
        return NSFetchRequest<ClassData>(entityName: "ClassData")
    }

    @NSManaged public var date: Date?
    @NSManaged public var studentName: String?
    @NSManaged public var rollNo: Int64
    @NSManaged public var monitor: Bool

}

extension ClassData : Identifiable {

}
