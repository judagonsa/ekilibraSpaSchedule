//
//  OurLocationsView.swift
//  SkilibraSpa
//
//  Created by Julian González on 28/10/25.
//

import SwiftUI

struct OurLocationsView: View {
    
    @StateObject var viewModel = OurLocationsViewModel()
    
    var body: some View {
        Text(viewModel.text)
    }
}

#Preview {
    OurLocationsView()
}
