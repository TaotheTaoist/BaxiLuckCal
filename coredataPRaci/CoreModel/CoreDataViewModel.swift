//
//  ContentView.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 12/28/22.
//

import SwiftUI
import CoreData
import Foundation


class CoreDataViewModel: ObservableObject{
    let container: NSPersistentContainer
    
    @Published var savedEntities: [ FruitEntity] = []
    init(){
        container = NSPersistentContainer(name: "coremodel")
        container.loadPersistentStores { (description,error) in
            if let error = error {
                print("error first\(error)")
                
            }
        }
        fetchFruits()
    }
    
    func fetchFruits(){
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do{
            savedEntities = try container.viewContext.fetch(request)
        }catch let error {
            print("error fetching. \(error)")
        }
    }
    func addnameBirth(name :String, birthdate: Date, sex:Bool){
        let id = UUID()
        let addnameBirthday = FruitEntity(context: container.viewContext)
        addnameBirthday.name = name
        addnameBirthday.birthday = birthdate
        addnameBirthday.toggleSex = sex
        addnameBirthday.id = id
        saveData()
    }
//    func deleteFruit(indexSet: IndexSet){
//        guard let index = indexSet.first else {return}
//        let entity = savedEntities[index]
//        container.viewContext.delete(entity)
//        saveData()
//
//    }
    func deleteFruit(at index: Int) {
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    
    
    
    func saveData(){
        do {
            try container.viewContext.save()
            fetchFruits() /// get data after saved
            
        }catch let error{
            print("error saving. \(error)")
        }
    }
    
    
    
}
