//
//  LoginView.swift
//  SkilibraSpa
//
//  Created by Julian González on 27/06/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
      
            Spacer()
            
            Image(.logoWelcome)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding(.vertical, 30)
            
            
            FormTextFfield(nameField: "Teléfono", valueField: $viewModel.phoneNumber)
            
            FormTextFfield(nameField: "Contraseña", valueField: $viewModel.email)
            
            Button {
                
                 
            } label: {
                Text("Iniciar sesión")
            }
            .buttonFooter(color: .green) //TODO: poner color principal de la app
            
            Spacer()
            HStack {
                Text("No tienes cuenta?")
                    .foregroundStyle(.gray)
                    .font(.system(.callout, design: .rounded))
                
                Button {
                    //TODO: ir a vista de crear cuenta
                }label: {
                    Text("Crear cuenta")
                        .font(.system(.callout, design: .rounded))
                }
            }
            
        }
    }
}

#Preview {
    LoginView()
}
