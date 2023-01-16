//
//  line stats.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 1/17/23.
//




import SwiftUI



struct MyLineView: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 20, y: 20))
               
                path.addLine(to: CGPoint(x: 70, y: 40))
                
                path.addLine(to: CGPoint(x: 90, y: 140))
                
            }
            .foregroundStyle(.linearGradient(colors: [.white.opacity(1.0),.purple], startPoint: .top, endPoint: .bottomTrailing))
//            .stroke(Color.red, lineWidth: 2).brightness(0.5)
//            .border(Color.white, width: 3)
            .scaledToFit()
            
            
            Path { path in
                path.move(to: CGPoint(x: 30, y: 30))
                path.addLine(to: CGPoint(x: 50, y: 80))
                path.addLine(to: CGPoint(x: 170, y: 340))
            }
            .foregroundStyle(.linearGradient(colors: [.white.opacity(0.7),.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
//            .stroke(Color.red, lineWidth: 2).brightness(0.5)
            .border(Color.white, width: 3)
            .scaledToFit()
        }
    }
}


struct line_stats_Previews: PreviewProvider {
    static var previews: some View {
        MyLineView()
    }
}
