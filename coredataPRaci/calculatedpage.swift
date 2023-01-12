//
//  calculatedpage.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 12/31/22.
//
import Foundation
import SwiftUI
import CoreData

struct calculatedpage: View {
     
    @State var calcu = birthdaybaxiCal()
    @StateObject var vm = CoreDataViewModel()
    
    let entity: FruitEntity
    var dateComponents: (Int, Int, Int, String) {
        calcu.extractDateComponents(date:entity.birthday ?? Date() , entity: entity)
      }
    var body: some View {
        
        VStack{
            Text(entity.name ?? "")
            Text(entity.birthday ?? Date(), style: .date)
            Text(entity.birthday ?? Date(), style: .time)
            Text(entity.toggleSex ? "Female" : "Male")
        }
        Button(action:{
            print(calcu.extractDateComponentsTime(dateComponents: dateComponents))
            print(calcu.getBaxiyear(year: self.dateComponents.0,month: self.dateComponents.1))
            print(calcu.getBaxiyearbot(year: self.dateComponents.0, month: self.dateComponents.1))
            print(calcu.getBaximonthtop(getBaxiyear: calcu.getBaxiyear, year: self.dateComponents.0, thatmonth: self.dateComponents.1))
            print(calcu.getBaxiMonthbot(month: self.dateComponents.1))
            print(calcu.getbaxiDay(year: self.dateComponents.0, month: self.dateComponents.1, day: self.dateComponents.2))
            print(calcu.getBaxitime(year: self.dateComponents.0, month: self.dateComponents.1, day: self.dateComponents.2, time: self.dateComponents.3))
            print(calcu.getBaxiTimebot(time: self.dateComponents.3))
            }, label:{
            Text("Saved")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color(.systemPink))
                .cornerRadius(10)
        })
    }
    
    
    
}




//struct calculatedpage_Previews: PreviewProvider {
//    static var previews: some View {
//        let entity = FruitEntity()
//
//        calculatedpage(entity: entity)
//    }
//}


