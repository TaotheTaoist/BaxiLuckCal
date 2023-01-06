//
//  birthdaybaxiCal.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 1/5/23.
//

import SwiftUI
import CoreData
import Foundation


class birthdaybaxiCal {
    
    
    
    func extractDateComponents(date: Date, entity: FruitEntity) -> (Int, Int, String) {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let day = calendar.component(.day, from: date)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let time = formatter.string(from: entity.birthday ?? Date())
        return (year, day, time)
    }
    
    
    
    func extractDateComponentsYear(dateComponents: (Int, Int, String)) -> Int {
        return dateComponents.0
    }
    
    func extractDateComponentsDay(dateComponents: (Int, Int, String)) -> Int {
        return dateComponents.1
    }
    
    func extractDateComponentsTime(dateComponents: (Int, Int, String)) -> String {
        return dateComponents.2
    }
    
}
