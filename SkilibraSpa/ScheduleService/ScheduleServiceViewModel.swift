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
    
    @Published var warnings = ""
    
    func validateInformation() -> Bool {
        warnings = ""
        
        if selectedService.isEmpty || selectedService == "Seleccionar" {
            warnings = "Favor seleccionar un servicio"
            return false
        }
        
        if !validateDateSelected() {
            warnings = "Favor seleccionar una fecha"
            return false
        }
        
        if !validateHourSelected() {
            warnings = "Favor seleccionar una hora"
            return false
        }
        
        if selectedPlace.isEmpty || selectedPlace == "Seleccionar" {
            warnings = "Favor seleccionar un lugar"
            return false
        }
        
        return true
    }
    
    func validateDateSelected() -> Bool {
        //TODO: validar con base de datos
        //TODO: funcion async
        //retornar un bool y un string
        return true
    }
    
    func validateHourSelected() -> Bool {
        //TODO: validar con base de datos
        //TODO: funcion async
        //retornar un bool y un string
        return true
    }
}
