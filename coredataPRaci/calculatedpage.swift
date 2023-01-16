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
     
    @State var sCal = strenghCal()
  
    @StateObject var vm = CoreDataViewModel()
    @State var calcu = birthdaybaxiCal()
        let entity: FruitEntity
        let id: UUID
        var dateComponents: (Int, Int, Int, String) {
            calcu.extractDateComponents(date:entity.birthday ?? Date() , entity: entity)
        
    }
    
    var body: some View {
        
        ZStack {
            BadgeBackground()
            
            VStack{
                Text(entity.name ?? "")
                Text(entity.birthday ?? Date(), style: .date)
                Text(entity.birthday ?? Date(), style: .time)
                Text(entity.toggleSex ? "Female" : "Male")
            }
        }
        .background(Image("fbgimage").resizable().frame(width: 1400, height: 1400) .aspectRatio(contentMode: .fit))
        Button(action:{
            
//            var yearTop = calcu.getBaxiyearbot(year: self.dateComponents.0, month: self.dateComponents.1)
//            var strengthCal = strenghCal(yearTop: yearTop)
            
//            var strengthCal = strenghCal(yearTop:  calcu.getBaxiyearbot(year: self.dateComponents.0, month: self.dateComponents.1))
//            var yearbot = calcu.getBaxiyearbot(year: self.dateComponents.0, month: self.dateComponents.1)
//            var monthBot = calcu.getBaxiMonthbot(month: self.dateComponents.1)
//            var baxiDate = calcu.getbaxiDay(year: self.dateComponents.0, month: self.dateComponents.1, day: self.dateComponents.2)
            sCal.chitop(zhi: calcu.getBaxiyear(year: self.dateComponents.0, month: self.dateComponents.1))
            var toptian = sCal.setup() 
            print(toptian)
            
            
            
//            print(calcu.extractDateComponents(date: Date(), entity: entity)) // prints the year, month, day and time
//            print(calcu.extractDateComponentsTime(dateComponents: dateComponents)) // print the time only
            print(calcu.getBaxiyear(year: self.dateComponents.0, month: self.dateComponents.1))
//            print(calcu.getBaxiyearbot(year: self.dateComponents.0, month: self.dateComponents.1))
//            print(calcu.evaluateData(year: dateComponents.0, month: dateComponents.1, day: dateComponents.2))
//            print(calcu.getBaxiMonthbot(month: self.dateComponents.1))
//            print(calcu.getbaxiDay(year: self.dateComponents.0, month: self.dateComponents.1, day: self.dateComponents.2))
//            print(calcu.getBaxitime(year: self.dateComponents.0, month: self.dateComponents.1, day: self.dateComponents.2, time: self.dateComponents.3))
//            print(calcu.getBaxiTimebot(time: self.dateComponents.3))
            
            
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
//
//struct strenghCal {
//
//    
//    var yearTop: String
//    init(yearTop: String) {
//           self.yearTop = yearTop
//       }
//  
//}






//struct calculatedpage_Previews: PreviewProvider {
//    static var previews: some View {
//        let entity = FruitEntity()
//
//        calculatedpage(entity: entity, id: UUID())
//    }
//}
//

