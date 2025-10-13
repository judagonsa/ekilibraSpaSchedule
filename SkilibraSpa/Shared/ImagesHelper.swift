//
//  ImagesHelper.swift
//  SkilibraSpa
//
//  Created by Julian González on 1/07/24.
//

import SwiftUI

extension Image {
    func iconGeneral() -> some View {
        return self
            .resizable()
            .scaledToFill()
            .frame(width: 20, height: 20)
    }
    
    func iconQuestion() -> some View {
        return self
            .resizable()
            .scaledToFill()
            .frame(width: 30, height: 30)
            .foregroundStyle(.red)
    }
    
    func iconProfile() -> some View {
        return self
            .resizable()
            .frame(width: 150, height: 150)
            .foregroundStyle(.gray)
            .clipShape(.circle)
            .padding(.bottom, 10)
    }
    
    func iconProfileMenu() -> some View {
        return self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 70, height: 70)
            .clipShape(.circle)
    }
}
