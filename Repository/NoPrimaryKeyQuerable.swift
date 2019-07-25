//
//  NoPrimaryKeyQuerable.swift
//  iiwi
//
//  Created by Marek Rogowski on 25/07/2019.
//

import CoreData

public class NoPrimaryKeyQuerable<T: NSManagedObject>: PrimaryKeyQuery {
    public typealias EntityType = T
    public typealias KeyIndexType = Void
    
    public let key = ""
    public let keyPredicateFormat = ""
    public let query: Query<T>
    
    init(context: NSManagedObjectContext) {
        self.query = Query<T>(context: context)
    }
    
}
