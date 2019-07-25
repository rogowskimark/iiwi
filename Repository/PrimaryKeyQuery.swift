//
//  PrimaryKeyQuery.swift
//  iiwi
//
//  Created by Marek Rogowski on 25/07/2019.
//

import CoreData

public protocol PrimaryKeyQuery {
    
    associatedtype EntityType: NSManagedObject
    associatedtype KeyIndexType
    
    var key: String { get }
    var keyPredicateFormat: String { get }
    var query: Query<EntityType> { get }
    
    func entity(with: KeyIndexType) -> EntityType?
    
}

extension PrimaryKeyQuery {
    
    public func entity(with key: KeyIndexType) -> EntityType? {
        return query.entities(with: NSPredicate(format: keyPredicateFormat, argumentArray: [key]), fetchLimit: 1, sortDescriptors: nil)?.first
    }
    
}
