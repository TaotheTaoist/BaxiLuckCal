//
//  statsView.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 1/16/23.
//
import CoreGraphics
import SwiftUI
struct BadgeBackground: View {
    var forEarth = ["1": ["w": 0.98, "h": 0.72],"1.5":["w": 0.98, "h": 0.7],"2":["w": 0.98, "h": 0.68]]

    
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
//                            x: (myDict["1"]?["t"] ?? 0) * width,
                            x: 0.98 * width,
                            y: 0.68 * height
                        )
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
                            x: 1.3 * width,
                            y: 0.88 * height)
                        
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
                            x: 1.41 * width,
                            y: 1.58 * height)
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
                            x: 0.85 * width,
                            y: 1.19 * height)
                        /// 0.85 = 1 width
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
                            x: 0.3 * width,
                            y: 0.75 * height)
                        ///0.265 = 10 width
                        ///0.74 = 10 height
                        ///0.3 = 9.5 width
                        ///0.75 = 9.5 height
                        /// 0.33 = 9 width
                        /// 0.76 = 9 height
                        /// 0.36 = 8.5 width
                        ///0.765 = 8.5 height
                        /// 0.39 = 8 width
                        /// 0.77 = 8 height
                        ///0.405 = 7.5 width
                        ///0.77 =  7.5 height
                        /// 0.42 = 7 width
                        /// 0.78 = 7 height
                        ///0.46 = 6.5 width
                        ///0.805 = 6.5 height
                        /// 0.45 =  6 width
                        /// 0.8 = 6 height
                        ///0.47 = 5.5 width
                        ///0.81 = 5.5 height
                        /// 0.5 = 5 width
                        /// 0.82 = 5 height
                        ///0.55 = 4.5 width
                        ///0.83 = 4.5 height
                        ///0.57 = 4 width
                        ///0.84 = 4 height
                        ///0.59 = 3.5 width
                        ///0.845 = 3.5
                        ///0.62 = 3 width
                        ///0.87 = 3 height
                        ///0.66 = 2.5 width
                        ///0.86 = 2.5 height
                        ///0.68 = 2 width
                        ///0.88 = 2 height
                        ///0.7 = 1.5 width
                        ///0.88 = 1.5 height
                        ///0.73 = 1 width
                        ///0.91 =  1 height
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
