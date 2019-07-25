//
//  DatabaseAccess.swift
//  iiwi_Example
//
//  Created by Marek Rogowski on 25/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import CoreData
import iiwi

public class DatabaseAccess: iiwiAccess {
    let bookshelfs: BookshelfRepository
    let authors: AuthorRepository
    let books: BookRepository
    
    override init(withContext context: NSManagedObjectContext) {
        self.bookshelfs = BookshelfRepository(context: context)
        self.authors = AuthorRepository(context: context)
        self.books = BookRepository(context: context)
        
        super.init(withContext: context)
    }
    
    public static let view: DatabaseAccess = {
        return DatabaseAccess(withContext: iiwi.viewContext)
    }()
    
    static var newBackground: DatabaseAccess {
        return DatabaseAccess(withContext: iiwi.newBackgroundContext())
    }
    
}
