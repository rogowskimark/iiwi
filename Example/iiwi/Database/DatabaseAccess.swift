//
//  DatabaseAccess.swift
//  iiwi_Example
//
//  Created by Marek Rogowski on 25/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import CoreData
import iiwi

public class DatabaseAccess {
    let bookshelfs: BookshelfRepository
    let authors: AuthorRepository
    let books: BookRepository
    
    private let context: NSManagedObjectContext
    
    init(withContext context: NSManagedObjectContext) {
        self.context = context
        
        self.bookshelfs = BookshelfRepository(context: context)
        self.authors = AuthorRepository(context: context)
        self.books = BookRepository(context: context)
    }
    
    public static let view: DatabaseAccess = {
        return DatabaseAccess(withContext: iiwi.viewContext)
    }()
    
    static var newBackground: DatabaseAccess {
        return DatabaseAccess(withContext: iiwi.newBackgroundContext())
    }
    
    public func save() throws {
        try context.save()
    }
    
    public func performBlock(_ block: @escaping (() -> Void)) {
        context.perform(block)
    }
    
    public func performAndWait(_ block: @escaping (() -> Void)) {
        context.performAndWait(block)
    }
    
    public func deleteAll() {
        try? save()
    }
}
