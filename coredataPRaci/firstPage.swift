//
//  firstPage.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 1/2/23.
//

import SwiftUI

struct firstPage: View {
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText: String = ""
    @State var selectedDate: Date = Date()
    @State private var addNewPresented = false
    
    var body: some View {
        NavigationStack{
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    
                    HStack {
                        Spacer()
                        Button(action: {self.addNewPresented.toggle()}) {
                            Image(systemName: "plus.circle")
                                .padding(.trailing, 30)
                                .font(.title)
                                .foregroundColor(.blue)
                            }
                            
                        .padding([.top, .trailing], 10.0)
                            .sheet(isPresented: $addNewPresented) {
                                addNameBirth().onDisappear {  ///<== just add entity inside of para
                                    self.refreshData()
                                }
                                
                        }
                    }
                            
                        }
                }
                List {
                    ForEach(vm.savedEntities){ entity in
                        NavigationLink(destination: calculatedpage(vm: vm, entity: entity),
                                       
                                       label: {
                            Text(entity.name ?? "")
                            Text(entity.birthday ?? Date() , style: .date)
                            Text(entity.birthday ?? Date(), style: .time)
                            
                        })
                        
                        
                    }
                    .onDelete(perform:vm.deleteFruit)
                    .navigationBarTitleDisplayMode(.inline)
                    
                }
                .navigationTitle("tittle")
                .bold()
            }
            
        }
    func refreshData() {
        self.vm.fetchFruits()
    }
}


        
struct firstPage_Previews: PreviewProvider {
    static var previews: some View {
        firstPage()
    }
}

