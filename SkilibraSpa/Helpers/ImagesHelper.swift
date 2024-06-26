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
}
