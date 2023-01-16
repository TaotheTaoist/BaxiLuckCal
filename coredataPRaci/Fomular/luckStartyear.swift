//
//  luckStartyear.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 3/20/23.
//

import Foundation


struct luckStartyear {
    
    func convertToLunar(birthday:String)->(String){
        
        let gregorianCalendar = Calendar(identifier: .gregorian)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = dateFormatter.date(from: birthday)!
        var gyear = gregorianCalendar.component(.year, from: date)
        let chineseCalendar = Calendar(identifier: .chinese)
        
        let month = chineseCalendar.component(.month, from: date)
        switch month {
        case 12:
            gyear = gyear - 1
        default:
            break
        }
        
        let day = chineseCalendar.component(.day, from: date)
        
        let lunarDateString = "\(gyear)-\(month)-\(day)"
           return lunarDateString
    }

}
