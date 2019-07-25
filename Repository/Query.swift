//
//  Query.swift
//  iiwi
//
//  Created by Marek Rogowski on 25/07/2019.
//

import CoreData

open class Query<T: NSManagedObject> {
    
    private let context: NSManagedObjectContext
    
    public init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    public var allEntities: [T]? {
        return entities(with: nil, fetchLimit: nil, sortDescriptors: nil)
    }
    
    public func entities(with predicate: NSPredicate?, fetchLimit: Int?, sortDescriptors: [NSSortDescriptor]?) -> [T]? {
        let fr = T.fetchRequest()
        
        if let predicate = predicate {
            fr.predicate = predicate
        }
        
        if let fetchLimit = fetchLimit {
            fr.fetchLimit = fetchLimit
        }
        
        if let sortDescriptors = sortDescriptors {
            fr.sortDescriptors = sortDescriptors
        }
        
        do {
            return try context.fetch(fr) as? [T]
        } catch {
            return nil
        }
    }
    
}
