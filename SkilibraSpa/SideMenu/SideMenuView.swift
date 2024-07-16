//
//  SideMenuView.swift
//  SkilibraSpa
//
//  Created by Julian González on 16/07/24.
//

import SwiftUI

struct SideMenuView: View {
    @State var showSideMenu = false
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
        
        NavigationStack {
            HStack(spacing: 0) {
                
                SideMenu(showMenu: $showSideMenu)
                
                HomeView(showMenu: $showSideMenu)
                    .frame(width: getRect().width)
                
            }
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset)
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showSideMenu) { _, _ in
            if showSideMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            
            if !showSideMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
        
    }
}

#Preview {
    SideMenuView()
}
