//
//  ModelContainer.swift
//  Send Me To Heaven
//
//  Created by Zachary MacConnell on 2/10/24.
//

import SwiftUI
import CoreData

class ModelContainer: ObservableObject {
    static let shared: ModelContainer = ModelContainer()

    private let persistentContainer: NSPersistentContainer

    init() {
        self.persistentContainer = NSPersistentContainer(name: "YourDataModelName")
        self.persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
    }

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
