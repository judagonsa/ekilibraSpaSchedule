//
//  PrivacyPolicyView.swift
//  SkilibraSpa
//
//  Created by Julian González on 28/10/25.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @StateObject var viewModel = PrivacyPolicyViewModel()
    var body: some View {
        Text(viewModel.text)
    }
}

#Preview {
    PrivacyPolicyView()
}
