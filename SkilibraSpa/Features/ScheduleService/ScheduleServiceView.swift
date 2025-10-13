//
//  ScheduleService.swift
//  SkilibraSpa
//
//  Created by Julian González on 13/07/24.
//

import SwiftUI

struct ScheduleServiceView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = ScheduleServiceViewModel()
    
    
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
                Picker("Please choose a color", selection: $viewModel.selectedService) {
                    ForEach(viewModel.services, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                
                DatePicker("Fecha", selection: $viewModel.date, displayedComponents: .date)
                
                DatePicker("Hora", selection: $viewModel.hour, displayedComponents: .hourAndMinute)
                
                Picker("Lugar", selection: $viewModel.selectedPlace) {
                    ForEach(viewModel.places, id: \.self) {
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
            
            TextEditor(text: $viewModel.observations)
                .textObservation()
            
            Spacer()
            
            
            HStack (alignment: .center) {
                Text(viewModel.warnings)
                    .frame(maxWidth: .infinity)
                    .font(.system(.callout, design: .rounded))
                    .foregroundStyle(.red)
            }
            Button {
                if viewModel.validateInformation() {
                    print("agendar cita")
                }
            } label: {
                Text("Agendar")
            }
            .buttonFooter(color: .red) //MARK: poner color principal de la app
            
            
        }
    }
}

#Preview {
    ScheduleServiceView()
}
