//
//  BannersView.swift
//  SkilibraSpa
//
//  Created by Julian González on 14/07/24.
//

import SwiftUI

struct BannersView: View {
    
    @State var currentIndex: Int?
    @GestureState var dragOffset: CGFloat = 0
    
    var colors: [UIColor] = [ .red, .blue, .yellow, .black, .gray, .green]
    
    var timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                    ForEach(0..<colors.count, id: \.self) { index in
                        
                        ZStack {
                            Rectangle()
                                .fill(
                                    Color(colors[index])
                                )
                                .frame(width: 300, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .scaleEffect(currentIndex ?? 0 == index ? 1.2 : 0.8)
                        }
                        .containerRelativeFrame(.horizontal)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal, 50)
            .scrollPosition(id: $currentIndex, anchor: .center)
            .onReceive(timer, perform: { _ in
                withAnimation{
                    currentIndex = currentIndex ?? 0 < colors.count - 1
                    ? (currentIndex ?? 0) + 1
                    : 0
                }
            })
            
        }
    }
}

#Preview {
    BannersView()
}


