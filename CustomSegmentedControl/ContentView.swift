//
//  ContentView.swift
//  CustomSegmentedControl
//
//  Created by Fatih Sağlam on 14.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State var currentSelection = "Secenek 1"
    var body: some View {
        VStack {
            SegmentedControl(selection1: "Secenek 1", selection2: "Secenek 2", currentTab: $currentSelection)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SegmentedControl: View {
    var selection1 : String
    var selection2 : String
    @Binding var currentTab : String
    @Namespace var namespace
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            HStack {
                Text(selection1)
                    .bold()
                    .padding(.vertical, 12)
                    .padding(.horizontal, 25)
                    .background(
                        ZStack {
                            if currentTab == selection1 {
                                Color.white
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                    .matchedGeometryEffect(id: "TAB", in: namespace)
                            }
                        }
                    )
                    .foregroundColor(currentTab == selection1 ? .black : .white)
                    .onTapGesture {
                        withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.7, blendDuration: 0)) {
                            currentTab = selection1
                        }
                    }
                
                Text(selection2)
                    .bold()
                    .padding(.vertical, 12)
                    .padding(.horizontal, 25)
                    .background(
                        ZStack {
                            if currentTab == selection2 {
                                Color.white
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                    .matchedGeometryEffect(id: "TAB", in: namespace)
                            }
                        }
                    )
                    .foregroundColor(currentTab == selection2 ? .black : .white)
                    .onTapGesture {
                        withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.7, blendDuration: 0)) {
                            currentTab = selection2
                        }
                    }
            }
            .padding(.horizontal, 7)
            .padding(.vertical, 10)
            .background(Color.black.opacity(0.35))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        }
    }
}
