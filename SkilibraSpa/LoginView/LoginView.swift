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
            if !viewModel.isValidPhoneNumber {
                RequirementText(
                    iconName: "candybarphone",
                    requirementText: viewModel.phoneNumber.isEmpty
                    ? "Favor ingresar el número telefónico"
                    : "Número teléfonico inválido"
                )
            }
            
            FormTextFfield(nameField: "Contraseña", valueField: $viewModel.password)
            if !viewModel.isValidPasword {
                RequirementText(requirementText: "Favor ingrese una contraseña") //TODO: mayor de 4 dígitos
            }
            
            Button {
                if viewModel.validationField() {
                    
                } else {
                    viewModel.isRealTime = true
                }
                
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
