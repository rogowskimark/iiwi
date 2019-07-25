//
//  ViewController.swift
//  iiwi
//
//  Created by rogowskimark on 07/24/2019.
//  Copyright (c) 2019 rogowskimark. All rights reserved.
//

import UIKit
import iiwi

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        iiwi.initialize(model: "iiwi", inBundle: .main)
        
        DatabaseAccess.view.deleteAll()
        
        guard let bookshelf = DatabaseAccess.view.bookshelfs.create(id: 1, numberOfShelfs: 6) else {
            return
        }
        
        let andyOramID = UUID()
        
        guard let andyOram = DatabaseAccess.view.authors.create(id: andyOramID, firstname: "Andy", lastname: "Oram") else {
            return
        }
        
        let gregWilsonID = UUID()
        
        guard let gregWilson = DatabaseAccess.view.authors.create(id: gregWilsonID, firstname: "Greg", lastname: "Wilson") else {
            return
        }
        
        guard let beautifulCode = DatabaseAccess.view.books.create(isbn: "9780596510046", title: "Beautiful Code: Leading Programmers Explain How They Think") else {
            return 
        }
        
        beautifulCode.addToAuthors(andyOram)
        beautifulCode.addToAuthors(gregWilson)
        
        bookshelf.addToBooks(beautifulCode)
        
        do {
            try DatabaseAccess.view.save()
        } catch let error {
            fatalError("Could not save database \(error)")
        }
    
        guard let aBookshelf = DatabaseAccess.view.bookshelfs.query.entity(with: 1) else {
            fatalError("Could not find bookshelf")
        }
        
        print(aBookshelf)
        
        guard let authorAndyOram = DatabaseAccess.view.authors.query.entity(with: andyOramID) else {
            fatalError("Could not find Andy Oram")
        }
        
        print(authorAndyOram)
        
        guard let bookBeautifulCode = DatabaseAccess.view.books.query.entity(with: "9780596510046") else {
            fatalError("Could not find book")
        }
        
        print(bookBeautifulCode)
        
    }

}

