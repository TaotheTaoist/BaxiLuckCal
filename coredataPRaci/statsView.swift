//
//  statsView.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 1/16/23.
//
//import CoreGraphics
//import SwiftUI
//struct BadgeBackground: View {
//    var body: some View {
//        
//            
//            
//            
//            Path { path in
//                let width: CGFloat = 200
//                let height: CGFloat = 200
//                
//                path.move(
//                    to: CGPoint(
//                        x: 0.98 * width,
//                        y: 0.48 * height
//                        
//                    )
//                 
//                )
//
//                
////                path.move(
////                    to: CGPoint(
////                        x: 0.8 * width,
////                        y: 0.5 * height
////
////                    )
////
////                )
//                path.addLine(
//                    to: CGPoint(
//                        x: 1.46 * width,
//                        y: 0.83 * height)
//                )
//
////                path.addLine(
////                    to: CGPoint(
////                        x: 1.2 * width,
////                        y: 0.8 * height)
////                )
//                path.addLine(
//                    to: CGPoint(
//                        x: 1.28 * width,
//                        y: 1.39 * height)
//                )
////                path.addLine(
////                    to: CGPoint(
////                        x: 1.05 * width,
////                        y: 1.3 * height)
////                )
//                path.addLine(
//                    to: CGPoint(
//                        x: 0.7 * width,
//                        y: 1.39 * height)
//                )
//                
////                path.addLine(
////                    to: CGPoint(
////                        x: 0.55 * width,
////                        y: 1.3 * height)
////                )
//                path.addLine(
//                    to: CGPoint(
//                        x: 0.5 * width,
//                        y: 0.83 * height)
//                )
////                path.addLine(
////                    to: CGPoint(
////                        x: 0.4 * width,
////                        y: 0.8 * height)
////                )
//                
//             
//
//                path.closeSubpath()
//            }
//            .stroke(Color.white, lineWidth: 1)
////            .border(Color.white, width: 3)
//            .scaledToFit()
//            
//            
//        }
//        
//    
//    
//}
//
//struct BadgeBackground_Previews: PreviewProvider {
//    static var previews: some View {
//        BadgeBackground()
//
//    }
//}



////struct ContentView : View {
////    var body : some View {
////
////
////
////
////                 Polygon() // Pentagon (default is 5 sides)
////
////
////                 .stroke(Color.green, lineWidth: 1)
////                 .frame(width : 100)
////                 .rotationEffect(.degrees(53.5))
////                 .scaleEffect(2.0)
////
////
////
////
////            }
////        }
////
////}
//
//struct Polygon : Shape {
//    var sides : Int = 5
//
//    func path(in rect : CGRect ) -> Path{
//         // get the center point and the radius
//         let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
//         let radius = rect.width / 2
//
//         // get the angle in radian,
//         // 2 pi divided by the number of sides
//         let angle = Double.pi * 2 / Double(sides)
//         var path = Path()
//        var startPoint = CGPoint(x: 0, y: 0)
//
//         for side in 0 ..< sides {
//
//             let x = center.x + CGFloat(cos(Double(side) * angle)) * CGFloat (radius)
//             let y = center.y + CGFloat(sin(Double(side) * angle)) * CGFloat(radius)
//
//             let vertexPoint = CGPoint( x: x, y: y)
//
//             if (side == 0) {
//                 startPoint = vertexPoint
//                 path.move(to: startPoint )
//             }
//             else {
//                 path.addLine(to: vertexPoint)
//             }
//
//             // move back to starting point
//             // needed for stroke
//             if ( side == (sides - 1) ){
//                 path.addLine(to: startPoint)
//             }
//         }
//
//
//         return path
//   }
// }
////struct contentPreview: PreviewProvider {
////    static var previews: some View {
////        ContentView()
////    }
////}
