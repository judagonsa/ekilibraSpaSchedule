//
//  HomeView.swift
//  SkilibraSpa
//
//  Created by Julian González on 11/07/24.
//

import SwiftUI

struct HomeView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack {
            BannersView()
            BannerCircleView()
            
            Spacer()
            Button("Show Menu") {
                showMenu.toggle()
            }
        }
    }
}

#Preview {
    HomeView(showMenu: .constant(false))
}
