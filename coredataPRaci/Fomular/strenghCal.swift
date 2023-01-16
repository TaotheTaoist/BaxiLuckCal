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
    func wood() -> Double{
        let woodCount = elementCounts[.wood(0)] ?? 0
        print(woodCount)
        var woodNum = 0.0
        switch woodCount {
        case 0,1,2:
            woodNum = 0.5
            print("Wood number is: \(woodNum)")
        case 3,4,5,6,7:
            woodNum = 1
            print("Wood number is: \(woodNum)")
        case 8,9,10:
            woodNum = 1.5
            print("Wood number is: \(woodNum)")
        case 11,12,13:
            woodNum = 2
            print("Wood number is: \(woodNum)")
        case 14,15,16:
            woodNum = 2.5
            print("Wood number is: \(woodNum)")
        case 17,18,19:
            woodNum = 3
            print("Wood number is: \(woodNum)")
        case 20,21,22:
            woodNum = 3.5
            print("Wood number is: \(woodNum)")
        case 23,24,25:
            woodNum = 4
            print("Wood number is: \(woodNum)")
        case 26,27,28:
            woodNum = 4.5
            print("Wood number is: \(woodNum)")
        case 29,30,31:
            woodNum = 5
            print("Wood number is: \(woodNum)")
        case 32,33,34:
            woodNum = 5.5
            print("Wood number is: \(woodNum)")
        case 35,36,37:
            woodNum = 6
            print("Wood number is: \(woodNum)")
        case 38,39,40:
            woodNum = 6.5
            print("Wood number is: \(woodNum)")
        case 41,42,43:
            woodNum = 7
            print("Wood number is: \(woodNum)")
        case 44,45,46:
            woodNum = 7.5
            print("Wood number is: \(woodNum)")
        case 47,48,49:
            woodNum = 8
            print("Wood number is: \(woodNum)")
        case 50,51,52:
            woodNum = 8.5
            print("Wood number is: \(woodNum)")
        case 53,54,55:
            woodNum = 9
            print("Wood number is: \(woodNum)")
        case 56,57,58:
            woodNum = 9.5
            print("Wood number is: \(woodNum)")
        case 59,60:
            woodNum = 10
            print("Wood number is: \(woodNum)")
        default:
            break
        }
        return woodNum

    }
    func water() -> Double{
        let waterCount = elementCounts[.water(0)] ?? 0
        print(waterCount)
        var waterNum = 0.0
        switch waterCount {
        case 0,1,2:
            waterNum = 0.5
            print("Water number is: \(waterNum)")
        case 3,4,5,6,7:
            waterNum = 1
            print("Water number is: \(waterNum)")
        case 8,9,10:
            waterNum = 1.5
            print("Water number is: \(waterNum)")
        case 11,12,13:
            waterNum = 2
            print("Water number is: \(waterNum)")
        case 14,15,16:
            waterNum = 2.5
            print("Water number is: \(waterNum)")
        case 17,18,19:
            waterNum = 3
            print("Water number is: \(waterNum)")
        case 20,21,22:
            waterNum = 3.5
            print("Water number is: \(waterNum)")
        case 23,24,25:
            waterNum = 4
            print("Water number is: \(waterNum)")
        case 26,27,28:
            waterNum = 4.5
            print("Water number is: \(waterNum)")
        case 29,30,31:
            waterNum = 5
            print("Water number is: \(waterNum)")
        case 32,33,34:
            waterNum = 5.5
            print("Water number is: \(waterNum)")
        case 35,36,37:
            waterNum = 6
            print("Water number is: \(waterNum)")
        case 38,39,40:
            waterNum = 6.5
            print("Water number is: \(waterNum)")
        case 41,42,43:
            waterNum = 7
            print("Water number is: \(waterNum)")
        case 44,45,46:
            waterNum = 7.5
            print("Water number is: \(waterNum)")
        case 47,48,49:
            waterNum = 8
            print("Water number is: \(waterNum)")
        case 50,51,52:
            waterNum = 8.5
            print("Water number is: \(waterNum)")
        case 53,54,55:
            waterNum = 9
            print("Water number is: \(waterNum)")
        case 56,57,58:
            waterNum = 9.5
            print("Water number is: \(waterNum)")
        case 59,60:
            waterNum = 10
            print("Water number is: \(waterNum)")
        default:
            break
        }
        return waterNum
    }
    func fire() -> Double{
        let fireCount = elementCounts[.fire(0)] ?? 0
        print(fireCount)
        var fireNum = 0.0
        switch fireCount {
        case 0,1,2:
            fireNum = 0.5
            print("fire number is: \(fireNum)")
        case 3,4,5,6,7:
            fireNum = 1
            print("fire number is: \(fireNum)")
        case 8,9,10:
            fireNum = 1.5
            print("fire number is: \(fireNum)")
        case 11,12,13:
            fireNum = 2
            print("fire number is: \(fireNum)")
        case 14,15,16:
            fireNum = 2.5
            print("fire number is: \(fireNum)")
        case 17,18,19:
            fireNum = 3
            print("fire number is: \(fireNum)")
        case 20,21,22:
            fireNum = 3.5
            print("fire number is: \(fireNum)")
        case 23,24,25:
            fireNum = 4
            print("fire number is: \(fireNum)")
        case 26,27,28:
            fireNum = 4.5
            print("fire number is: \(fireNum)")
        case 29,30,31:
            fireNum = 5
            print("fire number is: \(fireNum)")
        case 32,33,34:
            fireNum = 5.5
            print("fire number is: \(fireNum)")
        case 35,36,37:
            fireNum = 6
            print("fire number is: \(fireNum)")
        case 38,39,40:
            fireNum = 6.5
            print("fire number is: \(fireNum)")
        case 41,42,43:
            fireNum = 7
            print("fire number is: \(fireNum)")
        case 44,45,46:
            fireNum = 7.5
            print("fire number is: \(fireNum)")
        case 47,48,49:
            fireNum = 8
            print("fire number is: \(fireNum)")
        case 50,51,52:
            fireNum = 8.5
            print("fire number is: \(fireNum)")
        case 53,54,55:
            fireNum = 9
            print("fire number is: \(fireNum)")
        case 56,57,58:
            fireNum = 9.5
            print("fire number is: \(fireNum)")
        case 59,60:
            fireNum = 10
            print("fire number is: \(fireNum)")
        default:
            break
        }
        return fireNum

    }
    func metal() -> Double{
        let metalCount = elementCounts[.metal(0)] ?? 0
        print(metalCount)
        var metalNum = 0.0
        switch metalCount {
        case 0,1,2:
            metalNum = 0.5
            print("metal number is: \(metalNum)")
        case 3,4,5,6,7:
            metalNum = 1
            print("metal number is: \(metalNum)")
        case 8,9,10:
            metalNum = 1.5
            print("metal number is: \(metalNum)")
        case 11,12,13:
            metalNum = 2
            print("metal number is: \(metalNum)")
        case 14,15,16:
            metalNum = 2.5
            print("metal number is: \(metalNum)")
        case 17,18,19:
            metalNum = 3
            print("metal number is: \(metalNum)")
        case 20,21,22:
            metalNum = 3.5
            print("metal number is: \(metalNum)")
        case 23,24,25:
            metalNum = 4
            print("metal number is: \(metalNum)")
        case 26,27,28:
            metalNum = 4.5
            print("metal number is: \(metalNum)")
        case 29,30,31:
            metalNum = 5
            print("metal number is: \(metalNum)")
        case 32,33,34:
            metalNum = 5.5
            print("metal number is: \(metalNum)")
        case 35,36,37:
            metalNum = 6
            print("metal number is: \(metalNum)")
        case 38,39,40:
            metalNum = 6.5
            print("metal number is: \(metalNum)")
        case 41,42,43:
            metalNum = 7
            print("metal number is: \(metalNum)")
        case 44,45,46:
            metalNum = 7.5
            print("metal number is: \(metalNum)")
        case 47,48,49:
            metalNum = 8
            print("metal number is: \(metalNum)")
        case 50,51,52:
            metalNum = 8.5
            print("metal number is: \(metalNum)")
        case 53,54,55:
            metalNum = 9
            print("metal number is: \(metalNum)")
        case 56,57,58:
            metalNum = 9.5
            print("metal number is: \(metalNum)")
        case 59,60:
            metalNum = 10
            print("metal number is: \(metalNum)")
        default:
            break
        }
        return metalNum

    }
    func earth() -> Double{
        let earthCount = elementCounts[.earth(0)] ?? 0
        print(earthCount)
        var earthNum = 0.0
        switch earthCount {
        case 0,1,2:
            earthNum = 0.5
            print("earth number is: \(earthNum)")
            
        case 3,4,5,6,7:
            earthNum = 1
            print("earth number is: \(earthNum)")
        case 8,9,10:
            earthNum = 1.5
            print("earth number is: \(earthNum)")
        case 11,12,13:
            earthNum = 2
            print("earth number is: \(earthNum)")
        case 14,15,16:
            earthNum = 2.5
            print("earth number is: \(earthNum)")
        case 17,18,19:
            earthNum = 3
            print("earth number is: \(earthNum)")
        case 20,21,22:
            earthNum = 3.5
            print("earth number is: \(earthNum)")
        case 23,24,25:
            earthNum = 4
            print("earth number is: \(earthNum)")
        case 26,27,28:
            earthNum = 4.5
            print("earth number is: \(earthNum)")
        case 29,30,31:
            earthNum = 5
            print("earth number is: \(earthNum)")
        case 32,33,34:
            earthNum = 5.5
            print("earth number is: \(earthNum)")
        case 35,36,37:
            earthNum = 6
            print("earth number is: \(earthNum)")
        case 38,39,40:
            earthNum = 6.5
            print("earth number is: \(earthNum)")
        case 41,42,43:
            earthNum = 7
            print("earth number is: \(earthNum)")
        case 44,45,46:
            earthNum = 7.5
            print("earth number is: \(earthNum)")
        case 47,48,49:
            earthNum = 8
            print("earth number is: \(earthNum)")
        case 50,51,52:
            earthNum = 8.5
            print("earth number is: \(earthNum)")
        case 53,54,55:
            earthNum = 9
            print("earth number is: \(earthNum)")
        case 56,57,58:
            earthNum = 9.5
            print("earth number is: \(earthNum)")
        case 59,60:
            earthNum = 10
            print("earth number is: \(earthNum)")
        default:
            break
        }
        return earthNum

    }
    
}



