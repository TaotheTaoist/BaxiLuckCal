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
    func combineTimeNBd(bd:String ,time:String) ->(String){
        let combinedString = "\(bd) \(time)"
//        print(combinedString)
        return combinedString
    }
//    func shunOrNi(bd:String, sex:Bool,yeartop:String, bdTime:String){
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
//        let subjectBd = "\(bd)"
//        let subjectBdnTime = "\(bd) \(bdTime)"
//        var plusMonth = 0
//        var minusMonth = 0
//        var calDate = ""
//        let shunOrNi = sex
////        let dateString = bd
////        let components = dateString.split(separator: "-")
//        let components = subjectBd.split(separator: "-")
//        let year = Int(components[0])!
//        let month = Int(components[1])!
//        let day = Int(components[2])!
//        var alterMonth = month
//        if month == 12 {
//            plusMonth = 1
//            minusMonth = 11
//        } else if month == 1 {
//            plusMonth = 2
//            minusMonth = 12
//        } else {
//            plusMonth = month + 1
//            minusMonth = month - 1
//        }
//
//        if shunOrNi == false {
//            // false == male & true == female
//            switch yeartop {
//            case "甲","丙","戊","庚","壬":
//                alterMonth = plusMonth
//            case "乙","丁","己","辛","癸":
//                alterMonth = minusMonth
//            default:
//                break
//            }
//        } else if shunOrNi == true  {
//            switch yeartop {
//            case "甲","丙","戊","庚","壬":
//                alterMonth = minusMonth
//            case "乙","丁","己","辛","癸":
//                alterMonth = plusMonth
//            default:
//                break
//            }
//
//        }
//
//        if let march = calendar[year]?[alterMonth] {
//            for (day, times) in march {
//                for time in times {
//                    calDate = "\(year)-\(plusMonth)-\(day) \(time)"
//                    print(calDate)
//
//                }
//            }
//        }
//        guard let date1 = dateFormatter.date(from: calDate),
//              let date2 = dateFormatter.date(from: subjectBdnTime) else {
//            print("Error: could not parse dates")
//            return
//        }
//        let timeInterval = date1.timeIntervalSince(date2)
//        print("Time difference in seconds: \(timeInterval)")
//        let timeInterval2 = timeInterval // Replace with your time interval
//
//        let days = Int(timeInterval2 / 86400)
//        let hours = Int((timeInterval2.truncatingRemainder(dividingBy: 86400)) / 3600)
//        let minutes = Int((timeInterval2.truncatingRemainder(dividingBy: 3600)) / 60)
//        let seconds = Int(timeInterval2.truncatingRemainder(dividingBy: 60))
//        print("\(days) days, \(hours) hours, \(minutes) minutes, \(seconds) seconds")
//
//    }
    func shunOrNi(bd:String, sex:Bool,yeartop:String, bdTime:String) -> (String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let subjectBd = "\(bd)"
        let subjectBdnTime = "\(bd) \(bdTime)"
        var plusMonth = 0
        var minusMonth = 0
        var calDate = ""
        let shunOrNi = sex
        var seconds = 0
        var newTarget = ""
        var differences = ""
        let components = subjectBd.split(separator: "-")
        let year = Int(components[0])!
        let month = Int(components[1])!
        let day = Int(components[2])!
        var alterMonth = month
        var altYear = year
        if month == 12 {
            plusMonth = 1
            minusMonth = 11
        } else if month == 1 {
            plusMonth = 2
            minusMonth = 12
        } else {
            plusMonth = month + 1
            minusMonth = month - 1
        }
        if plusMonth == 1{
            altYear += 1
        }
        if minusMonth == 12{
            altYear -= 1
        }
        print(alterMonth)
        print(altYear)
        
        let target = getCaldar(year: year, month: month) // get current month's jie
        
        if shunOrNi == false {
            // false == male & true == female
            switch yeartop {
            case "甲","丙","戊","庚","壬":
                seconds = calculateTimeIntervalSeconds(targetdate: target, birthDay: subjectBdnTime)
                if seconds < 0 {
                    newTarget = getCaldar(year: altYear, month: plusMonth)
                    differences = calculateTimeInterval(targetdate: newTarget, birthDay: subjectBdnTime)
                }
    
            case "乙","丁","己","辛","癸":
                alterMonth = minusMonth
            default:
                break
            }
        } else if shunOrNi == true  {
            switch yeartop {
            case "甲","丙","戊","庚","壬":
                alterMonth = minusMonth
            case "乙","丁","己","辛","癸":
                alterMonth = plusMonth
            default:
                break
            }
            
        }
        
        
//        if let march = calendar[year]?[month] {
//            for (day, times) in march {
//                for time in times {
//                    calDate = "\(year)-\(plusMonth)-\(day) \(time)"
//                    print(calDate)
//
//                }
//            }
//        }
        
        print(seconds)
//        guard let date1 = dateFormatter.date(from: calDate),
//              let date2 = dateFormatter.date(from: subjectBdnTime) else {
//            print("Error: could not parse dates")
//            return
//        }
//        let timeInterval = date1.timeIntervalSince(date2)
//        print("Time difference in seconds: \(timeInterval)")
//        let timeInterval2 = timeInterval // Replace with your time interval
//
//        let days = Int(timeInterval2 / 86400)
//        let hours = Int((timeInterval2.truncatingRemainder(dividingBy: 86400)) / 3600)
//        let minutes = Int((timeInterval2.truncatingRemainder(dividingBy: 3600)) / 60)
//        let seconds = Int(timeInterval2.truncatingRemainder(dividingBy: 60))
//        print("\(days) days, \(hours) hours, \(minutes) minutes, \(seconds) seconds")
        return differences

    }
    func calculateTimeIntervalSeconds(targetdate:String, birthDay:String)->(Int) {
        let dateFormatter = DateFormatter()
        //    dateFormatter.dateFormat = "yyyy M d, HH:mm"
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        //    let dateString1 = "1991-12-16 14:37" ///later date
        //    let dateString2 = "1991-11-16 20:50" /// birthday
        let dateString1 = targetdate ///later date
        let dateString2 = birthDay /// birthday
        guard let date1 = dateFormatter.date(from: dateString1),
              let date2 = dateFormatter.date(from: dateString2) else {
            print("Error: could not parse dates")
            return 0
        }
        
        let timeInterval = date1.timeIntervalSince(date2)
        let timeIntervalSeconds = Int(date1.timeIntervalSince(date2))
        
        
    //    print("Time difference in seconds: \(timeInterval)")
        let timeInterval2 = timeInterval // Replace with your time interval
        
        let days = Int(timeInterval2 / 86400)
        let hours = Int((timeInterval2.truncatingRemainder(dividingBy: 86400)) / 3600)
        let minutes = Int((timeInterval2.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(timeInterval2.truncatingRemainder(dividingBy: 60))
    //    print("\(days) days, \(hours) hours, \(minutes) minutes, \(seconds) seconds")
       
        return timeIntervalSeconds
    }
    func calculateTimeInterval(targetdate:String, birthDay:String)->(String) {
        let dateFormatter = DateFormatter()
        //    dateFormatter.dateFormat = "yyyy M d, HH:mm"
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        //    let dateString1 = "1991-12-16 14:37" ///later date
        //    let dateString2 = "1991-11-16 20:50" /// birthday
        let dateString1 = targetdate ///later date
        let dateString2 = birthDay /// birthday
        guard let date1 = dateFormatter.date(from: dateString1),
              let date2 = dateFormatter.date(from: dateString2) else {
            print("Error: could not parse dates")
            return "error"
        }
        
        let timeInterval = date1.timeIntervalSince(date2)
        
        
    //    print("Time difference in seconds: \(timeInterval)")
        let timeInterval2 = timeInterval // Replace with your time interval
        
        let days = Int(timeInterval2 / 86400)
        let hours = Int((timeInterval2.truncatingRemainder(dividingBy: 86400)) / 3600)
        let minutes = Int((timeInterval2.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(timeInterval2.truncatingRemainder(dividingBy: 60))
    //    print("\(days) days, \(hours) hours, \(minutes) minutes, \(seconds) seconds")
        let differences = "\(days) days, \(hours) hours, \(minutes) minutes, \(seconds) seconds"
        return differences
    }
    func getCaldar(year:Int,month:Int) -> (String){
        var calDate = ""
        if let march = calendar[year]?[month] {
            for (day, times) in march {
                for time in times {
                    calDate = "\(year)-\(month)-\(day) \(time)"
//                    print(calDate)
                    
                }
            }
        }
        return calDate
    }
    let calendar: [Int: [Int: [Int: [String]]]] = [
        2047 : [
            1: [ 5: ["18:42"]
            ],
            2: [ 4: ["06:19"]
            ],
            3: [ 6: ["00:08"]
            ],
            4: [ 5: ["04:37"]
            ],
            5: [ 5: ["21:34"]
            ],
            6: [ 6: ["01:26"]
            ],
            7: [ 7: ["11:33"]
            ],
            8: [ 7: ["21:24"]
            ],
            9: [ 8: ["00:33"]
            ],
            10: [8: ["16:32"]
            ],
            11: [7: ["20:05"]
            ],
            12: [7: ["13:14"]
            ]
        ],
        2046 : [
            1: [ 5: ["12:56"]
            ],
            2: [ 4: ["00:33"]
            ],
            3: [ 5: ["18:21"]
            ],
            4: [ 4: ["22:49"]
            ],
            5: [ 5: ["15:46"]
            ],
            6: [ 5: ["19:37"]
            ],
            7: [ 7: ["05:43"]
            ],
            8: [ 7: ["15:34"]
            ],
            9: [ 7: ["18:42"]
            ],
            10: [8: ["10:40"]
            ],
            11: [7: ["14:12"]
            ],
            12: [7: ["07:20"]
            ]
        ],
        2045 : [
            1: [ 5: ["07:06"]
            ],
            2: [ 3: ["18:44"]
            ],
            3: [ 5: ["12:33"]
            ],
            4: [ 4: ["17:03"]
            ],
            5: [ 5: ["10:00"]
            ],
            6: [ 5: ["13:53"]
            ],
            7: [ 7: ["00:00"]
            ],
            8: [ 7: ["09:50"]
            ],
            9: [ 7: ["12:58"]
            ],
            10: [8: ["04:56"]
            ],
            11: [7: ["08:27"]
            ],
            12: [7: ["01:35"]
            ]
        ],
        2044 : [
            1: [ 6: ["01:14"]
            ],
            2: [ 4: ["12:50"]
            ],
            3: [ 5: ["06:39"]
            ],
            4: [ 4: ["11:09"]
            ],
            5: [ 5: ["04:07"]
            ],
            6: [ 5: ["08:00"]
            ],
            7: [ 6: ["18:07"]
            ],
            8: [ 7: ["03:58"]
            ],
            9: [ 7: ["07:06"]
            ],
            10: [7: ["23:05"]
            ],
            11: [7: ["02:36"]
            ],
            12: [6: ["19:44"]
            ]
        ],
        2043 : [
            1: [ 5: ["19:29"]
            ],
            2: [ 4: ["07:05"]
            ],
            3: [ 6: ["00:54"]
            ],
            4: [ 5: ["05:24"]
            ],
            5: [ 5: ["22:22"]
            ],
            6: [ 6: ["02:15"]
            ],
            7: [ 7: ["12:21"]
            ],
            8: [ 7: ["22:11"]
            ],
            9: [ 8: ["01:18"]
            ],
            10: [8: ["17:15"]
            ],
            11: [7: ["20:45"]
            ],
            12: [7: ["13:52"]
            ]
        ],
        2042 : [
            1: [ 5: ["13:36"]
            ],
            2: [ 4: ["01:14"]
            ],
            3: [ 5: ["19:04"]
            ],
            4: [ 4: ["23:35"]
            ],
            5: [ 5: ["16:34"]
            ],
            6: [ 5: ["20:28"]
            ],
            7: [ 7: ["06:35"]
            ],
            8: [ 7: ["16:26"]
            ],
            9: [ 7: ["19:33"]
            ],
            10: [8: ["11:30"]
            ],
            11: [7: ["15:01"]
            ],
            12: [7: ["08:07"]
            ]
        ],
        2041 : [
            1: [ 5: ["07:46"]
            ],
            2: [ 3: ["19:23"]
            ],
            3: [ 5: ["13:12"]
            ],
            4: [ 4: ["17:43"]
            ],
            5: [ 5: ["10:42"]
            ],
            6: [ 5: ["14:36"]
            ],
            7: [ 7: ["00:43"]
            ],
            8: [ 7: ["10:33"]
            ],
            9: [ 7: ["13:40"]
            ],
            10: [8: ["05:37"]
            ],
            11: [7: ["09:07"]
            ],
            12: [7: ["02:14"]
            ]
        ],
        2040 : [
            1: [ 6: ["02:00"]
            ],
            2: [ 4: ["13:37"]
            ],
            3: [ 5: ["07:28"]
            ],
            4: [ 4: ["11:59"]
            ],
            5: [ 5: ["04:58"]
            ],
            6: [ 5: ["08:52"]
            ],
            7: [ 6: ["18:59"]
            ],
            8: [ 7: ["04:49"]
            ],
            9: [ 7: ["07:55"]
            ],
            10: [7: ["23:50"]
            ],
            11: [7: ["03:19"]
            ],
            12: [6: ["20:25"]
            ]
        ],
        2039 : [
            1: [ 5: ["20:06"]
            ],
            2: [ 4: ["07:44"]
            ],
            3: [ 6: ["01:34"]
            ],
            4: [ 5: ["06:07"]
            ],
            5: [ 5: ["23:07"]
            ],
            6: [ 6: ["03:02"]
            ],
            7: [ 7: ["13:10"]
            ],
            8: [ 7: ["23:01"]
            ],
            9: [ 8: ["02:07"]
            ],
            10: [8: ["18:04"]
            ],
            11: [7: ["21:33"]
            ],
            12: [7: ["14:39"]
            ]
        ],
        2038 : [
            1: [ 5: ["14:19"]
            ],
            2: [ 4: ["01:56"]
            ],
            3: [ 5: ["19:46"]
            ],
            4: [ 5: ["00:18"]
            ],
            5: [ 5: ["17:18"]
            ],
            6: [ 5: ["21:12"]
            ],
            7: [ 7: ["07:20"]
            ],
            8: [ 7: ["17:09"]
            ],
            9: [ 7: ["20:15"]
            ],
            10: [8: ["12:10"]
            ],
            11: [7: ["15:39"]
            ],
            12: [7: ["08:44"]
            ]
        ],
        2037 : [
            1: [ 5: ["08:31"]
            ],
            2: [ 3: ["20:08"]
            ],
            3: [ 5: ["14:00"]
            ],
            4: [ 4: ["18:33"]
            ],
            5: [ 5: ["11:34"]
            ],
            6: [ 5: ["15:28"]
            ],
            7: [ 7: ["01:36"]
            ],
            8: [ 7: ["11:26"]
            ],
            9: [ 7: ["14:31"]
            ],
            10: [8: ["06:26"]
            ],
            11: [7: ["09:54"]
            ],
            12: [7: ["02:58"]
            ]
        ],
        2036 : [
            1: [ 6: ["02:37"]
            ],
            2: [ 4: ["14:14"]
            ],
            3: [ 5: ["08:06"]
            ],
            4: [ 4: ["12:39"]
            ],
            5: [ 5: ["05:41"]
            ],
            6: [ 5: ["09:36"]
            ],
            7: [ 6: ["19:45"]
            ],
            8: [ 7: ["05:35"]
            ],
            9: [ 7: ["08:41"]
            ],
            10: [8: ["00:36"]
            ],
            11: [7: ["04:04"]
            ],
            12: [6: ["21:09"]
            ]
        ],
        2035 : [
            1: [ 5: ["20:52"]
            ],
            2: [ 4: ["08:29"]
            ],
            3: [ 6: ["02:20"]
            ],
            4: [ 5: ["06:53"]
            ],
            5: [ 5: ["23:54"]
            ],
            6: [ 6: ["03:49"]
            ],
            7: [ 7: ["13:57"]
            ],
            8: [ 7: ["23:46"]
            ],
            9: [ 8: ["02:51"]
            ],
            10: [8: ["18:45"]
            ],
            11: [7: ["22:12"]
            ],
            12: [7: ["15:16"]
            ]
        ],
        2034 : [
            1: [ 5: ["15:00"]
            ],
            2: [ 4: ["02:38"]
            ],
            3: [ 5: ["20:31"]
            ],
            4: [ 5: ["01:05"]
            ],
            5: [ 5: ["18:08"]
            ],
            6: [ 5: ["22:04"]
            ],
            7: [ 7: ["08:13"]
            ],
            8: [ 7: ["18:02"]
            ],
            9: [ 7: ["21:07"]
            ],
            10: [8: ["13:01"]
            ],
            11: [7: ["16:27"]
            ],
            12: [7: ["09:31"]
            ]
        ],
        2033 : [
            1: [ 5: ["09:09"]
            ],
            2: [ 3: ["20:46"]
            ],
            3: [ 5: ["14:38"]
            ],
            4: [ 4: ["19:12"]
            ],
            5: [ 5: ["12:15"]
            ],
            6: [ 5: ["16:11"]
            ],
            7: [ 7: ["02:20"]
            ],
            8: [ 7: ["12:10"]
            ],
            9: [ 7: ["15:14"]
            ],
            10: [8: ["07:08"]
            ],
            11: [7: ["10:35"]
            ],
            12: [7: ["03:39"]
            ]
        ],
        2032 : [
            1: [ 6: ["03:24"]
            ],
            2: [ 4: ["15:01"]
            ],
            3: [ 5: ["08:54"]
            ],
            4: [ 4: ["13:28"]
            ],
            5: [ 5: ["06:31"]
            ],
            6: [ 5: ["10:27"]
            ],
            7: [ 6: ["20:35"]
            ],
            8: [ 7: ["06:24"]
            ],
            9: [ 7: ["09:28"]
            ],
            10: [8: ["01:20"]
            ],
            11: [7: ["04:46"]
            ],
            12: [6: ["21:48"]
            ]
        ],
        2031 : [
            1: [ 5: ["21:30"]
            ],
            2: [ 4: ["09:08"]
            ],
            3: [ 6: ["03:02"]
            ],
            4: [ 5: ["07:37"]
            ],
            5: [ 6: ["00:41"]
            ],
            6: [ 6: ["04:39"]
            ],
            7: [ 7: ["14:48"]
            ],
            8: [ 8: ["00:38"]
            ],
            9: [ 8: ["03:42"]
            ],
            10: [8: ["19:34"]
            ],
            11: [7: ["23:00"]
            ],
            12: [7: ["16:03"]
            ]
        ],
        2030 : [
            1: [ 5: ["15:41"]
            ],
            2: [ 4: ["03:19"]
            ],
            3: [ 5: ["21:11"]
            ],
            4: [ 5: ["01:46"]
            ],
            5: [ 5: ["18:50"]
            ],
            6: [ 5: ["22:47"]
            ],
            7: [ 7: ["08:56"]
            ],
            8: [ 7: ["18:45"]
            ],
            9: [ 7: ["21:49"]
            ],
            10: [8: ["13:41"]
            ],
            11: [7: ["17:06"]
            ],
            12: [7: ["10:09"]
            ]
        ],
        2029 : [
            1: [ 5: ["09:54"]
            ],
            2: [ 3: ["03:13"]
            ],
            3: [ 5: ["15:26"]
            ],
            4: [ 4: ["20:02"]
            ],
            5: [ 5: ["13:06"]
            ],
            6: [ 5: ["17:04"]
            ],
            7: [ 7: ["03:13"]
            ],
            8: [ 7: ["13:02"]
            ],
            9: [ 7: ["16:04"]
            ],
            10: [8: ["07:55"]
            ],
            11: [7: ["11:20"]
            ],
            12: [7: ["04:22"]
            ]
        ],
        2028 : [
            1: [ 6: ["04:00"]
            ],
            2: [ 4: ["15:39"]
            ],
            3: [ 5: ["09:32"]
            ],
            4: [ 4: ["14:09"]
            ],
            5: [ 5: ["07:14"]
            ],
            6: [ 5: ["11:13"]
            ],
            7: [ 6: ["21:23"]
            ],
            8: [ 7: ["07:12"]
            ],
            9: [ 7: ["10:15"]
            ],
            10: [8: ["02:07"]
            ],
            11: [7: ["05:32"]
            ],
            12: [6: ["22:32"]
            ]
        ],
        2027 : [
            1: [ 5: ["22:14"]
            ],
            2: [ 4: ["09:52"]
            ],
            3: [ 6: ["03:45"]
            ],
            4: [ 5: ["08:22"]
            ],
            5: [ 6: ["01:26"]
            ],
            6: [ 6: ["05:24"]
            ],
            7: [ 7: ["15:33"]
            ],
            8: [ 8: ["01:22"]
            ],
            9: [ 8: ["04:24"]
            ],
            10: [8: ["20:15"]
            ],
            11: [7: ["23:39"]
            ],
            12: [7: ["16:40"]
            ]
        ],
        2026 : [
            1: [ 5: ["16:24"]
            ],
            2: [ 4: ["04:03"]
            ],
            3: [ 5: ["21:58"]
            ],
            4: [ 5: ["02:35"]
            ],
            5: [ 5: ["19:41"]
            ],
            6: [ 5: ["23:40"]
            ],
            7: [ 7: ["09:50"]
            ],
            8: [ 7: ["19:38"]
            ],
            9: [ 7: ["22:41"]
            ],
            10: [8: ["14:31"]
            ],
            11: [7: ["17:54"]
            ],
            12: [7: ["10:55"]
            ]
        ],
        2025 : [
            1: [ 5: ["10:31"]
            ],
            2: [ 3: ["22:10"]
            ],
            3: [ 5: ["16:04"]
            ],
            4: [ 4: ["20:42"]
            ],
            5: [ 5: ["13:48"]
            ],
            6: [ 5: ["17:47"]
            ],
            7: [ 7: ["03:57"]
            ],
            8: [ 7: ["13:46"]
            ],
            9: [ 7: ["16:49"]
            ],
            10: [8: ["08:39"]
            ],
            11: [7: ["12:03"]
            ],
            12: [7: ["05:05"]
            ]
        ],
        2024 : [
            1: [ 6: ["04:47"]
            ],
            2: [ 4: ["16:25"]
            ],
            3: [ 5: ["10:19"]
            ],
            4: [ 4: ["14:57"]
            ],
            5: [ 5: ["08:03"]
            ],
            6: [ 5: ["12:02"]
            ],
            7: [ 6: ["22:11"]
            ],
            8: [ 7: ["07:59"]
            ],
            9: [ 7: ["11:00"]
            ],
            10: [8: ["02:49"]
            ],
            11: [7: ["06:12"]
            ],
            12: [6: ["23:12"]
            ]
        ],
        2023 : [
            1: [ 5: ["22:54"]
            ],
            2: [ 4: ["10:33"]
            ],
            3: [ 6: ["04:29"]
            ],
            4: [ 5: ["09:07"]
            ],
            5: [ 6: ["02:15"]
            ],
            6: [ 6: ["06:15"]
            ],
            7: [ 7: ["16:25"]
            ],
            8: [ 8: ["02:14"]
            ],
            9: [ 8: ["05:16"]
            ],
            10: [8: ["21:05"]
            ],
            11: [8: ["21:55"]
            ],
            12: [7: ["11:23"]
            ]
        ],
        2022 : [
            1: [ 5: ["17:04"]
            ],
            2: [ 4: ["04:42"]
            ],
            3: [ 5: ["22:37"]
            ],
            4: [ 5: ["03:15"]
            ],
            5: [ 5: ["20:23"]
            ],
            6: [ 6: ["00:23"]
            ],
            7: [ 7: ["10:33"]
            ],
            8: [ 7: ["20:21"]
            ],
            9: [ 7: ["23:23"]
            ],
            10: [8: ["15:12"]
            ],
            11: [7: ["18:34"]
            ],
            12: [7: ["11:35"]
            ]
        ],
        2021 : [
            1: [ 5: ["11:18"]
            ],
            2: [ 3: ["22:57"]
            ],
            3: [ 5: ["16:52"]
            ],
            4: [ 4: ["21:31"]
            ],
            5: [ 5: ["14:39"]
            ],
            6: [ 5: ["18:39"]
            ],
            7: [ 7: ["04:49"]
            ],
            8: [ 7: ["14:37"]
            ],
            9: [ 7: ["17:37"]
            ],
            10: [8: ["09:25"]
            ],
            11: [7: ["12:46"]
            ],
            12: [7: ["05:45"]
            ]
        ],
        2020 : [
            1: [ 6: ["05:24"]
            ],
            2: [ 4: ["17:03"]
            ],
            3: [ 5: ["10:59"]
            ],
            4: [ 4: ["15:39"]
            ],
            5: [ 5: ["08:48"]
            ],
            6: [ 5: ["12:49"]
            ],
            7: [ 6: ["23:00"]
            ],
            8: [ 7: ["08:49"]
            ],
            9: [ 7: ["11:50"]
            ],
            10: [8: ["03:38"]
            ],
            11: [7: ["06:59"]
            ],
            12: [6: ["23:59"]
            ]
        ],
        2019 : [
            1: [ 5: ["23:37"]
            ],
            2: [ 4: ["11:15"]
            ],
            3: [ 6: ["05:11"]
            ],
            4: [ 5: ["09:50"]
            ],
            5: [ 6: ["02:58"]
            ],
            6: [ 6: ["06:59"]
            ],
            7: [ 7: ["17:09"]
            ],
            8: [ 8: ["02:57"]
            ],
            9: [ 8: ["05:57"]
            ],
            10: [8: ["21:45"]
            ],
            11: [8: ["01:06"]
            ],
            12: [7: ["18:05"]
            ]
        ],
        2018 : [
            1: [ 5: ["17:48"]
            ],
            2: [ 4: ["05:28"]
            ],
            3: [ 5: ["23:25"]
            ],
            4: [ 5: ["04:05"]
            ],
            5: [ 5: ["21:14"]
            ],
            6: [ 6: ["01:16"]
            ],
            7: [ 7: ["11:26"]
            ],
            8: [ 7: ["21:14"]
            ],
            9: [ 8: ["00:14"]
            ],
            10: [8: ["16:00"]
            ],
            11: [7: ["19:20"]
            ],
            12: [7: ["12:19"]
            ]
        ],
        2017 : [
            1: [ 5: ["11:55"]
            ],
            2: [ 3: ["23:34"]
            ],
            3: [ 5: ["17:31"]
            ],
            4: [ 4: ["22:12"]
            ],
            5: [ 5: ["15:21"]
            ],
            6: [ 5: ["19:23"]
            ],
            7: [ 7: ["05:35"]
            ],
            8: [ 7: ["15:23"]
            ],
            9: [ 7: ["18:23"]
            ],
            10: [8: ["10:10"]
            ],
            11: [7: ["13:31"]
            ],
            12: [7: ["06:30"]
            ]
        ],
        2016 : [
            1: [ 6: ["06:09"]
            ],
            2: [ 4: ["17:48"]
            ],
            3: [ 5: ["11:45"]
            ],
            4: [ 4: ["16:25"]
            ],
            5: [ 5: ["09:35"]
            ],
            6: [ 5: ["13:36"]
            ],
            7: [ 6: ["23:47"]
            ],
            8: [ 7: ["09:34"]
            ],
            9: [ 7: ["12:33"]
            ],
            10: [8: ["04:19"]
            ],
            11: [7: ["05:15"]
            ],
            12: [7: ["00:36"]
            ]
        ],
        2015 : [
            1: [ 6: ["00:18"]
            ],
            2: [ 4: ["11:58"]
            ],
            3: [ 6: ["05:56"]
            ],
            4: [ 5: ["10:38"]
            ],
            5: [ 6: ["03:48"]
            ],
            6: [ 6: ["07:51"]
            ],
            7: [ 7: ["18:03"]
            ],
            8: [ 8: ["03:50"]
            ],
            9: [ 8: ["06:49"]
            ],
            10: [8: ["22:35"]
            ],
            11: [8: ["01:54"]
            ],
            12: [7: ["18:52"]
            ]
        ],
        2014 : [
            1: [ 5: ["18:26"]
            ],
            2: [ 4: ["06:06"]
            ],
            3: [ 6: ["00:03"]
            ],
            4: [ 5: ["04:45"]
            ],
            5: [ 5: ["21:56"]
            ],
            6: [ 6: ["01:58"]
            ],
            7: [ 7: ["12:10"]
            ],
            8: [ 7: ["21:58"]
            ],
            9: [ 8: ["00:57"]
            ],
            10: [8: ["16:43"]
            ],
            11: [7: ["20:02"]
            ],
            12: [7: ["13:00"]
            ]
        ],
        2013 : [
            1: [ 5: ["12:41"]
            ],
            2: [ 4: ["00:21"]
            ],
            3: [ 5: ["18:18"]
            ],
            4: [ 4: ["23:00"]
            ],
            5: [ 5: ["16:11"]
            ],
            6: [ 5: ["20:14"]
            ],
            7: [ 7: ["06:24"]
            ],
            8: [ 7: ["16:12"]
            ],
            9: [ 7: ["19:10"]
            ],
            10: [8: ["10:54"]
            ],
            11: [7: ["14:12"]
            ],
            12: [7: ["07:09"]
            ]
        ],
        2012 : [
            1: [ 6: ["06:48"]
            ],
            2: [ 4: ["18:28"]
            ],
            3: [ 5: ["12:26"]
            ],
            4: [ 4: ["17:10"]
            ],
            5: [ 5: ["10:22"]
            ],
            6: [ 5: ["14:26"]
            ],
            7: [ 7: ["00:38"]
            ],
            8: [ 7: ["10:26"]
            ],
            9: [ 7: ["13:24"]
            ],
            10: [8: ["05:09"]
            ],
            11: [7: ["08:27"]
            ],
            12: [7: ["01:24"]
            ]
        ],
        2011 : [
            1: [ 6: ["00:59"]
            ],
            2: [ 4: ["12:38"]
            ],
            3: [ 6: ["06:36"]
            ],
            4: [ 5: ["11:19"]
            ],
            5: [ 6: ["04:31"]
            ],
            6: [ 6: ["08:34"]
            ],
            7: [ 7: ["18:46"]
            ],
            8: [ 8: ["04:33"]
            ],
            9: [ 8: ["07:31"]
            ],
            10: [8: ["23:15"]
            ],
            11: [8: ["02:33"]
            ],
            12: [7: ["19:30"]
            ]
        ],
        2010 : [
            1: [ 5: ["19:12"]
            ],
            2: [ 4: ["06:52"]
            ],
            3: [ 6: ["00:51"]
            ],
            4: [ 5: ["05:35"]
            ],
            5: [ 5: ["22:47"]
            ],
            6: [ 6: ["02:51"]
            ],
            7: [ 7: ["13:03"]
            ],
            8: [ 7: ["22:50"]
            ],
            9: [ 8: ["01:47"]
            ],
            10: [8: ["17:30"]
            ],
            11: [7: ["20:46"]
            ],
            12: [7: ["13:42"]
            ]
        ],
        2009 : [
            1: [ 5: ["13:18"]
            ],
            2: [ 4: ["00:58"]
            ],
            3: [ 5: ["18:57"]
            ],
            4: [ 4: ["23:42"]
            ],
            5: [ 5: ["16:55"]
            ],
            6: [ 5: ["21:00"]
            ],
            7: [ 7: ["07:12"]
            ],
            8: [ 7: ["17:00"]
            ],
            9: [ 7: ["19:58"]
            ],
            10: [8: ["11:41"]
            ],
            11: [7: ["14:58"]
            ],
            12: [7: ["07:55"]
            ]
        ],
        2008 : [
            1: [ 6: ["07:32"]
            ],
            2: [ 4: ["19:11"]
            ],
            3: [ 5: ["13:10"]
            ],
            4: [ 4: ["17:54"]
            ],
            5: [ 5: ["11:07"]
            ],
            6: [ 5: ["15:11"]
            ],
            7: [ 7: ["01:23"]
            ],
            8: [ 7: ["11:10"]
            ],
            9: [ 7: ["14:06"]
            ],
            10: [8: ["05:49"]
            ],
            11: [7: ["09:02"]
            ],
            12: [7: ["02:01"]
            ]
        ],
        2007 : [
            1: [ 6: ["01:42"]
            ],
            2: [ 4: ["13:23"]
            ],
            3: [ 6: ["07:23"]
            ],
            4: [ 5: ["12:08"]
            ],
            5: [ 6: ["05:22"]
            ],
            6: [ 6: ["09:27"]
            ],
            7: [ 7: ["19:39"]
            ],
            8: [ 8: ["05:26"]
            ],
            9: [ 8: ["08:23"]
            ],
            10: [9: ["00:05"]
            ],
            11: [8: ["03:20"]
            ],
            12: [7: ["20:15"]
            ]
        ],
        2006 : [
            1: [ 5: ["19:49"]
            ],
            2: [ 4: ["07:29"]
            ],
            3: [ 6: ["01:29"]
            ],
            4: [ 5: ["06:14"]
            ],
            5: [ 5: ["23:29"]
            ],
            6: [ 6: ["03:34"]
            ],
            7: [ 7: ["13:47"]
            ],
            8: [ 7: ["23:35"]
            ],
            9: [ 8: ["02:31"]
            ],
            10: [8: ["18:14"]
            ],
            11: [7: ["21:29"]
            ],
            12: [7: ["14:25"]
            ]
        ],
        2005 : [
            1: [ 5: ["14:04"]
            ],
            2: [ 4: ["01:44"]
            ],
            3: [ 5: ["19:44"]
            ],
            4: [ 5: ["00:29"]
            ],
            5: [ 5: ["17:44"]
            ],
            6: [ 5: ["21:49"]
            ],
            7: [ 7: ["08:01"]
            ],
            8: [ 7: ["17:47"]
            ],
            9: [ 7: ["20:43"]
            ],
            10: [8: ["12:24"]
            ],
            11: [7: ["15:38"]
            ],
            12: [7: ["08:33"]
            ]
        ],
        2004 : [
            1: [ 6: ["08:12"]
            ],
            2: [ 4: ["19:53"]
            ],
            3: [ 5: ["13:53"]
            ],
            4: [ 4: ["18:40"]
            ],
            5: [ 5: ["11:56"]
            ],
            6: [ 5: ["16:02"]
            ],
            7: [ 7: ["02:15"]
            ],
            8: [ 7: ["12:02"]
            ],
            9: [ 7: ["14:58"]
            ],
            10: [8: ["06:39"]
            ],
            11: [7: ["09:54"]
            ],
            12: [7: ["02:48"]
            ]
        ],
        2003 : [
            1: [ 6: ["02:22"]
            ],
            2: [ 4: ["14:02"]
            ],
            3: [ 6: ["08:02"]
            ],
            4: [ 5: ["12:48"]
            ],
            5: [ 6: ["06:03"]
            ],
            6: [ 6: ["10:10"]
            ],
            7: [ 7: ["20:23"]
            ],
            8: [ 8: ["06:09"]
            ],
            9: [ 8: ["09:05"]
            ],
            10: [9: ["00:46"]
            ],
            11: [8: ["04:00"]
            ],
            12: [7: ["20:55"]
            ]
        ],
        2002 : [
            1: [ 5: ["20:36"]
            ],
            2: [ 4: ["08:16"]
            ],
            3: [ 6: ["02:17"]
            ],
            4: [ 5: ["07:04"]
            ],
            5: [ 6: ["00:20"]
            ],
            6: [ 6: ["04:26"]
            ],
            7: [ 7: ["14:39"]
            ],
            8: [ 8: ["00:25"]
            ],
            9: [ 8: ["03:19"]
            ],
            10: [8: ["18:59"]
            ],
            11: [7: ["22:12"]
            ],
            12: [7: ["15:06"]
            ]
        ],
        2001 : [
            1: [ 5: ["14:42"]
            ],
            2: [ 4: ["02:23"]
            ],
            3: [ 5: ["20:24"]
            ],
            4: [ 5: ["01:12"]
            ],
            5: [ 5: ["18:29"]
            ],
            6: [ 5: ["22:36"]
            ],
            7: [ 7: ["08:50"]
            ],
            8: [ 7: ["18:37"]
            ],
            9: [ 7: ["21:32"]
            ],
            10: [8: ["13:12"]
            ],
            11: [7: ["16:26"]
            ],
            12: [7: ["09:20"]
            ]
        ],
        2000 : [
            1: [ 6: ["08:55"]
            ],
            2: [ 4: ["20:35"]
            ],
            3: [ 5: ["14:35"]
            ],
            4: [ 4: ["19:23"]
            ],
            5: [ 5: ["12:39"]
            ],
            6: [ 5: ["16:46"]
            ],
            7: [ 7: ["02:59"]
            ],
            8: [ 7: ["12:45"]
            ],
            9: [ 7: ["15:40"]
            ],
            10: [8: ["07:19"]
            ],
            11: [7: ["10:32"]
            ],
            12: [7: ["03:25"]
            ]
        ],
        1999 : [
            1: [ 6: ["03:06"]
            ],
            2: [ 4: ["14:47"]
            ],
            3: [ 6: ["08:49"]
            ],
            4: [ 5: ["13:38"]
            ],
            5: [ 6: ["06:55"]
            ],
            6: [ 6: ["11:03"]
            ],
            7: [ 7: ["21:16"]
            ],
            8: [ 8: ["07:02"]
            ],
            9: [ 8: ["09:56"]
            ],
            10: [9: ["01:35"]
            ],
            11: [8: ["04:46"]
            ],
            12: [7: ["21:39"]
            ]
        ],
        1998 : [
            1: [ 5: ["21:13"]
            ],
            2: [ 4: ["08:53"]
            ],
            3: [ 6: ["02:55"]
            ],
            4: [ 5: ["07:44"]
            ],
            5: [ 6: ["01:02"]
            ],
            6: [ 6: ["05:11"]
            ],
            7: [ 7: ["15:25"]
            ],
            8: [ 8: ["01:11"]
            ],
            9: [ 8: ["04:06"]
            ],
            10: [8: ["19:45"]
            ],
            11: [7: ["22:57"]
            ],
            12: [7: ["15:50"]
            ]
        ],
        1997 : [
            1: [ 5: ["15:27"]
            ],
            2: [ 4: ["03:08"]
            ],
            3: [ 5: ["21:10"]
            ],
            4: [ 4: ["01:58"]
            ],
            5: [ 5: ["19:16"]
            ],
            6: [ 5: ["23:23"]
            ],
            7: [ 7: ["09:37"]
            ],
            8: [ 7: ["19:22"]
            ],
            9: [ 7: ["22:16"]
            ],
            10: [8: ["13:53"]
            ],
            11: [7: ["17:05"]
            ],
            12: [7: ["09:57"]
            ]
        ],
        1996 : [
            1: [ 6: ["09:36"]
            ],
            2: [ 4: ["21:18"]
            ],
            3: [ 5: ["15:21"]
            ],
            4: [ 4: ["20:10"]
            ],
            5: [ 5: ["13:29"]
            ],
            6: [ 5: ["17:38"]
            ],
            7: [ 7: ["03:52"]
            ],
            8: [ 7: ["13:38"]
            ],
            9: [ 7: ["16:32"]
            ],
            10: [8: ["08:09"]
            ],
            11: [7: ["11:20"]
            ],
            12: [7: ["04:12"]
            ]
        ],
        1995 : [
            1: [ 6: ["03:44"]
            ],
            2: [ 4: ["15:25"]
            ],
            3: [ 6: ["09:28"]
            ],
            4: [ 5: ["14:17"]
            ],
            5: [ 6: ["07:36"]
            ],
            6: [ 6: ["11:46"]
            ],
            7: [ 7: ["22:00"]
            ],
            8: [ 8: ["07:46"]
            ],
            9: [ 8: ["10:39"]
            ],
            10: [9: ["02:17"]
            ],
            11: [8: ["05:28"]
            ],
            12: [7: ["22:20"]
            ]
        ],
        1994 : [
            1: [ 5: ["21:59"]
            ],
            2: [ 4: ["09:40"]
            ],
            3: [ 6: ["03:43"]
            ],
            4: [ 5: ["08:33"]
            ],
            5: [ 6: ["01:52"]
            ],
            6: [ 6: ["06:01"]
            ],
            7: [ 7: ["16:15"]
            ],
            8: [ 8: ["02:00"]
            ],
            9: [ 8: ["04:52"]
            ],
            10: [8: ["20:29"]
            ],
            11: [7: ["23:38"]
            ],
            12: [7: ["16:29"]
            ]
        ],
        1993 : [
            1: [ 5: ["16:06"]
            ],
            2: [ 4: ["03:47"]
            ],
            3: [ 5: ["21:51"]
            ],
            4: [ 5: ["02:42"]
            ],
            5: [ 5: ["20:03"]
            ],
            6: [ 6: ["00:13"]
            ],
            7: [ 7: ["10:28"]
            ],
            8: [ 7: ["20:14"]
            ],
            9: [ 7: ["23:06"]
            ],
            10: [8: ["14:43"]
            ],
            11: [7: ["17:53"]
            ],
            12: [7: ["10:44"]
            ]
        ],
        1992 : [
            1: [ 6: ["10:17"]
            ],
            2: [ 4: ["21:58"]
            ],
            3: [ 5: ["16:01"]
            ],
            4: [ 4: ["20:52"]
            ],
            5: [ 5: ["14:12"]
            ],
            6: [ 5: ["18:21"]
            ],
            7: [ 7: ["04:36"]
            ],
            8: [ 7: ["14:21"]
            ],
            9: [ 7: ["17:13"]
            ],
            10: [8: ["08:50"]
            ],
            11: [7: ["11:59"]
            ],
            12: [7: ["04:50"]
            ]
        ],
        1991 : [
            1: [ 6: ["04:30"]
            ],
            2: [ 4: ["16:12"]
            ],
            3: [ 6: ["10:16"]
            ],
            4: [ 5: ["15:07"]
            ],
            5: [ 6: ["08:28"]
            ],
            6: [ 6: ["12:38"]
            ],
            7: [ 7: ["22:52"]
            ],
            8: [ 8: ["08:38"]
            ],
            9: [ 8: ["11:29"]
            ],
            10: [9: ["03:04"]
            ],
            11: [8: ["06:12"]
            ],
            12: [7: ["23:02"]
            ]
        ],
        1990 : [
            1: [ 5: ["22:36"]
            ],
            2: [ 4: ["10:18"]
            ],
            3: [ 6: ["04:22"]
            ],
            4: [ 5: ["09:14"]
            ],
            5: [ 6: ["06:47"]
            ],
            6: [ 6: ["06:47"]
            ],
            7: [ 7: ["17:02"]
            ],
            8: [ 8: ["02:48"]
            ],
            9: [ 8: ["05:40"]
            ],
            10: [8: ["21:16"]
            ],
            11: [8: ["00:25"]
            ],
            12: [7: ["17:15"]
            ]
        ],
        1989 : [
            1: [ 5: ["16:50"]
            ],
            2: [ 4: ["04:31"]
            ],
            3: [ 5: ["22:35"]
            ],
            4: [ 5: ["03:27"]
            ],
            5: [ 5: ["20:48"]
            ],
            6: [ 6: ["00:58"]
            ],
            7: [ 7: ["05:29"]
            ],
            8: [ 7: ["20:58"]
            ],
            9: [ 7: ["23:49"]
            ],
            10: [8: ["15:23"]
            ],
            11: [7: ["18:31"]
            ],
            12: [7: ["11:21"]
            ]
        ],
        1988 : [
            1: [ 6: ["11:00"]
            ],
            2: [ 4: ["22:42"]
            ],
            3: [ 5: ["16:47"]
            ],
            4: [ 4: ["21:40"]
            ],
            5: [ 5: ["15:03"]
            ],
            6: [ 5: ["19:14"]
            ],
            7: [ 7: ["05:29"]
            ],
            8: [ 7: ["15:14"]
            ],
            9: [ 7: ["18:05"]
            ],
            10: [8: ["09:39"]
            ],
            11: [7: ["12:46"]
            ],
            12: [7: ["05:36"]
            ]
        ],
        1987 : [
            1: [ 6: ["05:07"]
            ],
            2: [ 4: ["16:49"]
            ],
            3: [ 6: ["10:54"]
            ],
            4: [ 5: ["15:47"]
            ],
            5: [ 6: ["09:10"]
            ],
            6: [ 6: ["13:22"]
            ],
            7: [ 7: ["23:37"]
            ],
            8: [ 8: ["09:22"]
            ],
            9: [ 8: ["12:13"]
            ],
            10: [9: ["03:48"]
            ],
            11: [8: ["06:56"]
            ],
            12: [7: ["23:45"]
            ]
        ],
        1986 : [
            1: [ 5: ["23:22"]
            ],
            2: [ 4: ["11:04"]
            ],
            3: [ 6: ["05:09"]
            ],
            4: [ 5: ["10:02"]
            ],
            5: [ 6: ["03:24"]
            ],
            6: [ 6: ["07:36"]
            ],
            7: [ 7: ["17:51"]
            ],
            8: [ 8: ["03:35"]
            ],
            9: [ 8: ["06:25"]
            ],
            10: [8: ["21:58"]
            ],
            11: [8: ["01:04"]
            ],
            12: [7: ["17:53"]
            ]
        ],
        1985 : [
            1: [ 5: ["17:03"]
            ],
            2: [ 4: ["05:12"]
            ],
            3: [ 5: ["23:18"]
            ],
            4: [ 5: ["04:13"]
            ],
            5: [ 5: ["21:37"]
            ],
            6: [ 6: ["01:49"]
            ],
            7: [ 7: ["12:05"]
            ],
            8: [ 7: ["21:50"]
            ],
            9: [ 8: ["00:40"]
            ],
            10: [8: ["16:13"]
            ],
            11: [7: ["19:20"]
            ],
            12: [7: ["12:08"]
            ]
        ],
        1984 : [
            1: [ 6: ["11:39"]
            ],
            2: [ 4: ["23:21"]
            ],
            3: [ 5: ["17:27"]
            ],
            4: [ 4: ["22:21"]
            ],
            5: [ 5: ["15:44"]
            ],
            6: [ 5: ["19:57"]
            ],
            7: [ 7: ["06:21"]
            ],
            8: [ 7: ["15:57"]
            ],
            9: [ 7: ["18:47"]
            ],
            10: [8: ["10:20"]
            ],
            11: [7: ["13:27"]
            ],
            12: [7: ["06:15"]
            ]
        ],
        1983 : [
            1: [ 5: ["16:06"]
            ],
            2: [ 4: ["03:47"]
            ],
            3: [ 5: ["21:51"]
            ],
            4: [ 5: ["02:42"]
            ],
            5: [ 5: ["20:03"]
            ],
            6: [ 6: ["00:13"]
            ],
            7: [ 7: ["10:28"]
            ],
            8: [ 7: ["20:14"]
            ],
            9: [ 7: ["23:06"]
            ],
            10: [8: ["14:43"]
            ],
            11: [7: ["17:53"]
            ],
            12: [7: ["10:44"]
            ]
        ],
        1982 : [
            1: [ 6: ["00:00"]
            ],
            2: [ 4: ["11:42"]
            ],
            3: [ 6: ["05:49"]
            ],
            4: [ 5: ["10:45"]
            ],
            5: [ 6: ["08:24"]
            ],
            6: [ 6: ["08:24"]
            ],
            7: [ 7: ["18:40"]
            ],
            8: [ 8: ["04:25"]
            ],
            9: [ 8: ["07:14"]
            ],
            10: [8: ["22:47"]
            ],
            11: [8: ["01:52"]
            ],
            12: [7: ["18:40"]
            ]
        ],
        1981 : [
            1: [ 5: ["18:12"]
            ],
            2: [ 4: ["05:54"]
            ],
            3: [ 6: ["00:00"]
            ],
            4: [ 5: ["04:55"]
            ],
            5: [ 5: ["22:20"]
            ],
            6: [ 6: ["02:33"]
            ],
            7: [ 7: ["12:49"]
            ],
            8: [ 7: ["22:33"]
            ],
            9: [ 8: ["01:22"]
            ],
            10: [8: ["16:53"]
            ],
            11: [7: ["19:58"]
            ],
            12: [7: ["12:46"]
            ]
        ],
        1980 : [
            1: [ 6: ["12:24"]
            ],
            2: [ 5: ["00:07"]
            ],
            3: [ 5: ["18:14"]
            ],
            4: [ 4: ["23:10"]
            ],
            5: [ 5: ["16:36"]
            ],
            6: [ 5: ["20:50"]
            ],
            7: [ 7: ["07:06"]
            ],
            8: [ 7: ["16:50"]
            ],
            9: [ 7: ["19:38"]
            ],
            10: [8: ["11:09"]
            ],
            11: [7: ["14:13"]
            ],
            12: [7: ["06:59"]
            ]
        ],
        1979 : [
            1: [ 6: ["06:30"]
            ],
            2: [ 4: ["18:13"]
            ],
            3: [ 6: ["12:20"]
            ],
            4: [ 5: ["17:17"]
            ],
            5: [ 6: ["10:43"]
            ],
            6: [ 6: ["14:48"]
            ],
            7: [ 8: ["01:15"]
            ],
            8: [ 8: ["10:59"]
            ],
            9: [ 8: ["13:48"]
            ],
            10: [9: ["05:19"]
            ],
            11: [8: ["08:23"]
            ],
            12: [8: ["01:10"]
            ]
        ],
        1978 : [
            1: [ 6: ["00:45"]
            ],
            2: [ 4: ["12:27"]
            ],
            3: [ 6: ["06:34"]
            ],
            4: [ 5: ["11:31"]
            ],
            5: [ 6: ["04:56"]
            ],
            6: [ 6: ["09:11"]
            ],
            7: [ 7: ["19:26"]
            ],
            8: [ 8: ["05:10"]
            ],
            9: [ 8: ["07:58"]
            ],
            10: [8: ["23:28"]
            ],
            11: [8: ["02:31"]
            ],
            12: [7: ["19:17"]
            ]
        ],
        1977 : [
            1: [ 5: ["18:54"]
            ],
            2: [ 4: ["06:37"]
            ],
            3: [ 6: ["00:45"]
            ],
            4: [ 5: ["05:43"]
            ],
            5: [ 5: ["23:10"]
            ],
            6: [ 6: ["03:25"]
            ],
            7: [ 7: ["13:42"]
            ],
            8: [ 7: ["23:26"]
            ],
            9: [ 8: ["02:14"]
            ],
            10: [8: ["17:44"]
            ],
            11: [7: ["20:46"]
            ],
            12: [7: ["13:32"]
            ]
        ],
        
        1976 : [
            1: [ 6: ["13:02"]
            ],
            2: [ 5: ["00:45"]
            ],
            3: [ 5: ["18:53"]
            ],
            4: [ 4: ["23:50"]
            ],
            5: [ 5: ["17:17"]
            ],
            6: [ 5: ["21:33"]
            ],
            7: [ 7: ["07:50"]
            ],
            8: [ 7: ["17:34"]
            ],
            9: [ 7: ["21:21"]
            ],
            10: [8: ["11:51"]
            ],
            11: [7: ["12:20"]
            ],
            12: [7: ["07:40"]
            ]
        ],
        1975 : [
            1: [ 6: ["07:17"]
            ],
            2: [ 4: ["19:00"]
            ],
            3: [ 6: ["13:08"]
            ],
            4: [ 5: ["18:06"]
            ],
            5: [ 6: ["11:33"]
            ],
            6: [ 6: ["15:48"]
            ],
            7: [ 8: ["02:04"]
            ],
            8: [ 8: ["11:48"]
            ],
            9: [ 8: ["14:34"]
            ],
            10: [9: ["06:03"]
            ],
            11: [8: ["09:04"]
            ],
            12: [8: ["01:49"]
            ]
        ],
        1974 : [
            1: [ 6: ["01:24"]
            ],
            2: [ 4: ["13:07"]
            ],
            3: [ 6: ["07:16"]
            ],
            4: [ 5: ["12:15"]
            ],
            5: [ 6: ["05:44"]
            ],
            6: [ 6: ["10:00"]
            ],
            7: [ 7: ["20:17"]
            ],
            8: [ 8: ["06:02"]
            ],
            9: [ 8: ["08:48"]
            ],
            10: [8: ["03:19"]
            ],
            11: [8: ["03:19"]
            ],
            12: [7: ["20:04"]
            ]
        ],
        1973 : [
            1: [ 5: ["19:35"]
            ],
            2: [ 4: ["07:17"]
            ],
            3: [ 6: ["01:26"]
            ],
            4: [ 5: ["06:24"]
            ],
            5: [ 5: ["23:52"]
            ],
            6: [ 6: ["04:09"]
            ],
            7: [ 7: ["14:25"]
            ],
            8: [ 8: ["00:09"]
            ],
            9: [ 8: ["02:55"]
            ],
            10: [8: ["18:24"]
            ],
            11: [7: ["21:25"]
            ],
            12: [7: ["14:11"]
            ]
        ],
        1972 : [
            1: [ 6: ["13:48"]
            ],
            2: [ 5: ["01:31"]
            ],
            3: [ 5: ["19:41"]
            ],
            4: [ 5: ["00:40"]
            ],
            5: [ 5: ["18:09"]
            ],
            6: [ 5: ["22:25"]
            ],
            7: [ 7: ["08:42"]
            ],
            8: [ 7: ["18:25"]
            ],
            9: [ 7: ["21:11"]
            ],
            10: [8: ["12:38"]
            ],
            11: [7: ["15:39"]
            ],
            12: [7: ["08:23"]
            ]
        ],
        1971 : [
            1: [ 6: ["07:54"]
            ],
            2: [ 4: ["19:37"]
            ],
            3: [ 6: ["13:47"]
            ],
            4: [ 5: ["18:47"]
            ],
            5: [ 6: ["12:17"]
            ],
            6: [ 6: ["16:34"]
            ],
            7: [ 8: ["02:52"]
            ],
            8: [ 8: ["12:36"]
            ],
            9: [ 8: ["15:22"]
            ],
            10: [9: ["06:50"]
            ],
            11: [8: ["09:51"]
            ],
            12: [8: ["02:35"]
            ]
        ],
        1970 : [
            1: [ 6: ["02:08"]
            ],
            2: [ 4: ["13:50"]
            ],
            3: [ 6: ["08:00"]
            ],
            4: [ 5: ["12:59"]
            ],
            5: [ 6: ["06:29"]
            ],
            6: [ 6: ["10:45"]
            ],
            7: [ 7: ["21:03"]
            ],
            8: [ 8: ["06:46"]
            ],
            9: [ 8: ["09:31"]
            ],
            10: [9: ["00:57"]
            ],
            11: [8: ["03:57"]
            ],
            12: [7: ["20:41"]
            ]
        ],
        1969 : [
            1: [ 5: ["20:18"]
            ],
            2: [ 4: ["08:02"]
            ],
            3: [ 6: ["02:12"]
            ],
            4: [ 5: ["07:13"]
            ],
            5: [ 6: ["00:44"]
            ],
            6: [ 6: ["05:01"]
            ],
            7: [ 7: ["15:19"]
            ],
            8: [ 8: ["01:02"]
            ],
            9: [ 8: ["03:47"]
            ],
            10: [8: ["19:13"]
            ],
            11: [7: ["22:13"]
            ],
            12: [7: ["14:56"]
            ]
        ],
        1968 : [
            1: [ 6: ["14:25"]
            ],
            2: [ 5: ["02:08"]
            ],
            3: [ 5: ["20:19"]
            ],
            4: [ 5: ["01:20"]
            ],
            5: [ 5: ["18:51"]
            ],
            6: [ 5: ["23:09"]
            ],
            7: [ 7: ["09:27"]
            ],
            8: [ 7: ["19:10"]
            ],
            9: [ 7: ["21:56"]
            ],
            10: [8: ["13:22"]
            ],
            11: [7: ["16:22"]
            ],
            12: [7: ["09:06"]
            ]
        ],
        1967 : [
            1: [ 6: ["02:00"]
            ],
            2: [ 4: ["20:23"]
            ],
            3: [ 6: ["14:34"]
            ],
            4: [ 5: ["19:35"]
            ],
            5: [ 6: ["13:05"]
            ],
            6: [ 6: ["17:23"]
            ],
            7: [ 8: ["03:40"]
            ],
            8: [ 8: ["13:23"]
            ],
            9: [ 8: ["16:07"]
            ],
            10: [9: ["07:32"]
            ],
            11: [8: ["10:30"]
            ],
            12: [8: ["03:13"]
            ]
        ],
        1966 : [
            1: [ 6: ["02:48"]
            ],
            2: [ 4: ["14:32"]
            ],
            3: [ 6: ["08:43"]
            ],
            4: [ 5: ["13:45"]
            ],
            5: [ 6: ["07:17"]
            ],
            6: [ 6: ["11:36"]
            ],
            7: [ 7: ["21:55"]
            ],
            8: [ 8: ["07:38"]
            ],
            9: [ 8: ["10:22"]
            ],
            10: [9: ["01:48"]
            ],
            11: [8: ["04:46"]
            ],
            12: [7: ["21:28"]
            ]
        ],
        1965 : [
            1: [ 5: ["20:57"]
            ],
            2: [ 4: ["08:40"]
            ],
            3: [ 6: ["02:51"]
            ],
            4: [ 5: ["07:53"]
            ],
            5: [ 6: ["01:25"]
            ],
            6: [ 6: ["05:44"]
            ],
            7: [ 7: ["16:02"]
            ],
            8: [ 8: ["01:45"]
            ],
            9: [ 8: ["04:29"]
            ],
            10: [8: ["19:54"]
            ],
            11: [7: ["22:53"]
            ],
            12: [7: ["15:36"]
            ]
        ],
        1964 : [
            1: [ 6: ["15:12"]
            ],
            2: [ 5: ["02:55"]
            ],
            3: [ 5: ["21:07"]
            ],
            4: [ 5: ["02:09"]
            ],
            5: [ 5: ["19:41"]
            ],
            6: [ 6: ["00:00"]
            ],
            7: [ 7: ["10:18"]
            ],
            8: [ 7: ["20:01"]
            ],
            9: [ 7: ["22:44"]
            ],
            10: [8: ["14:07"]
            ],
            11: [7: ["17:04"]
            ],
            12: [7: ["09:46"]
            ]
        ],
        1963 : [
            1: [ 6: ["09:18"]
            ],
            2: [ 4: ["21:02"]
            ],
            3: [ 6: ["15:14"]
            ],
            4: [ 5: ["20:17"]
            ],
            5: [ 6: ["13:51"]
            ],
            6: [ 6: ["18:11"]
            ],
            7: [ 8: ["04:30"]
            ],
            8: [ 8: ["14:13"]
            ],
            9: [ 8: ["16:56"]
            ],
            10: [9: ["08:21"]
            ],
            11: [8: ["11:18"]
            ],
            12: [8: ["04:00"]
            ]
        ],
        1962 : [
            1: [ 7: ["00:11"]
            ],
            2: [ 5: ["12:00"]
            ],
            3: [ 6: ["06:27"]
            ],
            4: [ 5: ["11:52"]
            ],
            5: [ 6: ["05:47"]
            ],
            6: [ 6: ["10:23"]
            ],
            7: [ 7: ["20:48"]
            ],
            8: [ 8: ["06:25"]
            ],
            9: [ 8: ["08:53"]
            ],
            10: [8: ["23:55"]
            ],
            11: [7: ["18:56"]
            ],
            12: [7: ["18:56"]
            ]
        ],
        1961 : [
            1: [ 5: ["21:42"]
            ],
            2: [ 4: ["09:26"]
            ],
            3: [ 6: ["03:39"]
            ],
            4: [ 5: ["08:43"]
            ],
            5: [ 6: ["02:12"]
            ],
            6: [ 6: ["06:37"]
            ],
            7: [ 7: ["16:56"]
            ],
            8: [ 8: ["02:38"]
            ],
            9: [ 8: ["05:20"]
            ],
            10: [8: ["20:43"]
            ],
            11: [7: ["23:39"]
            ],
            12: [7: ["16:19"]
            ]
        ],
        1960 : [
            1: [ 6: ["15:48"]
            ],
            2: [ 5: ["03:32"]
            ],
            3: [ 5: ["21:45"]
            ],
            4: [ 5: ["02:50"]
            ],
            5: [ 5: ["20:24"]
            ],
            6: [ 6: ["00:45"]
            ],
            7: [ 7: ["11:04"]
            ],
            8: [ 7: ["20:47"]
            ],
            9: [ 7: ["23:30"]
            ],
            10: [8: ["14:53"]
            ],
            11: [7: ["17:49"]
            ],
            12: [7: ["10:31"]
            ]
        ],
        1959 : [
            1: [ 6: ["10:03"]
            ],
            2: [ 4: ["21:47"]
            ],
            3: [ 6: ["15:59"]
            ],
            4: [ 5: ["21:03"]
            ],
            5: [ 6: ["14:37"]
            ],
            6: [ 6: ["18:58"]
            ],
            7: [ 8: ["05:16"]
            ],
            8: [ 8: ["14:58"]
            ],
            9: [ 8: ["17:40"]
            ],
            10: [9: ["09:02"]
            ],
            11: [8: ["11:57"]
            ],
            12: [7: ["04:37"]
            ]
        ],
        1958 : [
            1: [ 6: ["04:12"]
            ],
            2: [ 4: ["15:57"]
            ],
            3: [ 6: ["10:10"]
            ],
            4: [ 5: ["15:16"]
            ],
            5: [ 6: ["08:51"]
            ],
            6: [ 6: ["13:13"]
            ],
            7: [ 7: ["23:32"]
            ],
            8: [ 8: ["09:14"]
            ],
            9: [ 8: ["11:56"]
            ],
            10: [9: ["03:18"]
            ],
            11: [8: ["06:12"]
            ],
            12: [7: ["22:52"]
            ]
        ],
        1957 : [
            1: [ 5: ["22:20"]
            ],
            2: [ 4: ["10:04"]
            ],
            3: [ 6: ["04:17"]
            ],
            4: [ 5: ["09:23"]
            ],
            5: [ 6: ["02:58"]
            ],
            6: [ 6: ["07:20"]
            ],
            7: [ 7: ["17:39"]
            ],
            8: [ 8: ["03:22"]
            ],
            9: [ 8: ["06:03"]
            ],
            10: [8: ["21:25"]
            ],
            11: [8: ["00:20"]
            ],
            12: [7: ["17:01"]
            ]
        ],
        1956 : [
            1: [ 6: ["16:35"]
            ],
            2: [ 5: ["04:19"]
            ],
            3: [ 5: ["22:33"]
            ],
            4: [ 5: ["03:38"]
            ],
            5: [ 5: ["21:14"]
            ],
            6: [ 6: ["01:35"]
            ],
            7: [ 7: ["11:54"]
            ],
            8: [ 7: ["21:36"]
            ],
            9: [ 8: ["00:16"]
            ],
            10: [8: ["15:37"]
            ],
            11: [7: ["18:30"]
            ],
            12: [7: ["11:10"]
            ]
        ],
        1955 : [
            1: [ 6: ["10:41"]
            ],
            2: [ 4: ["22:26"]
            ],
            3: [ 6: ["16:41"]
            ],
            4: [ 5: ["21:48"]
            ],
            5: [ 6: ["15:25"]
            ],
            6: [ 6: ["19:47"]
            ],
            7: [ 8: ["06:07"]
            ],
            8: [ 8: ["15:49"]
            ],
            9: [ 8: ["18:31"]
            ],
            10: [9: ["09:51"]
            ],
            11: [8: ["12:45"]
            ],
            12: [8: ["05:24"]
            ]
        ],
        1954 : [
            1: [ 6: ["04:52"]
            ],
            2: [ 4: ["16:37"]
            ],
            3: [ 6: ["10:51"]
            ],
            4: [ 5: ["15:57"]
            ],
            5: [ 6: ["09:33"]
            ],
            6: [ 6: ["13:56"]
            ],
            7: [ 8: ["00:15"]
            ],
            8: [ 8: ["09:57"]
            ],
            9: [ 8: ["12:38"]
            ],
            10: [9: ["03:58"]
            ],
            11: [8: ["06:51"]
            ],
            12: [7: ["23:31"]
            ]
        ],
        1953 : [
            1: [ 5: ["23:06"]
            ],
            2: [ 4: ["10:51"]
            ],
            3: [ 6: ["05:06"]
            ],
            4: [ 5: ["10:13"]
            ],
            5: [ 6: ["03:50"]
            ],
            6: [ 6: ["08:12"]
            ],
            7: [ 7: ["18:32"]
            ],
            8: [ 8: ["04:13"]
            ],
            9: [ 8: ["06:53"]
            ],
            10: [8: ["22:21"]
            ],
            11: [8: ["01:05"]
            ],
            12: [7: ["17:43"]
            ]
        ],
        1952 : [
            1: [ 6: ["17:12"]
            ],
            2: [ 5: ["04:57"]
            ],
            3: [ 5: ["23:12"]
            ],
            4: [ 5: ["04:20"]
            ],
            5: [ 5: ["21:58"]
            ],
            6: [ 6: ["02:22"]
            ],
            7: [ 7: ["12:42"]
            ],
            8: [ 7: ["22:24"]
            ],
            9: [ 8: ["01:04"]
            ],
            10: [8: ["16:24"]
            ],
            11: [7: ["19:17"]
            ],
            12: [7: ["11:56"]
            ]
        ],
        1951 : [
            1: [ 6: ["11:25"]
            ],
            2: [ 4: ["23:10"]
            ],
            3: [ 6: ["17:25"]
            ],
            4: [ 5: ["22:32"]
            ],
            5: [ 6: ["16:09"]
            ],
            6: [ 6: ["20:33"]
            ],
            7: [ 8: ["06:52"]
            ],
            8: [ 8: ["16:33"]
            ],
            9: [ 8: ["19:13"]
            ],
            10: [9: ["10:31"]
            ],
            11: [8: ["13:23"]
            ],
            12: [8: ["06:01"]
            ]
        ],
        1950 : [
            1: [ 6: ["05:36"]
            ],
            2: [ 4: ["17:21"]
            ],
            3: [ 6: ["11:37"]
            ],
            4: [ 5: ["16:46"]
            ],
            5: [ 6: ["10:25"]
            ],
            6: [ 6: ["14:49"]
            ],
            7: [ 8: ["01:09"]
            ],
            8: [ 8: ["10:50"]
            ],
            9: [ 8: ["13:29"]
            ],
            10: [9: ["04:47"]
            ],
            11: [8: ["07:39"]
            ],
            12: [8: ["00:16"]
            ]
        ],
        1949 : [
            1: [ 5: ["23:43"]
            ],
            2: [ 4: ["11:28"]
            ],
            3: [ 6: ["05:44"]
            ],
            4: [ 5: ["10:52"]
            ],
            5: [ 6: ["04:31"]
            ],
            6: [ 6: ["08:56"]
            ],
            7: [ 7: ["19:17"]
            ],
            8: [ 8: ["04:58"]
            ],
            9: [ 8: ["07:38"]
            ],
            10: [8: ["22:56"]
            ],
            11: [8: ["01:48"]
            ],
            12: [7: ["18:26"]
            ]
        ],
        1948 : [
            1: [ 6: ["17:58"]
            ],
            2: [ 5: ["05:43"]
            ],
            3: [ 5: ["23:59"]
            ],
            4: [ 5: ["05:07"]
            ],
            5: [ 5: ["22:46"]
            ],
            6: [ 6: ["03:10"]
            ],
            7: [ 7: ["13:30"]
            ],
            8: [ 7: ["23:11"]
            ],
            9: [ 8: ["01:49"]
            ],
            10: [8: ["17:06"]
            ],
            11: [7: ["19:56"]
            ],
            12: [7: ["12:33"]
            ]
        ],
        1947 : [
            1: [ 6: ["12:06"]
            ],
            2: [ 4: ["23:51"]
            ],
            3: [ 6: ["18:08"]
            ],
            4: [ 5: ["23:18"]
            ],
            5: [ 6: ["16:58"]
            ],
            6: [ 6: ["21:24"]
            ],
            7: [ 8: ["07:45"]
            ],
            8: [ 8: ["17:26"]
            ],
            9: [ 8: ["20:04"]
            ],
            10: [9: ["11:22"]
            ],
            11: [8: ["14:12"]
            ],
            12: [8: ["06:49"]
            ]
        ],
        1946 : [
            1: [ 6: ["06:15"]
            ],
            2: [ 4: ["18:00"]
            ],
            3: [ 6: ["12:16"]
            ],
            4: [ 5: ["17:26"]
            ],
            5: [ 6: ["11:06"]
            ],
            6: [ 6: ["15:31"]
            ],
            7: [ 8: ["01:52"]
            ],
            8: [ 8: ["11:33"]
            ],
            9: [ 8: ["14:11"]
            ],
            10: [8: ["08:19"]
            ],
            11: [8: ["08:19"]
            ],
            12: [8: ["00:56"]
            ]
        ],
        1945 : [
            1: [ 6: ["00:29"]
            ],
            2: [ 4: ["12:15"]
            ],
            3: [ 6: ["06:32"]
            ],
            4: [ 5: ["11:42"]
            ],
            5: [ 6: ["05:22"]
            ],
            6: [ 6: ["09:48"]
            ],
            7: [ 7: ["20:08"]
            ],
            8: [ 8: ["05:48"]
            ],
            9: [ 8: ["08:26"]
            ],
            10: [8: ["23:41"]
            ],
            11: [8: ["02:30"]
            ],
            12: [7: ["19:06"]
            ]
        ],
        1944 : [
            1: [ 6: ["18:35"]
            ],
            2: [ 5: ["06:21"]
            ],
            3: [ 6: ["00:39"]
            ],
            4: [ 5: ["05:50"]
            ],
            5: [ 5: ["23:32"]
            ],
            6: [ 6: ["03:58"]
            ],
            7: [ 7: ["17:19"]
            ],
            8: [ 8: ["00:01"]
            ],
            9: [ 8: ["02:38"]
            ],
            10: [8: ["17:55"]
            ],
            11: [7: ["20:44"]
            ],
            12: [7: ["13:20"]
            ]
        ],
        1943 : [
            1: [ 6: ["12:48"]
            ],
            2: [ 5: ["00:33"]
            ],
            3: [ 6: ["18:50"]
            ],
            4: [ 6: ["00:01"]
            ],
            5: [ 6: ["17:42"]
            ],
            6: [ 6: ["22:08"]
            ],
            7: [ 8: ["08:28"]
            ],
            8: [ 8: ["18:09"]
            ],
            9: [ 8: ["20:46"]
            ],
            10: [9: ["12:01"]
            ],
            11: [8: ["14:50"]
            ],
            12: [8: ["07:26"]
            ]
        ],
        1942 : [
            1: [ 6: ["07:00"]
            ],
            2: [ 4: ["18:46"]
            ],
            3: [ 6: ["13:04"]
            ],
            4: [ 5: ["18:16"]
            ],
            5: [ 6: ["11:58"]
            ],
            6: [ 6: ["16:24"]
            ],
            7: [ 8: ["02:45"]
            ],
            8: [ 8: ["12:26"]
            ],
            9: [ 8: ["15:02"]
            ],
            10: [9: ["06:17"]
            ],
            11: [8: ["09:05"]
            ],
            12: [8: ["01:39"]
            ]
        ],
        1941 : [
            1: [ 6: ["01:06"]
            ],
            2: [ 4: ["12:52"]
            ],
            3: [ 6: ["07:10"]
            ],
            4: [ 5: ["12:22"]
            ],
            5: [ 6: ["06:05"]
            ],
            6: [ 6: ["10:32"]
            ],
            7: [ 7: ["20:54"]
            ],
            8: [ 8: ["06:35"]
            ],
            9: [ 8: ["09:12"]
            ],
            10: [9: ["00:27"]
            ],
            11: [8: ["03:15"]
            ],
            12: [7: ["19:51"]
            ]
        ],
        1940 : [
            1: [ 6: ["19:21"]
            ],
            2: [ 5: ["07:06"]
            ],
            3: [ 6: ["01:24"]
            ],
            4: [ 5: ["06:36"]
            ],
            5: [ 6: ["00:18"]
            ],
            6: [ 6: ["04:45"]
            ],
            7: [ 7: ["15:06"]
            ],
            8: [ 8: ["00:46"]
            ],
            9: [ 8: ["03:22"]
            ],
            10: [8: ["18:35"]
            ],
            11: [7: ["21:23"]
            ],
            12: [7: ["20:30"]
            ]
        ],
        1939 : [
            1: [ 6: ["13:30"]
            ],
            2: [ 5: ["01:16"]
            ],
            3: [ 6: ["19:35"]
            ],
            4: [ 6: ["00:49"]
            ],
            5: [ 6: ["18:32"]
            ],
            6: [ 6: ["23:00"]
            ],
            7: [ 8: ["09:22"]
            ],
            8: [ 8: ["19:02"]
            ],
            9: [ 8: ["21:38"]
            ],
            10: [9: ["12:51"]
            ],
            11: [8: ["15:38"]
            ],
            12: [7: ["08:12"]
            ]
        ],
        1938 : [
            1: [ 6: ["07:38"]
            ],
            2: [ 4: ["19:23"]
            ],
            3: [ 6: ["13:42"]
            ],
            4: [ 5: ["18:55"]
            ],
            5: [ 6: ["12:39"]
            ],
            6: [ 6: ["17:07"]
            ],
            7: [ 8: ["03:29"]
            ],
            8: [ 8: ["13:09"]
            ],
            9: [ 8: ["15:45"]
            ],
            10: [9: ["06:59"]
            ],
            11: [8: ["09:46"]
            ],
            12: [8: ["02:21"]
            ]
        ],
        1937 : [
            1: [ 6: ["01:53"]
            ],
            2: [ 4: ["13:39"]
            ],
            3: [ 6: ["07:58"]
            ],
            4: [ 5: ["13:11"]
            ],
            5: [ 6: ["06:55"]
            ],
            6: [ 6: ["11:22"]
            ],
            7: [ 7: ["21:44"]
            ],
            8: [ 8: ["07:23"]
            ],
            9: [ 8: ["09:58"]
            ],
            10: [9: ["01:11"]
            ],
            11: [8: ["01:18"]
            ],
            12: [7: ["20:30"]
            ]
        ],
        1936 : [
            1: [ 6: ["19:59"]
            ],
            2: [ 5: ["07:46"]
            ],
            3: [ 6: ["02:06"]
            ],
            4: [ 5: ["07:21"]
            ],
            5: [ 6: ["01:06"]
            ],
            6: [ 6: ["05:35"]
            ],
            7: [ 7: ["15:57"]
            ],
            8: [ 8: ["01:37"]
            ],
            9: [ 8: ["04:12"]
            ],
            10: [8: ["19:25"]
            ],
            11: [7: ["22:11"]
            ],
            12: [7: ["14:45"]
            ]
        ],
        1935 : [
            1: [ 6: ["14:10"]
            ],
            2: [ 5: ["01:56"]
            ],
            3: [ 6: ["20:16"]
            ],
            4: [ 6: ["01:30"]
            ],
            5: [ 6: ["19:14"]
            ],
            6: [ 6: ["23:43"]
            ],
            7: [ 8: ["10:05"]
            ],
            8: [ 8: ["19:45"]
            ],
            9: [ 8: ["22:19"]
            ],
            10: [9: ["13:32"]
            ],
            11: [8: ["16:17"]
            ],
            12: [8: ["08:51"]
            ]
        ],
        1934 : [
            1: [ 6: ["08:24"]
            ],
            2: [ 4: ["20:10"]
            ],
            3: [ 6: ["14:31"]
            ],
            4: [ 5: ["19:45"]
            ],
            5: [ 6: ["13:31"]
            ],
            6: [ 6: ["18:00"]
            ],
            7: [ 8: ["04:22"]
            ],
            8: [ 8: ["14:01"]
            ],
            9: [ 8: ["16:35"]
            ],
            10: [9: ["07:46"]
            ],
            11: [8: ["10:30"]
            ],
            12: [8: ["03:03"]
            ]
        ],
        1933 : [
            1: [ 6: ["02:29"]
            ],
            2: [ 4: ["14:16"]
            ],
            3: [ 6: ["08:37"]
            ],
            4: [ 5: ["13:53"]
            ],
            5: [ 6: ["07:39"]
            ],
            6: [ 6: ["12:09"]
            ],
            7: [ 7: ["22:32"]
            ],
            8: [ 8: ["08:12"]
            ],
            9: [ 8: ["10:46"]
            ],
            10: [9: ["01:58"]
            ],
            11: [8: ["04:43"]
            ],
            12: [7: ["21:16"]
            ]
        ],
        1932 : [
            1: [ 6: ["20:43"]
            ],
            2: [ 5: ["08:29"]
            ],
            3: [ 6: ["02:50"]
            ],
            4: [ 5: ["08:05"]
            ],
            5: [ 6: ["01:50"]
            ],
            6: [ 6: ["06:20"]
            ],
            7: [ 7: ["16:42"]
            ],
            8: [ 8: ["02:21"]
            ],
            9: [ 8: ["04:55"]
            ],
            10: [8: ["20:05"]
            ],
            11: [7: ["22:49"]
            ],
            12: [7: ["15:22"]
            ]
        ],
        1931 : [
            1: [ 6: ["14:54"]
            ],
            2: [ 5: ["02:41"]
            ],
            3: [ 6: ["21:02"]
            ],
            4: [ 6: ["02:19"]
            ],
            5: [ 6: ["20:06"]
            ],
            6: [ 7: ["00:36"]
            ],
            7: [ 8: ["10:58"]
            ],
            8: [ 8: ["20:38"]
            ],
            9: [ 8: ["23:11"]
            ],
            10: [9: ["14:21"]
            ],
            11: [8: ["17:04"]
            ],
            12: [8: ["09:36"]
            ]
        ],
        1930 : [
            1: [ 6: ["09:00"]
            ],
            2: [ 4: ["20:47"]
            ],
            3: [ 6: ["15:09"]
            ],
            4: [ 5: ["20:25"]
            ],
            5: [ 6: ["14:12"]
            ],
            6: [ 6: ["18:43"]
            ],
            7: [ 8: ["05:06"]
            ],
            8: [ 8: ["14:46"]
            ],
            9: [ 8: ["17:20"]
            ],
            10: [9: ["08:30"]
            ],
            11: [8: ["11:14"]
            ],
            12: [8: ["03:46"]
            ]
        ],
        1929 : [
            1: [ 6: ["03:16"]
            ],
            2: [ 4: ["15:02"]
            ],
            3: [ 6: ["09:23"]
            ],
            4: [ 5: ["14:40"]
            ],
            5: [ 6: ["08:27"]
            ],
            6: [ 6: ["12:57"]
            ],
            7: [ 7: ["23:20"]
            ],
            8: [ 8: ["08:58"]
            ],
            9: [ 8: ["11:31"]
            ],
            10: [9: ["02:40"]
            ],
            11: [8: ["05:22"]
            ],
            12: [7: ["21:53"]
            ]
        ],
        1928 : [
            1: [ 6: ["21:23"]
            ],
            2: [ 5: ["09:11"]
            ],
            3: [ 6: ["03:33"]
            ],
            4: [ 5: ["08:51"]
            ],
            5: [ 6: ["02:39"]
            ],
            6: [ 6: ["07:11"]
            ],
            7: [ 7: ["17:34"]
            ],
            8: [ 8: ["03:14"]
            ],
            9: [ 8: ["05:46"]
            ],
            10: [8: ["20:55"]
            ],
            11: [7: ["23:38"]
            ],
            12: [7: ["16:09"]
            ]
        ],
        1927 : [
            1: [ 6: ["15:33"]
            ],
            2: [ 5: ["03:19"]
            ],
            3: [ 6: ["21:41"]
            ],
            4: [ 6: ["02:59"]
            ],
            5: [ 6: ["20:47"]
            ],
            6: [ 7: ["01:19"]
            ],
            7: [ 8: ["11:42"]
            ],
            8: [ 8: ["21:21"]
            ],
            9: [ 8: ["23:53"]
            ],
            10: [9: ["15:02"]
            ],
            11: [8: ["17:45"]
            ],
            12: [8: ["10:16"]
            ]
        ],
        1926 : [
            1: [ 6: ["09:47"]
            ],
            2: [ 4: ["21:34"]
            ],
            3: [ 6: ["15:57"]
            ],
            4: [ 5: ["21:15"]
            ],
            5: [ 6: ["15:03"]
            ],
            6: [ 6: ["19:35"]
            ],
            7: [ 8: ["05:58"]
            ],
            8: [ 8: ["15:36"]
            ],
            9: [ 8: ["18:07"]
            ],
            10: [9: ["09:15"]
            ],
            11: [8: ["11:56"]
            ],
            12: [8: ["04:26"]
            ]
        ],
        1925 : [
            1: [ 6: ["03:53"]
            ],
            2: [ 4: ["15:41"]
            ],
            3: [ 6: ["10:04"]
            ],
            4: [ 5: ["15:23"]
            ],
            5: [ 6: ["09:13"]
            ],
            6: [ 6: ["13:45"]
            ],
            7: [ 8: ["00:09"]
            ],
            8: [ 8: ["09:48"]
            ],
            9: [ 8: ["12:20"]
            ],
            10: [9: ["03:29"]
            ],
            11: [8: ["06:10"]
            ],
            12: [7: ["22:40"]
            ]
        ],
        1924 : [
            1: [ 6: ["22:05"]
            ],
            2: [ 5: ["09:52"]
            ],
            3: [ 6: ["04:15"]
            ],
            4: [ 5: ["09:34"]
            ],
            5: [ 6: ["03:23"]
            ],
            6: [ 6: ["07:55"]
            ],
            7: [ 7: ["18:18"]
            ],
            8: [ 8: ["03:57"]
            ],
            9: [ 8: ["06:28"]
            ],
            10: [8: ["21:35"]
            ],
            11: [8: ["00:16"]
            ],
            12: [7: ["16:46"]
            ]
        ],
        1923 : [
            1: [ 6: ["16:18"]
            ],
            2: [ 5: ["04:06"]
            ],
            3: [ 6: ["22:29"]
            ],
            4: [ 6: ["03:49"]
            ],
            5: [ 6: ["21:39"]
            ],
            6: [ 7: ["02:11"]
            ],
            7: [ 8: ["12:35"]
            ],
            8: [ 8: ["22:13"]
            ],
            9: [ 9: ["00:44"]
            ],
            10: [9: ["15:50"]
            ],
            11: [8: ["18:30"]
            ],
            12: [8: ["04:50"]
            ]
        ],
        1922 : [
            1: [ 6: ["10:24"]
            ],
            2: [ 4: ["22:11"]
            ],
            3: [ 6: ["16:35"]
            ],
            4: [ 5: ["21:55"]
            ],
            5: [ 6: ["15:46"]
            ],
            6: [ 6: ["20:20"]
            ],
            7: [ 8: ["06:44"]
            ],
            8: [ 8: ["16:23"]
            ],
            9: [ 8: ["18:54"]
            ],
            10: [9: ["10:01"]
            ],
            11: [8: ["12:41"]
            ],
            12: [8: ["05:11"]
            ]
        ],
        1921 : [
            1: [ 6: ["04:38"]
            ],
            2: [ 4: ["16:26"]
            ],
            3: [ 6: ["10:49"]
            ],
            4: [ 5: ["16:09"]
            ],
            5: [ 6: ["09:59"]
            ],
            6: [ 6: ["14:32"]
            ],
            7: [ 8: ["00:56"]
            ],
            8: [ 8: ["10:33"]
            ],
            9: [ 8: ["13:03"]
            ],
            10: [9: ["22:15"]
            ],
            11: [8: ["06:49"]
            ],
            12: [7: ["23:17"]
            ]
        ],
        1920 : [
            1: [ 6: ["22:47"]
            ],
            2: [ 5: ["10:36"]
            ],
            3: [ 6: ["05:00"]
            ],
            4: [ 5: ["10:21"]
            ],
            5: [ 6: ["04:13"]
            ],
            6: [ 6: ["08:47"]
            ],
            7: [ 7: ["19:11"]
            ],
            8: [ 8: ["04:50"]
            ],
            9: [ 8: ["07:20"]
            ],
            10: [8: ["22:25"]
            ],
            11: [8: ["01:04"]
            ],
            12: [7: ["17:32"]
            ]
        ],
        1919 : [
            1: [ 6: ["16:55"]
            ],
            2: [ 5: ["04:43"]
            ],
            3: [ 6: ["23:07"]
            ],
            4: [ 6: ["00:20"]
            ],
            5: [ 6: ["22:20"]
            ],
            6: [ 7: ["02:54"]
            ],
            7: [ 8: ["13:19"]
            ],
            8: [ 8: ["22:57"]
            ],
            9: [ 9: ["01:27"]
            ],
            10: [9: ["16:33"]
            ],
            11: [8: ["19:12"]
            ],
            12: [8: ["11:41"]
            ]
        ],
        1918 : [
            1: [ 6: ["11:10"]
            ],
            2: [ 4: ["22:58"]
            ],
            3: [ 6: ["17:24"]
            ],
            4: [ 5: ["22:44"]
            ],
            5: [ 6: ["16:36"]
            ],
            6: [ 6: ["21:10"]
            ],
            7: [ 8: ["07:34"]
            ],
            8: [ 8: ["17:11"]
            ],
            9: [ 8: ["19:40"]
            ],
            10: [9: ["10:44"]
            ],
            11: [8: ["13:22"]
            ],
            12: [8: ["05:50"]
            ]
        ],
        1917 : [
            1: [ 6: ["05:17"]
            ],
            2: [ 4: ["17:06"]
            ],
            3: [ 6: ["11:31"]
            ],
            4: [ 5: ["16:54"]
            ],
            5: [ 6: ["10:47"]
            ],
            6: [ 6: ["15:22"]
            ],
            7: [ 8: ["01:47"]
            ],
            8: [ 8: ["11:25"]
            ],
            9: [ 8: ["13:54"]
            ],
            10: [9: ["04:59"]
            ],
            11: [8: ["07:37"]
            ],
            12: [8: ["00:05"]
            ]
        ],
        1916 : [
            1: [ 6: ["23:28"]
            ],
            2: [ 5: ["11:16"]
            ],
            3: [ 6: ["05:41"]
            ],
            4: [ 5: ["11:02"]
            ],
            5: [ 6: ["04:55"]
            ],
            6: [ 6: ["09:30"]
            ],
            7: [ 7: ["19:55"]
            ],
            8: [ 8: ["05:32"]
            ],
            9: [ 8: ["08:01"]
            ],
            10: [8: ["23:06"]
            ],
            11: [8: ["01:43"]
            ],
            12: [7: ["18:11"]
            ]
        ],
        1915 : [
            1: [ 6: ["17:41"]
            ],
            2: [ 5: ["05:30"]
            ],
            3: [ 6: ["23:56"]
            ],
            4: [ 5: ["05:18"]
            ],
            5: [ 6: ["23:12"]
            ],
            6: [ 7: ["03:47"]
            ],
            7: [ 8: ["14:11"]
            ],
            8: [ 8: ["23:49"]
            ],
            9: [ 9: ["02:17"]
            ],
            10: [9: ["17:20"]
            ],
            11: [8: ["19:56"]
            ],
            12: [8: ["12:23"]
            ]
        ],
        1914 : [
            1: [ 6: ["11:47"]
            ],
            2: [ 4: ["23:36"]
            ],
            3: [ 6: ["18:02"]
            ],
            4: [ 5: ["23:26"]
            ],
            5: [ 6: ["17:20"]
            ],
            6: [ 6: ["21:56"]
            ],
            7: [ 8: ["08:21"]
            ],
            8: [ 8: ["17:59"]
            ],
            9: [ 8: ["20:28"]
            ],
            10: [9: ["11:32"]
            ],
            11: [8: ["14:09"]
            ],
            12: [8: ["06:36"]
            ]
        ],
        1913 : [
            1: [ 6: ["06:01"]
            ],
            2: [ 4: ["17:49"]
            ],
            3: [ 6: ["12:14"]
            ],
            4: [ 5: ["17:38"]
            ],
            5: [ 6: ["11:31"]
            ],
            6: [ 6: ["16:07"]
            ],
            7: [ 8: ["02:32"]
            ],
            8: [ 8: ["12:09"]
            ],
            9: [ 8: ["14:36"]
            ],
            10: [9: ["05:39"]
            ],
            11: [8: ["08:15"]
            ],
            12: [8: ["00:42"]
            ]
        ],
        1912 : [
            1: [ 7: ["00:11"]
            ],
            2: [ 5: ["12:00"]
            ],
            3: [ 6: ["06:27"]
            ],
            4: [ 5: ["11:52"]
            ],
            5: [ 6: ["05:47"]
            ],
            6: [ 6: ["10:23"]
            ],
            7: [ 7: ["20:38"]
            ],
            8: [ 8: ["06:25"]
            ],
            9: [ 8: ["08:53"]
            ],
            10: [8: ["23:55"]
            ],
            11: [8: ["02:30"]
            ],
            12: [7: ["18:56"]
            ]
        ],
        1911 : [
            1: [ 6: ["18:18"]
            ],
            2: [ 5: ["06:07"]
            ],
            3: [ 7: ["00:34"]
            ],
            4: [ 6: ["05:58"]
            ],
            5: [ 6: ["23:54"]
            ],
            6: [ 7: ["04:31"]
            ],
            7: [ 8: ["14:56"]
            ],
            8: [ 9: ["00:34"]
            ],
            9: [ 9: ["03:01"]
            ],
            10: [9: ["18:04"]
            ],
            11: [8: ["20:40"]
            ],
            12: [8: ["13:06"]
            ]
        ],
        1910 : [
            1: [ 6: ["12:33"]
            ],
            2: [ 5: ["00:22"]
            ],
            3: [ 6: ["18:48"]
            ],
            4: [ 6: ["00:13"]
            ],
            5: [ 6: ["18:08"]
            ],
            6: [ 6: ["22:45"]
            ],
            7: [ 8: ["09:09"]
            ],
            8: [ 8: ["18:46"]
            ],
            9: [ 8: ["21:12"]
            ],
            10: [9: ["12:14"]
            ],
            11: [8: ["14:48"]
            ],
            12: [8: ["07:13"]
            ]
        ],
        1909 : [
            1: [ 6: ["06:41"]
            ],
            2: [ 4: ["18:30"]
            ],
            3: [ 6: ["12:58"]
            ],
            4: [ 5: ["18:24"]
            ],
            5: [ 6: ["12:21"]
            ],
            6: [ 6: ["16:58"]
            ],
            7: [ 8: ["03:24"]
            ],
            8: [ 8: ["13:01"]
            ],
            9: [ 8: ["15:28"]
            ],
            10: [9: ["06:29"]
            ],
            11: [8: ["09:04"]
            ],
            12: [8: ["01:29"]
            ]
        ],
        1908 : [
            1: [ 7: ["00:50"]
            ],
            2: [ 5: ["12:39"]
            ],
            3: [ 6: ["07:06"]
            ],
            4: [ 5: ["12:32"]
            ],
            5: [ 6: ["06:28"]
            ],
            6: [ 6: ["11:06"]
            ],
            7: [ 7: ["21:31"]
            ],
            8: [ 8: ["07:09"]
            ],
            9: [ 8: ["09:35"]
            ],
            10: [9: ["00:36"]
            ],
            11: [8: ["03:11"]
            ],
            12: [7: ["19:36"]
            ]
        ],
        1907 : [
            1: [ 6: ["19:05"]
            ],
            2: [ 5: ["06:54"]
            ],
            3: [ 7: ["01:22"]
            ],
            4: [ 6: ["06:48"]
            ],
            5: [ 7: ["00:44"]
            ],
            6: [ 7: ["05:22"]
            ],
            7: [ 8: ["15:47"]
            ],
            8: [ 9: ["01:24"]
            ],
            9: [ 9: ["03:49"]
            ],
            10: [9: ["18:49"]
            ],
            11: [8: ["21:22"]
            ],
            12: [7: ["13:46"]
            ]
        ],
        1906 : [
            1: [ 6: ["13:11"]
            ],
            2: [ 5: ["01:00"]
            ],
            3: [ 6: ["19:29"]
            ],
            4: [ 6: ["00:56"]
            ],
            5: [ 6: ["18:54"]
            ],
            6: [ 6: ["23:33"]
            ],
            7: [ 8: ["09:59"]
            ],
            8: [ 8: ["19:36"]
            ],
            9: [ 8: ["22:02"]
            ],
            10: [9: ["13:02"]
            ],
            11: [8: ["15:36"]
            ],
            12: [7: ["08:00"]
            ]
        ],
        1905 : [
            1: [ 6: ["07:23"]
            ],
            2: [ 4: ["19:12"]
            ],
            3: [ 6: ["13:06"]
            ],
            4: [ 5: ["19:06"]
            ],
            5: [ 6: ["13:04"]
            ],
            6: [ 6: ["17:42"]
            ],
            7: [ 8: ["04:08"]
            ],
            8: [ 8: ["13:44"]
            ],
            9: [ 8: ["16:10"]
            ],
            10: [9: ["07:09"]
            ],
            11: [8: ["09:59"]
            ],
            12: [7: ["02:06"]
            ]
        ],
        1904 : [
            1: [ 7: ["01:35"]
            ],
            2: [ 5: ["13:25"]
            ],
            3: [ 6: ["07:54"]
            ],
            4: [ 5: ["13:22"]
            ],
            5: [ 6: ["07:20"]
            ],
            6: [ 7: ["06:07"]
            ],
            7: [ 7: ["22:25"]
            ],
            8: [ 8: ["08:01"]
            ],
            9: [ 8: ["10:26"]
            ],
            10: [9: ["01:24"]
            ],
            11: [8: ["03:56"]
            ],
            12: [7: ["20:19"]
            ]
        ],
        1903 : [
            1: [ 6: ["19:41"]
            ],
            2: [ 5: ["07:31"]
            ],
            3: [ 7: ["02:00"]
            ],
            4: [ 6: ["07:28"]
            ],
            5: [ 7: ["01:27"]
            ],
            6: [ 7: ["06:07"]
            ],
            7: [ 8: ["16:34"]
            ],
            8: [ 9: ["02:10"]
            ],
            9: [ 9: ["04:36"]
            ],
            10: [9: ["19:35"]
            ],
            11: [8: ["22:07"]
            ],
            12: [8: ["14:31"]
            ]
        ],
        1902 : [
            1: [ 6: ["13:56"]
            ],
            2: [ 5: ["01:45"]
            ],
            3: [ 6: ["20:14"]
            ],
            4: [ 6: ["01:42"]
            ],
            5: [ 6: ["19:40"]
            ],
            6: [ 7: ["00:19"]
            ],
            7: [ 8: ["10:45"]
            ],
            8: [ 8: ["20:21"]
            ],
            9: [ 8: ["22:45"]
            ],
            10: [9: ["13:43"]
            ],
            11: [8: ["16:14"]
            ],
            12: [8: ["08:37"]
            ]
        ],
        1901 : [
            1: [ 6: ["08:05"]
            ],
            2: [ 4: ["19:55"]
            ],
            3: [ 6: ["14:25"]
            ],
            4: [ 5: ["19:54"]
            ],
            5: [ 6: ["13:54"]
            ],
            6: [ 6: ["18:34"]
            ],
            7: [ 8: ["05:01"]
            ],
            8: [ 8: ["14:37"]
            ],
            9: [ 8: ["17:01"]
            ],
            10: [9: ["07:59"]
            ],
            11: [8: ["10:30"]
            ],
            12: [8: ["02:02"]
            ]
        ],
        1900 : [
            1: [ 6: ["02:13"]
            ],
            2: [ 4: ["14:02"]
            ],
            3: [ 6: ["08:32"]
            ],
            4: [ 5: ["14:01"]
            ],
            5: [ 6: ["08:01"]
            ],
            6: [ 6: ["12:42"]
            ],
            7: [ 7: ["23:09"]
            ],
            8: [ 8: ["08:45"]
            ],
            9: [ 8: ["11:09"]
            ],
            10: [9: ["02:07"]
            ],
            11: [8: ["04:38"]
            ],
            12: [7: ["21:01"]
            ]
        ]
        
    ]


}
