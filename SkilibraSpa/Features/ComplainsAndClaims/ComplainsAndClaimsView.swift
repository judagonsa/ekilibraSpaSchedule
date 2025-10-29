//
//  ComplainsAndClaimsView.swift
//  SkilibraSpa
//
//  Created by Julian González on 28/10/25.
//

import SwiftUI

struct ComplainsAndClaimsView: View {
    
    @StateObject var viewModel = ComplainsAndClaimsViewModel()
    var body: some View {
        Text(viewModel.text)
    }
}

#Preview {
    ComplainsAndClaimsView()
}
