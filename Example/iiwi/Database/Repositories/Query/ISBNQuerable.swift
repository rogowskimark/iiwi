//
//  ISBNQuerable.swift
//  iiwi_Example
//
//  Created by Marek Rogowski on 25/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import CoreData
import iiwi

public class ISBNQuerable<T: NSManagedObject>: PrimaryKeyQuery {
    public typealias EntityType = T
    public typealias KeyIndexType = String
    
    public let key = "isbn"
    public let keyPredicateFormat = "isbn = %@"
    public let query: Query<T>
    
    init(context: NSManagedObjectContext) {
        self.query = Query<T>(context: context)
    }
    
}
