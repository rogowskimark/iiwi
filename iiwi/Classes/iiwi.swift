//
//  iiwi.swift
//  iiwi
//
//  Created by Marek Rogowski on 24/07/2019.
//

import CoreData

public class iiwi {

    public static func initialize(model modelName: String, withURL modelURL: URL) {
        Stack.shared.initialize(model: modelName, withURL: modelURL)
    }
    
    public static func initialize(model modelName: String, inBundle bundle: Bundle = .main) {
        Stack.shared.initialize(model: modelName, inBundle: bundle)
    }
    
    public static func initialize(model modelName: String, inBundleWithIdentifier bundleIdentifier: String) {
        Stack.shared.initialize(model: modelName, inBundleWithIdentifier: bundleIdentifier)
    }
    
    public static var viewContext: NSManagedObjectContext {
        return Stack.shared.viewContext
    }
    
    public static func newBackgroundContext() -> NSManagedObjectContext {
        return Stack.shared.newBackgroundContext()
    }

}
