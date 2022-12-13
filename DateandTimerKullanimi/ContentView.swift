//
//  ContentView.swift
//  DateandTimerKullanimi
//
//  Created by İlker Kaya on 9.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var zaman = Date()
    @State private var tarihGorun = false
    @State private var saatGorun = false
    @State private var tarih = ""
    @State private var saat = ""
    var body: some View {
        VStack(spacing: 40) {
            TextField("Tarih", text: $tarih)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onTapGesture {
                    self.tarihGorun = true
                }
            if tarihGorun{
                DatePicker("",selection: $zaman,displayedComponents: .date).labelsHidden()
                
                HStack{
                    Button {
                        let zamanFormat = DateFormatter()
                        zamanFormat.dateFormat = "MM/dd/yyyy"
                        let alinanTarih = zamanFormat.string(from: self.zaman)
                        self.tarih = alinanTarih
                        self.tarihGorun = false
                    } label: {
                        Text("Tarih Seç")
                    }
                    
                    Button {
                        self.tarihGorun = false
                    } label: {
                        Text("Kapat").foregroundColor(Color.red)
                    }


                }
            }
            
            TextField("Saat", text: $saat)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onTapGesture{
                    self.saatGorun = true
                }
            if saatGorun{
                DatePicker("",selection: $zaman,displayedComponents: .hourAndMinute).labelsHidden()
                HStack{
                    Button {
                        let zamanFormat = DateFormatter()
                        zamanFormat.dateFormat = "hh:mm"
                        let alinanSaat = zamanFormat.string(from: self.zaman)
                        self.saat = alinanSaat
                        self.saatGorun = false
                    } label: {
                        Text("Saat seç")
                    }
                    Button {
                        self.saatGorun = false
                    } label: {
                        Text("Kapat")
                            .foregroundColor(Color.red)
                    }

                    

                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
