//
//  ScheduleServiceViewModel.swift
//  SkilibraSpa
//
//  Created by Julian González on 14/07/24.
//

import Foundation

class ScheduleServiceViewModel: ObservableObject {
    @Published var services = ["Seleccionar", "Masaje", "Limpieza facial", "Trauma", "Camilla"]
    @Published var selectedService = ""
    @Published var isValidSelectedService = true
    
    @Published var date = Date.now
    @Published var isValidDate = true
    
    @Published var hour = Date.now
    @Published var isValidHour = true
    
    @Published var places = ["Seleccionar", "Sogamoso", "Duitama", "Sogamoso"]
    @Published var selectedPlace = ""
    @Published var isValidPlace = true
    
    @Published var observations = ""
}
