//
//  strenghCal.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 2/12/23.
//

import Foundation
import SwiftUI


struct strenghCal {
    @State var woodCount = 0
    enum MonthElement: Hashable {
        case wood(Int)
        case fire(Int)
        case earth(Int)
        case metal(Int)
        case water(Int)
    }
    
    var elementCounts: [MonthElement: Int] = [:]

    mutating func chitop(zhi: String) {
        switch zhi {
        case "甲", "乙":
            elementCounts[.wood(0), default: 0] += 5
        case "丙", "丁":
            elementCounts[.fire(0), default: 0] += 5
        case "戊", "己":
            elementCounts[.earth(0), default: 0] += 5
        case "庚", "辛":
            elementCounts[.metal(0), default: 0] += 5
        case "壬", "癸":
            elementCounts[.water(0), default: 0] += 5
        default:
            break
        }
    }
    mutating func chibotMonth(zhi: String) {
        switch zhi {
        case "子":
            elementCounts[.water(0), default: 0] += 16
        case "丑":
            elementCounts[.earth(0), default: 0] += 10
            elementCounts[.metal(0), default: 0] += 2
            elementCounts[.water(0), default: 0] += 4
        case "寅":
            elementCounts[.wood(0), default: 0] += 10
            elementCounts[.fire(0), default: 0] += 4
            elementCounts[.earth(0), default: 0] += 2
        case "卯":
            elementCounts[.wood(0), default: 0] += 16
        case "辰":
            elementCounts[.water(0), default: 0] += 2
            elementCounts[.wood(0), default: 0] += 4
            elementCounts[.earth(0), default: 0] += 10
        case "戌":
            elementCounts[.fire(0), default: 0] += 2
            elementCounts[.metal(0), default: 0] += 4
            elementCounts[.earth(0), default: 0] += 10
        case "午":
            elementCounts[.fire(0), default: 0] += 10
            elementCounts[.earth(0), default: 0] += 6
        case "未":
            elementCounts[.wood(0), default: 0] += 2
            elementCounts[.fire(0), default: 0] += 4
            elementCounts[.earth(0), default: 0] += 10
        case "申":
            elementCounts[.water(0), default: 0] += 4
            elementCounts[.earth(0), default: 0] += 2
            elementCounts[.metal(0), default: 0] += 10
        case "酉":
            elementCounts[.metal(0), default: 0] += 16
        case "亥":
            elementCounts[.wood(0), default: 0] += 6
            elementCounts[.water(0), default: 0] += 10
        default:
            break
        }
    }

    mutating func chibot(zhi: String) {
        switch zhi {
        case "子":
            elementCounts[.water(0), default: 0] += 8
        case "丑":
            elementCounts[.earth(0), default: 0] += 5
            elementCounts[.metal(0), default: 0] += 1
            elementCounts[.water(0), default: 0] += 2
        case "寅":
            elementCounts[.wood(0), default: 0] += 5
            elementCounts[.fire(0), default: 0] += 2
            elementCounts[.earth(0), default: 0] += 1
        case "卯":
            elementCounts[.wood(0), default: 0] += 8
        case "辰":
            elementCounts[.water(0), default: 0] += 1
            elementCounts[.wood(0), default: 0] += 2
            elementCounts[.earth(0), default: 0] += 5
        case "戌":
            elementCounts[.fire(0), default: 0] += 1
            elementCounts[.metal(0), default: 0] += 2
            elementCounts[.earth(0), default: 0] += 5
        case "午":
            elementCounts[.fire(0), default: 0] += 5
            elementCounts[.earth(0), default: 0] += 3
        case "未":
            elementCounts[.wood(0), default: 0] += 1
            elementCounts[.fire(0), default: 0] += 2
            elementCounts[.earth(0), default: 0] += 5
        case "申":
            elementCounts[.water(0), default: 0] += 2
            elementCounts[.earth(0), default: 0] += 1
            elementCounts[.metal(0), default: 0] += 5
        case "酉":
            elementCounts[.metal(0), default: 0] += 8
        case "亥":
            elementCounts[.wood(0), default: 0] += 3
            elementCounts[.water(0), default: 0] += 5
        default:
            break    }
        
    }
    func setup() {
        let woodCount = elementCounts[.wood(0)] ?? 0
        print(woodCount)
    }
//    var yearTop: String
//    init(yearTop: String) {
//           self.yearTop = yearTop
//       }
//    
}



