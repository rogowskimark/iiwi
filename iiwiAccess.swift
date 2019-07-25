//
//  iiwiAccess.swift
//  iiwi
//
//  Created by Marek Rogowski on 25/07/2019.
//

import CoreData

open class iiwiAccess {
    private let context: NSManagedObjectContext
    
    public init(withContext context: NSManagedObjectContext) {
        self.context = context
    }
    
    public func save() throws {
        try context.save()
    }
    
    public func performBlock(_ block: @escaping (() -> Void)) {
        context.perform(block)
    }
    
    public func performAndWait(_ block: @escaping (() -> Void)) {
        context.performAndWait(block)
    }
    
    public func deleteAll() {
        try? save()
    }
}
