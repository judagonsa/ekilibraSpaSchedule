//
//  RegisterView.swift
//  SkilibraSpa
//
//  Created by Julian González on 25/06/24.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = RegisterViewModel()
    @State var isRegister: Bool
    
    var body: some View {
        VStack {
            
            ZStack {
                HStack {
                    Text(isRegister ? "Registrar usuario" : "Perfil")
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
            
            ScrollView {
                
                FormTextFfield(nameField: "Nombre", valueField: $viewModel.name)
                if !viewModel.isValidName {
                    RequirementText(requirementText: "Mínimo 3 caracteres")
                }
                
                FormTextFfield(nameField: "Apellido", valueField: $viewModel.lastName)
                if !viewModel.isValidLastName {
                    RequirementText(requirementText: "Mínimo 3 caracteres")
                }
                
                FormTextFfield(nameField: "Edad", valueField: $viewModel.age)
                
                if !viewModel.isValidAge {
                    RequirementText(iconName: "calendar.badge.clock", requirementText: "Favor ingresa una edad")
                }
                
                //seleccionar país (indicativo) con un servicio
                FormTextFfield(nameField: "Número de teléfono", valueField: $viewModel.numberPhone)
                if !viewModel.isValidNumberPhone {
                    RequirementText(iconName: "candybarphone", requirementText: "Número teléfonico inválido")
                }
                Menu {
                    Section("Género") {
                        Button("Hombre") {
                            viewModel.gender = "Hombre"
                        }
                        Button("Mujer") {
                            viewModel.gender = "Mujer"
                        }
                        Button("Otro") {
                            viewModel.gender = "Otro"
                        }
                    }
                } label: {
                    FormTextFfield(nameField: "Género", valueField: $viewModel.gender)
                }
                
                if !viewModel.isValidGender {
                    RequirementText(iconName: "filemenu.and.selection", requirementText: "Debes seleccionar el género")
                }
            }
            
            Spacer()
            
            Button {
                if viewModel.validationField() {
                    let profile = UserModel(
                        name: viewModel.name,
                        lastName: viewModel.lastName,
                        numberPhone: viewModel.numberPhone,
                        age: viewModel.age,
                        gender: viewModel.gender,
                        observations: ""
                    )
                    
                    //.viewModel.saveProfile(profile: profile)
                    
                }else {
                    viewModel.isRealTime = true
                }
            } label: {
                Text(isRegister ? "Registrar" : "Guardar")
            }
            .buttonFooter(color: .red) //MARK: poner color principal de la app
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    RegisterView(isRegister: true)
}
