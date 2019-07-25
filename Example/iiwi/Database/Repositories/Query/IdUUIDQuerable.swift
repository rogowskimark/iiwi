//
//  IdUUIDQuerable.swift
//  iiwi_Example
//
//  Created by Marek Rogowski on 25/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import CoreData
import iiwi

public class IdUUIDQuerable<T: NSManagedObject>: PrimaryKeyQuery {
    public typealias EntityType = T
    public typealias KeyIndexType = UUID
    
    public let key = "id"
    public let keyPredicateFormat = "id = %@"
    public let query: Query<T>
    
    init(context: NSManagedObjectContext) {
        self.query = Query<T>(context: context)
    }
    
}
