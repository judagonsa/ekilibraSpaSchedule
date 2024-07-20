//
//  SideMenu.swift
//  SkilibraSpa
//
//  Created by Julian González on 16/07/24.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var showMenu: Bool
    @State var showProfile = false
    @State var name = ""
    @State var lastName = ""
    @State var phoneNumber = ""
    @State var photo: Data?
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack (alignment: .top ) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    if let dataImage = photo, let image = UIImage(data: dataImage) {
                        Image(uiImage: image)
                            .iconProfileMenu()
                    }else {
                        Image(systemName: "person.crop.circle")
                            .iconProfileMenu()
                    }
                    
                    Text("\(name) \(lastName)")
                        .font(.title2.bold())
                    
                    Text(phoneNumber)
                        .font(.callout)
                    
                }
                Spacer()
                
                Button {
                    showMenu.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                }
            }
            .padding(.horizontal)
            .padding(.leading)
            
            Divider()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack (alignment: .leading, spacing: 40) {
                        TabButton(icon: "person.crop.circle", title: "Perfil") {
                            if showMenu {
                                withAnimation {
                                    showMenu.toggle()
                                    showProfile.toggle()
                                }
                            }
                        }
                        
                        TabButton(icon: "calendar", title: "Mis citas") {
                            
                        }
                        
                        TabButton(icon: "gearshape.fill", title: "Configuración") {
                            
                        }
                        
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.top, 20)
                    
                    Divider()
                    
                    TabButton(icon: "info.circle", title: "Acerca de") {
                        
                    }
                    .padding()
                    .padding(.leading)
                    
                    Divider()
                    
                    VStack (alignment: .leading, spacing: 40) {
                        TabButton(icon: "person.crop.circle", title: "Política y privacidad"){
                            
                        }
                        TabButton(icon: "lock.shield", title: "Tratamiendo de datos"){
                            
                        }
                        
                    }
                    .padding()
                    .padding(.leading)
                    
                    Divider()
                    
                    TabButton(icon: "questionmark.circle", title: "Centro de ayuda"){
                        
                    }
                    .padding()
                    .padding(.leading)
                }
                
            }
            
            Divider()
            VStack {
                Text("Ekilibra Spa")
                    .font(.callout)
                
                Text("Version 1.0.0")
                    .font(.caption2)
            }
            .opacity(0.5)
            .padding(.top, 10)
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(maxHeight:  .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        .fullScreenCover(isPresented: $showProfile, content: { RegisterView(isRegister: false) })
        .onChange(of: showMenu) { _, value in
            if value {
                if let profile = UserdefaultHelper.shared.getProfile() {
                    name = profile.name
                    lastName = profile.lastName
                    //viewModel.age = profile.age
                    phoneNumber = profile.phoneNumber
                    //viewModel.gender = profile.gender
                    //viewModel.observations = profile.observations
                    photo = profile.photo
                }
            }
        }
    }
    
    
    @ViewBuilder
    func TabButton(icon: String, title: String, completion: @escaping () -> ()) -> some View {
        Button {
            completion()
        }label: {
            HStack(spacing: 15) {
                Image(systemName: icon)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20)
                
                Text(title)
            }
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

#Preview {
    SideMenuView(showMenu: .constant(true))
}

