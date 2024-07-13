//
//  ChangePasswordView.swift
//  SkilibraSpa
//
//  Created by Julian González on 11/07/24.
//

import SwiftUI

struct ChangePasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = ChangePasswordViewModel()
    
    var body: some View {
        VStack {
            
            ZStack {
                HStack {
                    Text("Cambiar contraseña")
                        .titleView()
                }
                
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.black)
                    }
                    .padding(.leading)
                    Spacer()
                }
            }
            
            FormSecureField(
                nameField: "Contraseña actual",
                valueField: $viewModel.currentPassword,
                isSecureField: $viewModel.showCurrentPassword
            )
            if !viewModel.isValidCurrentPassword {
                RequirementText(requirementText: "La contraseña ingresada es errónea.")
            }
            
            Divider()
            
            FormSecureField(
                nameField: "Nueva contraseña",
                valueField: $viewModel.newPassword,
                isSecureField: $viewModel.showNewPassword
            )
            if !viewModel.isValidNewPassword {
                RequirementText(requirementText: "Contraseña no valida, debe contener una mayúscula y un número (mayor a 6 carácteres).")
            }
            
            FormSecureField(
                nameField: "Repetir la nueva contraseña",
                valueField: $viewModel.repeatNewPassword,
                isSecureField: $viewModel.showRepeatNewPassword
            )
            if !viewModel.isValidNewPassword && viewModel.isValidRepeatNewPassword {
                RequirementText(requirementText: "Las contraseñas no coinciden.")
            }
            
            Spacer()
            
            Button {
                if viewModel.validationField() {
                    if KeychainManager.shared.updatePassword(viewModel.newPassword.data(using: .utf8)!) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }else {
                    viewModel.isRealTime = true
                }
            } label: {
                Text("Cambiar")
            }
            .buttonFooter(color: .red)
        }
    }
}

#Preview {
    ChangePasswordView()
}
