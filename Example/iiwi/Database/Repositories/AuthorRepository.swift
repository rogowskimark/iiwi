//
//  AuthorRepository.swift
//  iiwi_Example
//
//  Created by Marek Rogowski on 25/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import CoreData
import iiwi

class AuthorRepository: Repository<Author, IdUUIDQuerable<Author>> {
    
    init(context: NSManagedObjectContext) {
        let creator = Creator<Author>(context: context)
        let deletor = Deletor<Author>(context: context)
        let query = IdUUIDQuerable<Author>(context: context)
        
        super.init(context: context, creator: creator, deletor: deletor, query: query)
    }
    
    public func create(id: UUID, firstname: String, lastname: String) -> Author? {
        guard let author = creator.create() else {
            return nil
        }
        
        author.id = id
        author.firstname = firstname
        author.lastname = lastname
        
        return author
    }
    
}
