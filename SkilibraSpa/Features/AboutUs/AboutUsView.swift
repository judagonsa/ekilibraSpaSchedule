//
//  AboutUsView.swift
//  SkilibraSpa
//
//  Created by Julian González on 28/10/25.
//

import SwiftUI

struct AboutUsView: View {
    
    @StateObject var viewModel = AboutUsViewModel()
    
    var body: some View {
        Text(viewModel.text)
    }
}

#Preview {
    AboutUsView()
}
