//
//  Stack.swift
//  iiwi
//
//  Created by Marek Rogowski on 24/07/2019.
//

import Foundation
import CoreData

class Stack {
    static let shared = Stack()
    
    private var modelName: String!
    private var modelURL: URL!
    
    private lazy var container: NSPersistentContainer = {
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)
        
        let container = NSPersistentContainer(name: modelName, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores { (storeDescription, error) in
            print(storeDescription)
            if let error = error {
                fatalError("Failed to load store \(error)")
            }
        }
        return container
    }()
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    func newBackgroundContext() -> NSManagedObjectContext {
        return container.newBackgroundContext()
    }
    
    func initialize(model modelName: String, withURL modelURL: URL) {
        self.modelName = modelName
        self.modelURL = modelURL
    }
    
    func initialize(model modelName: String, inBundle bundle: Bundle = .main) {
        guard let modelURL = bundle.url(forResource: modelName, withExtension: "momd") else {
            fatalError("Could not locate model \(modelName) in bundle \(String(describing: bundle.bundleIdentifier))")
        }
        
        initialize(model: modelName, withURL: modelURL)
    }
    
    public func initialize(model modelName: String, inBundleWithIdentifier bundleIdentifier: String) {
        guard let bundle = Bundle(identifier: bundleIdentifier) else {
            fatalError("Could not locate bundle with identifier \(bundleIdentifier)")
        }
        initialize(model: modelName, inBundle: bundle)
    }
    
}
