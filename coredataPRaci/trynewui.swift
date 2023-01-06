//
//  trynewui.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 1/12/23.
//

import SwiftUI

struct trynewui: View {
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText: String = ""
    @State var selectedDate: Date = Date()
    @State private var addNewPresented = false
    var body: some View {
        ZStack{
            
            NavigationStack{
                Image("fbgimage").resizable()
                    .edgesIgnoringSafeArea(.all)
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

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
             
            }
            
        }
    }
    func refreshData() {
        self.vm.fetchFruits()
    }
}

struct trynewui_Previews: PreviewProvider {
    static var previews: some View {
        trynewui()
    }
}
