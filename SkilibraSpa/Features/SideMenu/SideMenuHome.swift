//
//  SideMenuView.swift
//  SkilibraSpa
//
//  Created by Julian González on 16/07/24.
//

import SwiftUI

struct SideMenuHome: View {
    @State var showSideMenu = false
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            let totalWidth = geo.size.width
            let sideBarWidth = max(totalWidth - 90, 0) // mismo margen, pero relativo a la ventana actual
            
            NavigationStack {
                HStack(spacing: 0) {
                    
                    // El ancho del menú lo fija el padre (sideBarWidth)
                    SideMenuView(showMenu: $showSideMenu)
                        .frame(width: sideBarWidth)
                    
                    HomeView(showMenu: $showSideMenu)
                        .frame(width: totalWidth)
                    
                }
                .frame(width: totalWidth + sideBarWidth)
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
            .onChange(of: geo.size) { _, newSize in
                // Ajusta el offset si cambia el tamaño de ventana/orientación
                let newSideBarWidth = max(newSize.width - 90, 0)
                if showSideMenu {
                    offset = newSideBarWidth
                    lastStoredOffset = newSideBarWidth
                } else {
                    offset = 0
                    lastStoredOffset = 0
                }
            }
        }
    }
}

#Preview {
    SideMenuHome()
}
