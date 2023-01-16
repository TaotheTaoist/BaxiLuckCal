//
//  statsView.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 1/16/23.
//
///0.265 = 10 width
///0.74 = 10 height
///0.3 = 9.5 width
///0.75 = 9.5 height
/// 0.33 = 9 width
/// 0.76 = 9 height
/// 0.36 = 8.5 width



import CoreGraphics
import SwiftUI
struct BadgeBackground: View {
    var accEarth = 0.5
    var accFire = 0.5
    var accWater = 0.5
    var accWood = 4.0
    var accMetal = 0.5
    var forWood = [0.5:["w": 0.87, "h": 0.92],1: ["w": 0.73, "h": 0.88],1.5:["w": 0.7, "h": 0.88],2:["w": 0.68, "h": 0.88],2.5:["w": 0.66, "h": 0.86],3:["w": 0.62, "h": 0.87],3.5:["w": 0.59, "h": 0.845],4:["w": 0.57, "h": 0.84],4.5:["w": 0.55, "h": 0.83],5:["w": 0.5, "h": 0.82],5.5:["w": 0.47, "h": 0.81],6:["w": 0.45, "h": 0.8],6.5:["w": 0.46, "h": 0.805],7:["w": 0.42, "h": 0.78],7.5:["w": 0.405, "h": 0.77],8:["w": 0.39, "h": 0.77],8.5:["w": 0.36, "h": 0.765],9:["w": 0.33, "h": 0.76],9.5:["w": 0.3, "h": 0.75],10:["w": 0.265, "h": 0.74]]
    var forWater = [0.5:["w": 0.89, "h": 1.05],1: ["w": 0.83, "h": 1.19],1.5:["w": 0.82, "h": 1.2],2:["w": 0.8, "h": 1.22],2.5:["w": 0.78, "h": 1.24],3:["w": 0.76, "h": 1.28],3.5:["w": 0.75, "h": 1.3],4:["w": 0.74, "h": 1.32],4.5:["w": 0.72, "h": 1.34],5:["w": 0.68, "h": 1.38],5.5:["w": 1.4, "h": 0.65],6:["w": 0.65, "h": 1.43],6.5:["w": 0.64, "h": 1.43],7:["w": 0.63, "h": 1.44],7.5:["w": 0.62, "h": 1.47],8:["w": 0.61, "h": 1.47],8.5:["w": 0.59, "h": 1.53],9:["w": 0.57, "h": 1.53],9.5:["w": 0.55, "h": 1.545],10:["w": 0.535, "h": 1.575]]
    var forMetal = [0.5:["w": 1.03, "h": 1.05],1: ["w": 1.12, "h": 1.18],1.5:["w": 1.15, "h": 1.2],2:["w": 1.17, "h": 1.22],2.5:["w": 1.185, "h": 1.25],3:["w": 1.2, "h": 1.28],3.5:["w": 1.215, "h": 1.3],4:["w": 1.23, "h": 1.32],4.5:["w": 1.24, "h": 1.35],5:["w": 1.27, "h": 1.38],5.5:["w": 1.285, "h": 1.4],6:["w": 1.31, "h": 1.42],6.5:["w": 1.325, "h": 1.435],7:["w": 1.33, "h": 1.45],7.5:["w": 1.34, "h": 1.46],8:["w": 1.35, "h": 1.48],8.5:["w": 1.37, "h": 1.51],9:["w": 1.39, "h": 1.54],9.5:["w": 1.4, "h": 1.57],10:["w": 1.41, "h": 1.58]]
    var forFire = [0.5:["w": 1.1, "h": 0.95],1: ["w": 1.25, "h": 0.89],1.5:["w": 1.27, "h": 0.88],2:["w": 1.3, "h": 0.88],2.5:["w": 1.34, "h": 0.86],3:["w": 1.36, "h": 0.855],3.5:["w": 1.38, "h": 0.855],4:["w": 1.38, "h": 0.855],4.5:["w": 1.41, "h": 0.84],5:["w": 1.45, "h": 0.83],5.5:["w": 1.47, "h": 0.82],6:["w": 1.51, "h": 0.81],6.5:["w": 1.525, "h": 0.8],7:["w": 1.54, "h": 0.795],7.5:["w": 1.565, "h": 0.79],8:["w": 1.585, "h": 0.78],8.5:["w": 1.605, "h": 0.755],9:["w": 1.645, "h": 0.76],9.5:["w": 1.66, "h": 0.76],10:["w": 1.69, "h": 0.77]]
    var forEarth = [0.5:["w": 0.98, "h": 0.88],1: ["w": 0.98, "h": 0.72],1.5:["w": 0.98, "h": 0.7],2:["w": 0.98, "h": 0.68],2.5:["w": 0.98, "h": 0.64],3:["w": 0.98, "h": 0.62],3.5:["w": 0.98, "h": 0.6],4:["w": 0.98, "h": 0.58],4.5:["w": 0.98, "h": 0.5],5:["w": 0.98, "h": 0.48],5.5:["w": 0.98, "h": 0.46],6:["w": 0.98, "h": 0.44],6.5:["w": 0.98, "h": 0.42],7:["w": 0.98, "h": 0.4],7.5:["w": 0.98, "h": 0.37],8:["w": 0.98, "h": 0.34],8.5:["w": 0.98, "h": 0.32],9:["w": 0.98, "h": 0.3],9.5:["w": 0.98, "h": 0.265],10:["w": 0.98, "h": 0.23]]
    
