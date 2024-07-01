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
    @State var showPhoneInfo = false
    
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
                        RequirementText(
                            iconName: "calendar.badge.clock",
                            requirementText: viewModel.age == "" ? "Favor ingresa una edad" : Int(viewModel.age)! < 15 ? "Debes ingresar una edad mayor a 15 años" : Int(viewModel.age)! >= 80 ? "Debes ingresar una edad menor a 80 años" : ""
                        )
                    }
                    HStack {
                        FormTextFfield(nameField: "Número de teléfono", valueField: $viewModel.phoneNumber)
                        
                        Button {
                            showPhoneInfo.toggle()
                        }label: {
                            Image(systemName: "questionmark.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .padding(.trailing)
                                .foregroundStyle(.red)
                        }
                        .popover(isPresented: $showPhoneInfo, arrowEdge: .bottom) {
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
                        FormTextFfield(nameField: "Género", valueField: $viewModel.gender)
                    }
                    if !viewModel.isValidGender {
                        RequirementText(iconName: "filemenu.and.selection", requirementText: "Debes seleccionar el género")
                    }
                    
                    
                    FormTextFfield(nameField: "Contraseña", valueField: $viewModel.password)
                    if !viewModel.isValidPassword {
                        RequirementText(requirementText: "Contraseña no valida, debe contener una mayúscula y un número (mayor a 6 carácteres)") 
                    }
                    
                    FormTextFfield(nameField: "Repetir contraseña", valueField: $viewModel.confirmPassword)
                    if !viewModel.isValidConfirmPassword && viewModel.isValidPassword {
                        RequirementText(requirementText: "Las contraseñas no coinciden")
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
    }
}

#Preview {
    RegisterView(isRegister: true)
}
