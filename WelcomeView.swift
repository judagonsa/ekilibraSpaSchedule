//
//  WelcomeView.swift
//  SkilibraSpa
//
//  Created by Julian González on 25/06/24.
//

import SwiftUI

struct WelcomeView: View {
    
    //TODO: pasar a viewmodel
    @State var showRegister = false
    @State var showLogin = false
    @State var showHome = false
    
    var body: some View {
        VStack (spacing: 20) {
            
            //MARK: Agregar colores principales de ekilibra
            
            Image(.logoWelcome)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .shadow(radius: 10)
            
            Text("Bienvenido")
                .textWelcome()
            
            Text("Centro de relajación y estética")
                .textDescription()
            
            HStack(spacing: 20) {
                Button {
                    showRegister.toggle()
                }label: {
                    Text("Registrarme")
                        .overlayButton(borderColor: .green, lineWidth: 2)
                }
                
                Button {
                    showLogin.toggle()
                }label: {
                    Text("Iniciar sesión")
                        .clipShapeButton(backGroundColor: .green)
                }
            }
            .padding(.horizontal, 20)
        }
        .fullScreenCover(isPresented: $showLogin) {
            LoginView()
        }
        .fullScreenCover(isPresented: $showRegister) {
            RegisterView(isRegister: true)
        }
        .fullScreenCover(isPresented: $showHome) {
            HomeView()
        }
        .onAppear {
            if UserdefaultHelper.shared.getProfile() != nil {
                showHome.toggle()
            }
        }
        
    }
}

#Preview {
    WelcomeView()
}