    init(accEarth: Double, accFire:Double,accWater:Double,accWood:Double,accMetal:Double) {
        self.accEarth = accEarth
        self.accFire = accFire
        self.accWater = accWater
        self.accWood = accWood
        self.accMetal = accMetal
        }
    var body: some View {
        
        ZStack {
            Polygon()
                .fill(.gray)// either this or stroke ccan be used
//            .stroke(Color.red, lineWidth: 2).brightness(0.5)
            .rotationEffect(Angle(degrees: 54.5))
            .aspectRatio(contentMode: .fit)
            .frame(width: 300,height: 300)
            
            
            Polygon()
                .fill(.white)// either this or stroke ccan be used
//            .stroke(Color.red, lineWidth: 2).brightness(0.5)
            .rotationEffect(Angle(degrees: 54.5))
            .aspectRatio(contentMode: .fit)
            .frame(width: 200,height: 200)
            Polygon()
            .stroke(Color.red, lineWidth: 2).brightness(0.5)
            .rotationEffect(Angle(degrees: 54.5))
            .aspectRatio(contentMode: .fit)
            .frame(width: 100,height: 100)
            Path { path in
                    let width: CGFloat = 200
                    let height: CGFloat = 200
                    path.move(
                        to: CGPoint(
                            x: (forEarth[1]?["w"] ?? 0) * width,
//                            x: 0.98 * width,
                            y: (forEarth[accEarth]?["h"] ?? 0) * height
                        )
                        /// height 0.88 = 0.5
                        ///height 72 = 1
                        ///7 = 1.5
                        ///     68 = 2
                        ///     64 = 2.5
                        ///     62 = 3
                        ///     6 = 3.5
                        ///     58 = 4
                        ///  50= 4.5
                        ///     48 = 5
                        ///     46 = 5.5
                        ///     44 = 6
                        ///     42=6.5
                        ///  4=7
                        ///  37=7.5
                        ///34 = 8
                        ///32 = 8.5
                        ///3 = 9
                        ///265=9.5
                        ///    23= 100
                        ///
                    )

                    path.addLine(
                        to: CGPoint(
//                            x: 1.38 * width,
//                            y: 0.85 * height
                            x: (forFire[accFire]?["w"] ?? 0) * width,
                            y: (forFire[accFire]?["h"] ?? 0) * height
                        )
                        
                        /// width  1.69 = 100
                        /// height 0.77 = 100
                        ///1.66 = 9.5
                        ///0.76 = 9.5
                        ///1.645 = 9
                        ///0.76 = 9
                        ///1.585 = 8
                        ///0.78 = 8
                        ///1.605 = 8.5
                        ///0.755 = 8.5
                        ///1.565 = 7.5
                        ///0.79 = 7.5
                        ///1.54 = 7
                        ///0.795 = 7
                        ///
                        ///      1.51 = 6
                        ///      0.81 = 6
                        ///      1.47 = 5.5
                        ///      0.82 = 5.5
                        ///      1.45 = 5
                        ///      0.83 = 5
                        ///      1.41 = 4.5
                        ///      0.84 = 4.5
                        ///      1.38 = 4
                        ///      0.855 = 4
                        ///     1.36 = 3.5
                        ///     0.55 = 3.5
                        ///      1.34 = 3
                        ///      0.86 = 3
                        ///      1.3 = 2.5
                        ///      1.88 2.5
                        ///      1.27 = 2
                        ///      0.88 = 2
                        ///      1.25 = 1.5
                        ///      0.89 = 1.5
                        ///width      1.22 = 1
                        /// height   0.90 = 1
                        
                    )

                    path.addLine(
                        to: CGPoint(
                            x: (forMetal[accMetal]?["w"] ?? 0) * width,
                            y: (forMetal[accMetal]?["h"] ?? 0) * height
//                            x: 1.03 * width,
//                            y: 1.05 * height
                        )
                        /// 1.41 width = 100
                        /// 1.58 height = 100
                        ///1.4 = 9.5 width
                        ///1.57 = 9.5 height
                        /// 1.39 = 9 width
                        /// 1.54 = 9 height
                        ///1.37 = 8.5 width
                        ///1.51 = 8.5 height
                        /// 1.35 = 8 width
                        /// 1.48 = 8 height
                        ///1.34 = 7.5 width
                        ///1.46 = 7.5 height
                        /// 1.33 = 7 width
                        /// 1.45 =  7 height
                        ///1.325 = 6.5 width
                        ///1.435 = 6.5 height
                        /// 1.31 = 6 width
                        /// 1.42 = 6 height
                        ///1.285 = 5.5 width
                        ///1.4 = 5.5 height
                        /// 1.27 = 5 width
                        /// 1.38 = 5 height
                        ///1.24 = 4.5 width
                        ///1.35 = 4.5 height
                        /// 1.23 = 4 width
                        /// 1.32 = 4 height
                        ///1.215 = 3.5 width
                        ///1.3 = 3.5 height
                        ///1.2 = 3 width
                        ///1.28 = 3 height
                        ///1.185 = 2.5
                        ///1.25 = 2.5
                        ///1.17 = 2 width
                        ///1.22 = 2 height
                        ///1.15 = 1.5
                        ///1.2 = 1.5
                        ///1.12 = 1 width
                        ///1.18 = 1 height
                    )
   
                    path.addLine(
                        to: CGPoint(
                            x: (forWater[accWater]?["w"] ?? 0) * width,
                            y: (forWater[accWater]?["h"] ?? 0) * height
//                            x: 0.63 * width,
//                            y: 1.44 * height
                        )
                        /// 0.83 = 1 width
                        /// 1.19 = 1 height
                        ///0.82 = 1.5 width
                        ///1.2 = 1.5 height
                        /// 0.8 = 2 width
                        /// 1.22 2 height
                        /// 0.78 = 2.5 width
                        /// 1.24 = 2.5 height
                        /// 0.76 = 3 width
                        /// 1.28 = 3 height
                        ///0.75 = 3.5 width
                        ///1.3 = 3.5 height
                        /// 0.74 = 4 width
                        /// 1.32 = 4 height
                        ///0.72 = 4.5 width
                        ///1.34 = 4.5 height
                        /// 0.68 = 5 width
                        /// 1.38 = 5 height
                        ///0.66 = 5.5 width
                        ///1.4 = 5.5 height
                        ///0.65 = 6 width
                        ///1.42 = 6 height
                        ///0.64 = 6.5 width
                        ///1.43 = 6.5 height
                        ///0.63 = 7 width
                        ///1.44 = 7 height
                        ///0.62 = 7.5 width
                        ///1.47 = 7.5 height
                        ///0.61 = 8 width
                        ///1.47 = 8 height
                        ///0.59 = 8.5 width
                        ///1.49 = 8.5 height
                        ///0.57 = 9 width
                        ///1.53 = 9 height
                        ///0.55 = 9.5 width
                        ///1.545 = 9.5 height
                        ///0.535 = 10
                        ///1.575 = 10
                        
                        
                    )
  
                    path.addLine(
                        to: CGPoint(
                            x: (forWood[accWood]?["w"] ?? 0) * width,
                            y: (forWood[accWood]?["h"] ?? 0) * height
//                            x: 0.87 * width,
//                            y: 0.92 * height
                        )
                        
                    )
                
                path.closeSubpath()
            }
            
//            .fill(.black)// either this or stroke ccan be used
            .fill(.linearGradient(Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
            .border(Color.green, width: 3)
//            .stroke(Color.red, lineWidth: 2).brightness(0.5)
            
            .scaledToFit()
            
            .overlay(
                
                ZStack{
                    Text("金")
                        .foregroundColor(.yellow)
                        .offset(x: 100, y: 130)
                    Text("水")
                        .foregroundColor(.blue)
                        .offset(x: -100, y: 130)
                    
                    Text("木")
                        .foregroundColor(.green)
                        .offset(x: -160, y: -50)
                    Text("火")
                        .foregroundColor(.red)
                        .offset(x: 160, y: -50)
                    Text("土")
                        .foregroundColor(.brown)
                        .offset(x: 0, y: -170)
                    
                    
                }
                
            )
            
        }
        
    }
       
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground(accEarth: 1.0,accFire: 1.0,accWater: 2.0,accWood: 3.0,accMetal: 3.0)
        
    }
}


struct Polygon : Shape {
    var sides : Int = 5

    func path(in rect : CGRect ) -> Path{
         // get the center point and the radius
         let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
         let radius = rect.width / 2

         // get the angle in radian,
         // 2 pi divided by the number of sides
         let angle = Double.pi * 2 / Double(sides)
         var path = Path()
        var startPoint = CGPoint(x: 0, y: 0)

         for side in 0 ..< sides {

             let x = center.x + CGFloat(cos(Double(side) * angle)) * CGFloat (radius)
             let y = center.y + CGFloat(sin(Double(side) * angle)) * CGFloat(radius)

             let vertexPoint = CGPoint( x: x, y: y)

             if (side == 0) {
                 startPoint = vertexPoint
                 path.move(to: startPoint )
             }
             else {
                 path.addLine(to: vertexPoint)
             }

             // move back to starting point
             // needed for stroke
             if ( side == (sides - 1) ){
                 path.addLine(to: startPoint)
             }
         }
  
         return path
   }
    
 }

