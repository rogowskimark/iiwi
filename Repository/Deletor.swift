//
//  Deletor.swift
//  iiwi
//
//  Created by Marek Rogowski on 25/07/2019.
//

import CoreData

open class Deletor<T: NSManagedObject> {
    
    private let context: NSManagedObjectContext
    private let query: Query<T>
    
    public init(context: NSManagedObjectContext) {
        self.context = context
        self.query = Query<T>(context: context)
    }
    
    public func delete(entity: T)  {
        context.delete(entity)
    }
    
    public func deleteAll() {
        guard let allEntities = query.allEntities else {
            return
        }
        
        for entity in allEntities {
            context.delete(entity)
        }
    }
    
}
