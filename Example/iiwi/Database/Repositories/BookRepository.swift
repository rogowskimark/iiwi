//
//  BookRepository.swift
//  iiwi_Example
//
//  Created by Marek Rogowski on 25/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import CoreData
import iiwi

class BookRepository: Repository<Book, ISBNQuerable<Book>> {
    
    init(context: NSManagedObjectContext) {
        let creator = Creator<Book>(context: context)
        let deletor = Deletor<Book>(context: context)
        let query = ISBNQuerable<Book>(context: context)
        
        super.init(context: context, creator: creator, deletor: deletor, query: query)
    }
    
    public func create(isbn: String, title: String) -> Book? {
        guard let book = creator.create() else {
            return nil
        }
        
        book.isbn = isbn
        book.title = title
    
        return book
    }
    
}
