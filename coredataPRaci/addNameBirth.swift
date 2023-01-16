//
//  addNameBirth.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 1/2/23.
//

import SwiftUI

struct addNameBirth: View {
    
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText: String = ""
    @State var toggleSex = false
    @State var selectedDate: Date = Date()

    let exampleColor : Color = Color(red: 0.5, green: 0.8, blue: 0.5)
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 1900, month: 1, day: 1)
        let endComponents = NSDate()
        return calendar.date(from:startComponents)!
        ...
        Date()
    }()
    
    var body: some View {
//        NavigationView{
            
            VStack(spacing:20){
                //                Color.black
                HStack {
                    Image(systemName: "chevron.left").foregroundColor(.green)
                    TextField("Insert Subject Name", text:$textFieldText).font(Font.custom("Papyrus", size: 16))
                    Image(systemName: "chevron.right").foregroundColor(.green)
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.black))
                .padding()

                Text(toggleSex ? "Female" : "Male")
                Toggle("", isOn: $toggleSex)
                    .toggleStyle(SwitchToggleStyle(tint:Color.green))
                    .frame(width: 120)
                    .padding()
                DatePicker("Your Birthday", selection:$selectedDate, in: dateRange)
                    .padding()
                
                Text("\(selectedDate.formatted(date: .long, time: .standard))")
                
                
                Button(action:{
                    guard !textFieldText.isEmpty else {return}
                    vm.addnameBirth(name: textFieldText, birthdate: selectedDate, sex: toggleSex)
                    
                }, label:{
                    Text("Saved")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemPink))
                        .cornerRadius(10)
                })
                .padding(.horizontal)
                //                Color.black
            }
            
//        }
    }
    
}

struct addNameBirth_Previews: PreviewProvider {
    static var previews: some View {
        addNameBirth()
    }
}
