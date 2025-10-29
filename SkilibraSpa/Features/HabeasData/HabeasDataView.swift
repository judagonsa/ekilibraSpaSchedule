//
//  HabeasDataView.swift
//  SkilibraSpa
//
//  Created by Julian González on 28/10/25.
//

import SwiftUI

struct HabeasDataView: View {
    
    @StateObject var viewModel = HabeasDataViewModel()
    var body: some View {
        Text(viewModel.text)
    }
}

#Preview {
    HabeasDataView()
}
