//
//  BookshelfRepository.swift
//  iiwi_Example
//
//  Created by Marek Rogowski on 25/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import CoreData
import iiwi

class BookshelfRepository: Repository<Bookshelf, IdInt64Querable<Bookshelf>> {
    
    init(context: NSManagedObjectContext) {
        let creator = Creator<Bookshelf>(context: context)
        let deletor = Deletor<Bookshelf>(context: context)
        let query = IdInt64Querable<Bookshelf>(context: context)
        
        super.init(context: context, creator: creator, deletor: deletor, query: query)
    }
    
    public func create(id: Int64, numberOfShelfs: Int64) -> Bookshelf? {
        guard let bookshelf = creator.create() else {
            return nil
        }
        
        bookshelf.id = id
        bookshelf.numberOfShelfs = numberOfShelfs
        
        return bookshelf
    }
    
}
