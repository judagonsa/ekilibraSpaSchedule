//
//  ScheduleService.swift
//  SkilibraSpa
//
//  Created by Julian González on 13/07/24.
//

import SwiftUI

struct ScheduleService: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var colors = ["Seleccionar", "Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = ""
    @State private var date = Date.now
    
    @State private var hour = Date.now
    var places = ["Seleccionar", "Sogamoso", "Duitama", "Sogamoso"]
    @State var selectedPlace = ""
    
    @State var observations = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            
            ZStack {
                HStack {
                    Text("Agendar cita")
                        .titleView()
                }
                
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.black)
                    }
                    .padding(.leading)
                    Spacer()
                }
            }
            
            
            Form {
                Picker("Please choose a color", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                
                DatePicker("Fecha", selection: $date, displayedComponents: .date)
                
                DatePicker("Hora", selection: $date, displayedComponents: .hourAndMinute)
                
                Picker("Lugar", selection: $selectedPlace) {
                    ForEach(places, id: \.self) {
                        Text($0)
                            .foregroundStyle(.red)
                    }
                }
                .pickerStyle(.menu)
                
            }
            .accentColor(.red)
            .scrollDisabled(true)
            .frame(height: 250)
            
            Text("Observaciones a tener en cuenta")
                .font(.system(size: 13, design: .rounded))
                .padding(.horizontal)
                .foregroundStyle(.gray)
                .padding(.top, 5)
            
            TextEditor(text: $observations)
                .textObservation()
                .onChange(of: observations){ oldValue, newValue in
//                        if oldValue.isEmpty || newValue.isEmpty {
//                            viewModel.showObservationsInfo = true
//                        }else {
//                            viewModel.showObservationsInfo = false
//                        }
                }
                .onTapGesture {
                    //viewModel.showObservationsInfo = true
                }
            
            
             Spacer()
            
            Button {
            print("validar campos seleccionados")
                    
                
            } label: {
                Text("Agendar")
            }
            .buttonFooter(color: .red) //MARK: poner color principal de la app
        }
    }
}

#Preview {
    ScheduleService()
}
