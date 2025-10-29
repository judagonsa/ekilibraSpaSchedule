//
//  AboutUsViewModel.swift
//  SkilibraSpa
//
//  Created by Julian González on 28/10/25.
//

import Foundation
import Combine
import UIKit

class AboutUsViewModel: ObservableObject {
    
    @Published var text: String = "Acerca de nosotros"
    
    init() {
        
    }
}
