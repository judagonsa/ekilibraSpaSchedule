//
//  BannerCircleView.swift
//  SkilibraSpa
//
//  Created by Julian González on 16/07/24.
//

import SwiftUI

struct BannerCircleView: View {
    
    var colors: [UIColor] = [ .red, .blue, .yellow, .black, .orange]
    var place: [String] = [ "Día de la madre", "Tunja", "Duitama", "día del padre", "Sogamoso"]
    
    var body: some View {
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<colors.count, id: \.self) { index in
                        VStack (spacing: -8) {
                            Circle()
                                .fill(
                                    Color(colors[index])
                                )
                                .frame(width: 80, height: 80)
                                .overlay {
                                    Circle()
                                        .stroke(
                                            LinearGradient(
                                                colors: [.red, .purple, .red, .orange, .yellow, .orange],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: 3
                                        )
                                        .frame(width: 88, height: 88)
                                }
                                .frame(width: 90, height: 90)
                            
                            Text(place[index])
                                .font(.system(size: 15, weight: .light, design: .rounded))
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .frame(width: 90, height: 60)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        //.frame(height: 140)
    }
}

#Preview {
    BannerCircleView()
}
