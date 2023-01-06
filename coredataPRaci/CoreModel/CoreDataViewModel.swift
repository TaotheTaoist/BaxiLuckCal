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
    

    
//    func addnameBirth(name :String, birthdate: Date){
//        let addnameBirthday = FruitEntity(context: container.viewContext)
//        addnameBirthday.name = name
//        addnameBirthday.birthday = birthdate
//        saveData()
//    }
    
    func addnameBirth(name :String, birthdate: Date, sex:Bool){
        
        let addnameBirthday = FruitEntity(context: container.viewContext)
        addnameBirthday.name = name
        addnameBirthday.birthday = birthdate
        addnameBirthday.toggleSex = sex
        saveData()
    }
    func deleteFruit(indexSet: IndexSet){
        guard let index = indexSet.first else {return}
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
//struct ContentView: View {
//    @StateObject var vm = CoreDataViewModel()
//    @State var textFieldText: String = ""
//    @State var selectedDate: Date = Date()
//
//    let dateRange: ClosedRange<Date> = {
//        let calendar = Calendar.current
//        let startComponents = DateComponents(year: 1900, month: 1, day: 1)
//        let endComponents = NSDate()
//        return calendar.date(from:startComponents)!
//            ...
//            Date()
//    }()
//
//
//
//    var body: some View {
//
//        NavigationView{
//
//            VStack(spacing:20){
//                TextField("add fruit here...", text: $textFieldText)
//                    .font(.headline)
//                    .padding(.leading)
//                    .frame(height: 55)
//                    .background(Color(.lightGray))
//                    .cornerRadius(10)
//                    .padding(.horizontal)
//                Button(action:{
//                    guard !textFieldText.isEmpty else {return}
//                    vm.addnameBirth(name: textFieldText, birthdate: selectedDate)
////                    vm.addFruit(text: textFieldText)
////                    vm.addBirthday(date: selectedDate)
//                }, label:{
//
//
//
//                   Text("Saved")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(height: 55)
//                        .frame(maxWidth: .infinity)
//                        .background(Color(.systemPink))
//                        .cornerRadius(10)
//                })
//                .padding(.horizontal)
//                DatePicker("Your Birthday", selection:$selectedDate, in: dateRange)
//
//                Text("\(selectedDate.formatted(date: .long, time: .standard))")
//
//                Spacer()
//               List {
//                   ForEach(vm.savedEntities){ entity in
//                       NavigationLink(destination: calculatedpage(vm: vm, entity: entity),
//
//                                      label: {
//                           Text(entity.name ?? "")
//                           Text(entity.birthday ?? Date() , style: .date)
//                           Text(entity.birthday ?? Date(), style: .time)
//
//                       })
//
//
//                    }
//                    .onDelete(perform:vm.deleteFruit)
//                    .navigationBarTitleDisplayMode(.inline)
//
//                }
//
//
//            }
//            .navigationTitle("tittle")
//
//        }
//
//    }
////}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
