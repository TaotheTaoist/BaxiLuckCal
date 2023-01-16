//
//  statsView.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 1/16/23.
//
import CoreGraphics
import SwiftUI
struct BadgeBackground: View {
    var body: some View {
      
        ZStack {
            Polygon()
            .stroke(Color.red, lineWidth: 2).brightness(0.5)
            .rotationEffect(Angle(degrees: 54.5))
            .aspectRatio(contentMode: .fit)
            .frame(width: 300,height: 300)
            
            Polygon()
            .stroke(Color.red, lineWidth: 2).brightness(0.5)
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
                            x: 0.98 * width,
                            y: 0.40 * height
                        )
                        ///height 72 = 0
                        ///    23= 100
                        ///    48 = 50
                    )

                    path.addLine(
                        to: CGPoint(
                            x: 1.645 * width,
                            y: 0.77 * height)
                        /// 1.645 = 9
                        /// 0.77 = 9
                        /// width  1.69 = 100
                        /// height 0.75 = 100
                        ///  ///      1.45 = 50
                        ///      0.83 = 50
                        ///width      1.22 = 0
                        /// height   0.90 = 0
                        
                    )

                    path.addLine(
                        to: CGPoint(
                            x: 1.28 * width,
                            y: 1.39 * height)
                    )
   
                    path.addLine(
                        to: CGPoint(
                            x: 0.68 * width,
                            y: 1.38 * height)
                    )
  
                    path.addLine(
                        to: CGPoint(
                            x: 0.5 * width,
                            y: 0.82 * height)
                    )
                   
                path.closeSubpath()
            }
//            .fill(.black)// either this or stroke ccan be used
            
            .stroke(Color.red, lineWidth: 2).brightness(0.5)
            
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
        }}
       
    
    
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
        
    }
}



//struct ContentView : View {
//    var body : some View {
//
//
//
//
//                 Polygon() // Pentagon (default is 5 sides)
//
//
//                 .stroke(Color.green, lineWidth: 1)
//                 .frame(width : 100)
//                 .rotationEffect(.degrees(53.5))
//                 .scaleEffect(2.0)
//
//
//
//
//            }
//        }
//
//}

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
//struct contentPreview: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
