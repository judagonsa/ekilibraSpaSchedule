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
                    
                VStack (spacing: 5) {
                    FormTextField(nameField: "Nombre", valueField: $viewModel.name)
                    if !viewModel.isValidName {
                        RequirementText(requirementText: "Mínimo 3 caracteres")
                    }
                    
                    FormTextField(nameField: "Apellido", valueField: $viewModel.lastName)
                    if !viewModel.isValidLastName {
                        RequirementText(requirementText: "Mínimo 3 caracteres")
                    }
                    
                    FormTextField(nameField: "Edad", valueField: $viewModel.age)
                    
                    if !viewModel.isValidAge {
                        RequirementText(
                            iconName: "calendar.badge.clock",
                            requirementText: viewModel.age == "" ? "Favor ingresa una edad" : Int(viewModel.age)! < 15 ? "Debes ingresar una edad mayor a 15 años" : Int(viewModel.age)! >= 80 ? "Debes ingresar una edad menor a 80 años" : ""
                        )
                    }
                    HStack {
                        FormTextField(nameField: "Número de teléfono", valueField: $viewModel.phoneNumber)
                        
                        Button {
                            viewModel.showPhoneInfo.toggle()
                        }label: {
                            Image(systemName: "questionmark.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .padding(.trailing)
                                .foregroundStyle(.red)
                        }
                        .popover(isPresented: $viewModel.showPhoneInfo, arrowEdge: .bottom) {
                            Text("Información de solo colombia")
                                .font(.system(size: 18, weight: .light, design: .rounded))
                                .padding()
                                .presentationCompactAdaptation(.none)
                        }
                        
                    }
                    
                    if !viewModel.isValidPhoneNumber {
                        RequirementText(iconName: "candybarphone", requirementText: viewModel.phoneNumber.isEmpty ? "Favor ingresar el número telefónico" : "Número teléfonico inválido")
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
                        FormTextField(nameField: "Género", valueField: $viewModel.gender)
                    }
                    if !viewModel.isValidGender {
                        RequirementText(iconName: "filemenu.and.selection", requirementText: "Debes seleccionar el género")
                    }
                    
                    if isRegister {
                        FormSecureField(
                            nameField: "Contraseña",
                            valueField: $viewModel.password,
                            isSecureField: $viewModel.showPassword
                        )
                        if !viewModel.isValidPassword {
                            RequirementText(requirementText: "Contraseña no valida, debe contener una mayúscula y un número (mayor a 6 carácteres)")
                        }
                        
                        FormSecureField(
                            nameField: "Repetir contraseña",
                            valueField: $viewModel.confirmPassword,
                            isSecureField: $viewModel.showConfirmPassword
                        )
                        if !viewModel.isValidConfirmPassword && viewModel.isValidPassword {
                            RequirementText(requirementText: "Las contraseñas no coinciden")
                        }
                    }
                    
                    if !isRegister {
                        Button {
                            //TODO: ir  la vista de cambiar contraseña revisar diseño para ubicación
                        }label: {
                            HStack{
                                Spacer()
                                Text("Cambiar contraseña")
                                    .padding()
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                }
            }
            .scrollDismissesKeyboard(.automatic)
            
            Spacer()
            
            Button {
                if viewModel.validationField() {
                    let profile = UserModel(
                        name: viewModel.name,
                        lastName: viewModel.lastName,
                        phoneNumber: viewModel.phoneNumber,
                        age: viewModel.age,
                        gender: viewModel.gender,
                        observations: ""
                    )
                    print(profile.printData())
                    //.viewModel.saveProfile(profile: profile)
                    //guardar la contraseña en algún lado
                    
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
        .onAppear {
            viewModel.isRegister = isRegister
        }
    }
}

#Preview {
    RegisterView(isRegister: true)
}
