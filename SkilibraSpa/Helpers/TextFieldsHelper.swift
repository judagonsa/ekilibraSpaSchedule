//
//  TextFieldsHelper.swift
//  SkilibraSpa
//
//  Created by Julian González on 25/06/24.
//

import SwiftUI

extension TextField {
    
    func fontTextNormal() -> some View{
        return self
            .font(.system(size: 18, weight: .light, design: .rounded))
    }
    
    func textFormulary() -> some View {
        return self
            .font(.system(size: 18, weight: .light, design: .rounded))
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .multilineTextAlignment(.leading)
            .foregroundStyle(.black)
    }
}

extension SecureField {
    func secureFormulary() -> some View {
        return self
            .font(.system(size: 18, weight: .light, design: .rounded))
            .padding(10)
            .textInputAutocapitalization(.never)
            .padding(.vertical, 0.8)
    }
}

struct FormTextField: View {
    var nameField = ""
    @Binding var valueField: String
    var isEmail = false
    var isNumber = false
    
    var body: some View {
        VStack (alignment: .leading, spacing: -2) {
            
            if !valueField.isEmpty {
                Text(nameField)
                    .font(.system(size: 13, design: .rounded))
                    .padding(.horizontal)
                    .foregroundStyle(.gray)
            }
            
            if isEmail {
                
                TextField(nameField, text: $valueField)
                    .textFormulary()
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
            }else if isNumber{
                
                TextField(nameField, text: $valueField)
                    .textFormulary()
                    .keyboardType(.numberPad)
                
            }else {
                
                TextField(nameField, text: $valueField)
                    .textFormulary()
                
            }
        }
    }
}

struct FormSecureField: View {
    var nameField = ""
    @Binding var valueField: String
    @Binding var isSecureField: Bool
    
    var body: some View {
        VStack (alignment: .leading, spacing: -2){
            if !valueField.isEmpty {
                Text(nameField)
                    .font(.system(size: 13, design: .rounded))
                    .padding(.horizontal)
                    .foregroundStyle(.gray)
            }
            
            HStack {
                if isSecureField {
                    SecureField(nameField, text: $valueField)
                        .secureFormulary()
                }else {
                    TextField(nameField, text: $valueField)
                        .font(.system(size: 18, weight: .light, design: .rounded))
                        .padding(10)
                        .textInputAutocapitalization(.never)
                }
                
                Button {
                    isSecureField.toggle()
                }label: {
                    Image(systemName: isSecureField ? "eye.fill" : "eye.slash.fill")
                        .iconGeneral()
                        .padding(.trailing)
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .multilineTextAlignment(.leading)
            .foregroundStyle(.black)
        }
    }
}

struct RequirementText: View {
    
    //error: xmark.circle.fill
    //bien: checkmark.circle.fill
    var iconName = "xmark.circle.fill"
    var iconColor = Color.red //MARK: colocar color principal de la app
    var requirementText = ""
    var isVerified = false
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
            
            Text(requirementText)
                .foregroundStyle(.secondary)
                .font(.system(.footnote, design: .rounded))
                .strikethrough(isVerified)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.bottom, 5)
        .padding(.top, -5)
    }
}
