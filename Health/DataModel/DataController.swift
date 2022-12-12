//
//  DataController.swift
//  Health
//
//  Created by Haruka Nakano on 2022/12/12.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "TemperatureModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load the data! \(error.localizedDescription)")
            }
        }
    }

    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            
            print("Data saved successfully!")
        }
        catch {
            print("Something went wrong while saving the data")
        }
    }
    
    func addTemperature(temperature: Float, context: NSManagedObjectContext) {
        let measurement = Temperature(context: context)
        
        measurement.identifier = UUID()
        measurement.timestamp = Date()
        
        measurement.temperature = temperature
        
        save(context: context)
    }
    
    func editTemperature(measurement: Temperature, temperature: Float, context: NSManagedObjectContext) {
        measurement.timestamp = Date()
        
        measurement.temperature = temperature
        
        save(context: context)
    }
}
