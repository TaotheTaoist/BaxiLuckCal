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
        
        NavigationStack{
            ZStack(alignment: .center){
                GeometryReader {  geometry in
                    Image("fbgimage")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                        .opacity(0.2)
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity)
                }.border(Color.green, width: 3)
                                        

                    
                VStack (alignment:.trailing){
                    HStack{
                        Image(systemName:"trash")
                        Spacer()
                        Button(action: {self.addNewPresented.toggle()}) {
                                Image(systemName: "plus.circle")
                                    .font(.title)
                                    .foregroundColor(.blue)
                                }
                            .padding()
                                .sheet(isPresented: $addNewPresented) {
                                    addNameBirth().onDisappear {  ///<== just add entity inside of para
                                        self.refreshData()
                                    }
                            }
                                .border(Color.red)
                        
                                
                    }
                    .padding(.horizontal)
                    .border(Color.green, width: 3)
                    
                   
//                    List{}.opacity(0.2)
                    
                }
                .border(Color.green, width: 3)
                .padding()
                .scaledToFit()
                
                
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
