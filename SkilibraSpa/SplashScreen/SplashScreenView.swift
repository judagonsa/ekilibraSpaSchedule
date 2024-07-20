//
//  SplashScreenView.swift
//  SkilibraSpa
//
//  Created by Julian González on 20/07/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var showSplash = true
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            if showSplash {
                Image(.logoWelcome)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .scaleEffect(isAnimating ? 1.3 : 1.0)
                    .opacity(showSplash ? 1 : 0)
                    .onAppear() {
                        withAnimation(
                            .easeInOut(duration: 1.5)
                            .repeatForever(autoreverses: true)) {
                                isAnimating = true
                            }
                    }
            }else {
                WelcomeView()
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                withAnimation {
                    self.showSplash = false
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
