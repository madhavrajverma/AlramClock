//
//  AddAlarm.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/19/21.
//

import SwiftUI

struct AddAlarm: View {
    
    @State private var currentDate = Date()
    @State private var label:String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var sound:String  = ""
    @State  private var isSound:Bool = false
    @Environment(\.managedObjectContext) private var  viewContext
    
    
    
    var body: some View {
        NavigationView {
            Form {
                DatePicker("Time", selection: $currentDate, displayedComponents: .hourAndMinute)
                    .font(.title2)
                Section(header: Text("Label")) {
                    TextField("Enter Label", text: $label)
                }
                HStack {
                    Text("Sounds")
                        .font(.title3)
                    
                    Spacer()
                    Button(action: {
                        isSound = true
                    }, label: {
                        HStack {
                            Text(sound)
                            Image(systemName: "chevron.forward")
                                .font(.title2)
                        }
                    })
                }
            }.sheet(isPresented: $isSound, content: {
                SoundView(sound: $sound)
            })
            
            .navigationBarTitle("Add Alarm",displayMode: .inline)
            .navigationBarItems(leading: Button(action:{
                
                presentationMode.wrappedValue.dismiss()
            }){
                Text("Cancel")
                    .font(.body)
            }, trailing: Button(action:{
                withAnimation {
                    let newAlarm = Alarm(context: viewContext)
                    newAlarm.isOn = true
                    let date = currentDate
                    newAlarm.time = date
                    let title = label
                    newAlarm.label = title
                    let id  = UUID().uuidString
                    newAlarm.id  = id
                    
                    saveContext()
                    NotificationManager.instances.scheduleNotification(id:id , title: title, date: date,sound: sound)
      
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Add")
                    .font(.body)
            })
        }.accentColor(.red)
    }
    
    private func saveContext() {
        do {
           try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error:\(error)")
        }
    }
    
    
    
}
