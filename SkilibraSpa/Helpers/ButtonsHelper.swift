//
//  ButtonsHelper.swift
//  SkilibraSpa
//
//  Created by Julian González on 25/06/24.
//

import SwiftUI

extension Button {
    func buttonFooter(color: Color) -> some View {
        return self
            .font((.system(.title3, design: .rounded)))
            .bold()
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .padding(.bottom, 30)
    }
}
