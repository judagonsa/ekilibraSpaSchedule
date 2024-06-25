//
//  WelcomeView.swift
//  SkilibraSpa
//
//  Created by Julian González on 25/06/24.
//

import SwiftUI

struct WelcomeView: View {
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
                    //MARK: ir a la vista de registro
                }label: {
                    Text("Registrarme")
                        .overlayButton(borderColor: .green, lineWidth: 2)
                }
                
                Button {
                    //MARK: ir a la vista de iniciar sesión
                }label: {
                    Text("Iniciar sesión")
                        .clipShapeButton(backGroundColor: .green)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    WelcomeView()
}
