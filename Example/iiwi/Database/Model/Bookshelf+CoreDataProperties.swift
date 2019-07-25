//
//  Bookshelf+CoreDataProperties.swift
//  iiwi_Example
//
//  Created by Marek Rogowski on 25/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//
//

import Foundation
import CoreData


extension Bookshelf {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookshelf> {
        return NSFetchRequest<Bookshelf>(entityName: "Bookshelf")
    }

    @NSManaged public var id: Int64
    @NSManaged public var numberOfShelfs: Int64
    @NSManaged public var books: NSSet?

}

// MARK: Generated accessors for books
extension Bookshelf {

    @objc(addBooksObject:)
    @NSManaged public func addToBooks(_ value: Book)

    @objc(removeBooksObject:)
    @NSManaged public func removeFromBooks(_ value: Book)

    @objc(addBooks:)
    @NSManaged public func addToBooks(_ values: NSSet)

    @objc(removeBooks:)
    @NSManaged public func removeFromBooks(_ values: NSSet)

}
