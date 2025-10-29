//
//  QuestionsView.swift
//  SkilibraSpa
//
//  Created by Julian González on 28/10/25.
//

import SwiftUI

struct QuestionsView: View {
    @StateObject var viewModel = QuestionsViewModel()
    var body: some View {
        Text(viewModel.text)
    }
}

#Preview {
    QuestionsView()
}
