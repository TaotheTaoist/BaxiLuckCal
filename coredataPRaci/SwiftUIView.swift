//
//  SwiftUIView.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 1/13/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack {
            
//            ExtractedView()
        }

        .background(Image("fbgimage"))
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

//struct ExtractedView: View {
//    var body: some View {
//        VStack(alignment: .leading){
//            Text("name")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .frame(width: 200.0, height: 100.0)
//                .foregroundStyle(.linearGradient(colors: [.white.opacity(0.7),.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
//
//            Text("birthday")
//                .multilineTextAlignment(.leading).lineLimit(1)
//                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
//
//        }
//        .padding(.all)
//        .background(.ultraThinMaterial.opacity(0.8))
//        .overlay(RoundedRectangle(cornerRadius: 30, style:.continuous).stroke(.linearGradient(colors: [.white.opacity(0.5), .black.opacity(0.2)], startPoint: .top, endPoint: .bottom)).blendMode(.overlay))
//        //styling to fit background
//
//        .cornerRadius(30.0)
//        .shadow(radius: 20)
//
//    }
//}

