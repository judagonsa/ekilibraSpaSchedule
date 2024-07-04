//
//  TextsHelper.swift
//  SkilibraSpa
//
//  Created by Julian González on 25/06/24.
//

import SwiftUI

extension Text {
    func textWelcome() -> some View {
        return self
            .font(.system(.largeTitle, design: .rounded))
            .bold()
    }
    
    func textDescription() -> some View {
        return self
            .font(.system(.callout, design: .rounded))
            .foregroundStyle(.gray)
    }
    
    func overlayButton(
        cornerRadiuds: CGFloat = 10,
        borderColor: Color = .clear,
        lineWidth: CGFloat = 0,
        colorText: Color = .black
    ) -> some View {
        return self
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadiuds)
                    .stroke(borderColor, lineWidth: lineWidth)
            }
            .font(.system(.body, design: .rounded))
            .foregroundStyle(colorText)
            .shadow(radius: cornerRadiuds)
    }
    
    func clipShapeButton(
        backGroundColor: Color = .white,
        cornerRadius: CGFloat = 10,
        colorText: Color = .white
    ) -> some View {
        return self
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(backGroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .font(.system(.body, design: .rounded))
            .foregroundStyle(colorText)
            .shadow(radius: 1)
    }
    
    func titleView () -> some View {
        return self
            .font(.system(.largeTitle, design: .rounded))
            .bold()
            .padding(.vertical, 18)
    }
    
    func textPopover() -> some View {
        return self
            .font(.system(size: 18, weight: .light, design: .rounded))
            .padding()
            .presentationCompactAdaptation(.none)
    }
}

extension TextEditor {
    func textObservation() -> some View {
        return self
            .font(.system(size: 18, weight: .light, design: .rounded))
            .frame(height: 100)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray ,style: StrokeStyle(lineWidth: 0.5))
            }
            .padding(.horizontal)
    }
}
