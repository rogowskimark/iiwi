//
//  Repository.swift
//  iiwi
//
//  Created by Marek Rogowski on 25/07/2019.
//

import CoreData

open class Repository<T: NSManagedObject, Q: PrimaryKeyQuery> {
    
    internal var context: NSManagedObjectContext
    
    public let creator: Creator<T>
    public let deletor: Deletor<T>
    public let query: Q
    
    public init(context: NSManagedObjectContext, creator: Creator<T>, deletor: Deletor<T>, query: Q) {
        self.context = context
        self.creator = creator
        self.deletor = deletor
        self.query = query
    }
    
    public var allEntities: [T]? {
        let query = Query<T>(context: context)
        return query.allEntities
    }
    
}
