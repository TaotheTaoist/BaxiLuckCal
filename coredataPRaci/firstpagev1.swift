//
//  firstpagev1.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 1/14/23.
//

import SwiftUI

struct firstPage1: View {
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText: String = ""
    @State var selectedDate: Date = Date()
    @State private var addNewPresented = false
    @State private var isEditing = true
    @State private var selectedID: UUID? = nil
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        Button(action:{self.isEditing.toggle()
                            
                        }) {
                      
                            Image(systemName: "doc.richtext.ar")
                                .padding(.leading, 30)
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        Button(action: {self.addNewPresented.toggle()}) {
                            Image(systemName: "person.badge.plus")
                            
                                .padding(.trailing, 30)
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .padding([.top, .trailing], 10.0)
                        .sheet(isPresented: $addNewPresented ) {
                            addNameBirth().onDisappear {  ///<== just add entity inside of para
                                self.refreshData()
                            }
                        }
                    }
                    ScrollView (showsIndicators: false){
                        HStack {
                            Grid{
                                ForEach(vm.savedEntities.indices, id: \.self) { index in
                                    VStack(alignment: .center) {
                                        ExtractedView(id: vm.savedEntities[index].id ?? UUID())
                                    }
                                    .overlay(Button(action: {
                                                self.isEditing.toggle()
                                                if self.isEditing {
                                                    self.vm.deleteFruit(at: index)
                                                    self.vm.fetchFruits()
                                                }
                                            }) {
                                                Image(systemName: "trash")
                                                    .foregroundColor(.white)
                                            }.padding(.trailing, 10), alignment: .trailing)
                                        .onTapGesture {
                                            self.selectedID = vm.savedEntities[index].id
                                        }

                                    NavigationLink(destination: calculatedpage(entity: vm.savedEntities[index], id: vm.savedEntities[index].id ?? UUID()), tag: vm.savedEntities[index].id!, selection: $selectedID) { EmptyView() }
                                 
                                }
                            }
                            
                        }
                    }
                }
              
                
            }
            
            .background(Image("mage2").resizable().frame(width: 1400, height: 1400) .aspectRatio(contentMode: .fit))
                      
                            
        }
        
        

       
            
            
            
        }
     
        
        
    
    func refreshData() {
        self.vm.fetchFruits()
    }
}



struct firstPage_Previews1: PreviewProvider {
    static var previews: some View {
        firstPage1()
    }
}

struct ExtractedView: View {
    @ObservedObject var vm = CoreDataViewModel()
    var id: UUID
    
    var entity: FruitEntity {
        return vm.savedEntities.first(where: { $0.id == id })!
    }
    //    var entity: FruitEntity (this line is before I add ID to core data)
    
    var body: some View {
        VStack(alignment: .leading){
            Text(entity.name ?? "")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(width: 200.0, height: 100.0)
                .foregroundStyle(.linearGradient(colors: [.white.opacity(0.7),.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Text(entity.birthday ?? Date(), style: .date)
                .multilineTextAlignment(.leading).lineLimit(1)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            
        }
        .padding(.all)
        .background(.ultraThinMaterial.opacity(0.8))
        .overlay(RoundedRectangle(cornerRadius: 30, style:.continuous).stroke(.linearGradient(colors: [.white.opacity(0.5), .black.opacity(0.2)], startPoint: .top, endPoint: .bottom)).blendMode(.overlay))
        //styling to fit background
        
        .cornerRadius(30.0)
        .shadow(radius: 10)
        
    }
}




