//
//  Creator.swift
//  iiwi
//
//  Created by Marek Rogowski on 25/07/2019.
//

import CoreData

open class Creator<T: NSManagedObject> {
    
    internal let context: NSManagedObjectContext
    
    public init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    public func create() -> T? {
        return T(context: context)
    }
    
}

