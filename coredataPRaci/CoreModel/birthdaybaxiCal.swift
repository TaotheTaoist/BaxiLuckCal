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
    
    
    
    func extractDateComponents(date: Date, entity: FruitEntity) -> (Int, Int, Int, String) {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let day = calendar.component(.day, from: date)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let time = formatter.string(from: entity.birthday ?? Date())
        return (year, month, day, time)
    }
    
    
    
    func extractDateComponentsYear(dateComponents: (Int, Int, Int,  String)) -> Int {
        return dateComponents.0
    }///example : 2022
    func extractDateComponentsMonth(dateComponents: (Int, Int,Int,String)) -> Int {
        return dateComponents.1
    }///example : jan
    func extractDateComponentsDay(dateComponents: (Int, Int, Int, String)) -> Int {
        return dateComponents.2
    }/// example: 10
    
    func extractDateComponentsTime(dateComponents: (Int, Int, Int, String)) -> String {
        return dateComponents.3
    }///example:"11:32"
    
    ////https://baike.baidu.com/item/天干地支/278140
    ////:the website to calculate Baxi, year, day and time
    ///////https://www.163.com/dy/article/G5FA0FGK0532D4MK.html
    ////:website to calculate the month
    let yearStems = [
        
            1900: 9, 1901: 14, 1902:19, 1903:24,
            1904: 30, 1905: 35, 1906:40, 1907:45,
            1908: 51, 1909: 56, 1910:1, 1911:6,
            1912: 12, 1913: 17, 1914:22, 1915:27,
            1916: 33, 1917: 38, 1918: 43, 1919: 48,
            1920: 54, 1921: 59, 1922: 4, 1923:9,
            1924: 15, 1925: 20, 1926: 25, 1927: 30,
            1928: 36, 1929: 41, 1930: 46, 1931: 51,
            1932: 57, 1933: 2, 1934: 7, 1935: 12,
            1936: 18, 1937: 23, 1938: 28, 1939:33,
            1940: 39, 1941:44, 1942: 49, 1943: 54,
            1944: 0, 1945:5, 1946: 10, 1947: 15,
            1948: 21, 1949: 26,
            1950: 31, 1951: 36, 1952: 42, 1953: 47,
            1954: 52, 1955: 57, 1956: 3, 1957: 8,
            1958: 13, 1959: 18, 1960: 24, 1961: 29,
            1962: 34, 1963: 39, 1964: 45, 1965: 50,
            1966: 55, 1967: 0, 1968: 6, 1969: 11,
            1970: 16, 1971: 21, 1972: 27, 1973: 32,
            1974: 37, 1975: 42, 1976: 48, 1977: 53,
            1978: 58, 1979: 3, 1980: 9, 1981: 14,
            1982: 19, 1983: 24, 1984: 30, 1985: 35,
            1986: 40, 1987: 45, 1988: 51, 1989: 56,
            1990: 1, 1991: 6, 1992: 12, 1993: 17,
            1994: 22, 1995: 27, 1996: 33, 1997: 38,
            1998: 43, 1999: 48, 2000: 54, 2001: 59,
            2002: 4, 2003: 9, 2004: 15, 2005: 20,
            2006: 25, 2007: 30, 2008: 36, 2009: 41,
            2010: 46, 2011: 51, 2012: 57, 2013: 2,
            2014: 7, 2015: 12, 2016: 18, 2017: 23,
            2018: 28, 2019: 33, 2020: 39, 2021: 44,
            2022: 49, 2023: 54, 2024: 0, 2025: 5,
            2026: 10, 2027: 15, 2028: 21, 2029: 26,
            2030: 31, 2031: 36, 2032: 42, 2033: 47,
            2034: 52, 2035: 57, 2036: 3, 2037: 8,
            2038: 13, 2039: 18, 2040: 24, 2041: 29,
            2042: 34, 2043: 39, 2044: 45, 2045: 50,
            2046: 55, 2047: 0, 2048: 6, 2049: 11

    ]

    let monthdata = [1:6,2:37, 3:0,4:31,5:1,6:32,7:2, 8:33, 9:4,10:34, 11:5, 12:35]
    let data = [
        1: "甲子",2: "乙丑",3: "丙寅",4: "丁卯",5: "戊辰",6: "己巳",7: "庚午",8: "辛未",9: "壬申",
        10: "癸酉",11: "甲戌",12: "乙亥",13: "丙子",14: "丁丑",15: "戊寅",16: "己卯",17: "庚辰",
        18: "辛巳",19: "壬午",20: "癸未",21: "甲申",22: "乙酉",23: "丙戌",24: "丁亥",25: "戊子",
        26: "己丑",27: "庚寅",28: "辛卯",29: "壬辰",30: "癸巳",31: "甲午",32: "乙未",33: "丙申",
        34: "丁酉",35: "戊戌",36: "己亥",37: "庚子",38: "辛丑",39: "壬寅",40: "癸卯",41: "甲辰",
        42: "乙巳",43: "丙午",44: "丁未",45: "戊申",46: "己酉",47: "庚戌",48: "辛亥",49: "壬子",
        50: "癸丑",51: "甲寅",52: "乙卯",53: "丙辰",54: "丁巳",55: "戊午",56: "己未",57: "庚申",
        58: "辛酉",59: "壬戌",60: "癸亥"]

    let 天干 = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"]
    let 地支 = ["子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"]

    func getBaxiyearbot(year: Int, month:Int) -> (String) {
        var newYear = year
        if (month == 1){
              newYear -= 1
          }
        var calyearb: String
        if ((newYear - 3) % 12 != 0){
            var year = (newYear-3) % 12
            calyearb = 地支[year - 1]
        }else {
            calyearb = 地支.last ?? ""
        }
        return calyearb
    }


    func getBaxiyear(year: Int, month:Int) -> (String) {
        var newYear = year
        if (month == 1){
              newYear -= 1
          }
        var calyear: String
        if ((newYear - 3) % 10 != 0) {
            var newYear = (newYear-3) % 10
            calyear = 天干[newYear - 1]
        } else {
            calyear = 天干.last ?? ""
        }
        return calyear
    }
    func getBaximonthtop(getBaxiyear:(Int, Int) -> String ,year:Int, thatmonth:Int) -> String{
        var resultTop: String
        let remainmonth: Int
        let result = getBaxiyear(year, thatmonth)
        guard let index = 天干.firstIndex(of: result) else { return "" }
        let baxithatmonth = ((index+1)*2) + thatmonth
        if baxithatmonth >= 11{
            remainmonth = baxithatmonth % 10
            resultTop = 天干[remainmonth]
        } else {
            remainmonth = baxithatmonth
            resultTop = 天干[remainmonth]
        }
        return resultTop
    }
    func getBaxiMonthbot(month:Int) ->String{
        var di:String = ""
        if month == 12 {
            di = 地支.first ?? ""
        } else {
            di = 地支[month]
        }
        return di
    }
    func getBaxiTimebot(time: String) -> String {
      let hourMinute = time.split(separator: ":", maxSplits: 1).map { String($0) }
      let hour = Int(hourMinute[0])!
      let minute = Int(hourMinute[1])!
      // Calculate the number of hours since midnight
      let hoursSinceMidnight = hour
      // Determine the correct 地支
      let baxiTime: String
      switch hoursSinceMidnight {
      case 23, 0:
          baxiTime = "子"
        case 1, 2:
          baxiTime = "丑"
        case 3, 4:
          baxiTime = "寅"
        case 5, 6:
          baxiTime = "卯"
        case 7, 8:
          baxiTime = "辰"
        case 9, 10:
          baxiTime = "巳"
        case 11, 12:
          baxiTime = "午"
        case 13, 14:
          baxiTime = "未"
        case 15, 16:
          baxiTime = "申"
        case 17, 18:
          baxiTime = "酉"
        case 19, 20:
          baxiTime = "戌"
        case 21, 22:
          baxiTime =  "亥"
        default:
          baxiTime = "Invalid time"
      }
      return baxiTime
    }

        func getBaxitime(year: Int, month: Int, day: Int, time: String) -> (String) {
                let baxiTime = getBaxiTimebot(time: time)
                let baxiDay = getbaxiDay(year: year, month: month, day: day)
                let fc = String(baxiDay[baxiDay.startIndex])
                let index = ((天干.firstIndex(of: fc)!+1) * 2) //
                let dinex = (地支.firstIndex(of: baxiTime)!)
                let result = ((dinex + index) - 2) % 10
                return 天干[result]
            }
        func getbaxiDay(year: Int, month: Int, day: Int) -> String {
            let yearToUse = month == 1 || month == 2 ? year - 1 : year
            let yearStem = yearStems[yearToUse] ?? 0
            let monthStem = monthdata[month] ?? 0
            var stem = (yearStem + monthStem + day)
            if stem > 60 {
                stem = stem % 60
            }
            return data[stem] ?? ""
        }
}
