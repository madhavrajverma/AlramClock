//
//  WakeMe.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/14/21.
//

import SwiftUI
import CoreData


struct WakeMe: View {
    
    @State private var isAdd :Bool = false
    @Environment(\.managedObjectContext) private var  viewContext
    @FetchRequest(sortDescriptors: [])
    var alarms :FetchedResults<Alarm>
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    ForEach(alarms) { alarm in
                        TimeCard(isOn:alarm.isOn, alarm: alarm)
                            .onTapGesture(count: 1) {
                                updateAlarm(alarm)
                                
                            }
                        
                    }.onDelete(perform: deleteAlarm)
                }
                .navigationBarTitle("Alarm")
                .navigationBarItems(trailing: Button(action:{
                    isAdd = true
                }){
                    Image(systemName: "plus")
                        .font(.title)
                })
                
            }.fullScreenCover(isPresented: $isAdd, content: {
                AddAlarm()
            })
        }
    }
    
    private func deleteAlarm(offsets:IndexSet) {
        withAnimation {
            offsets.map {
                alarms[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error:\(error)")
        }
    }
    
    private func updateAlarm(_ alarm: FetchedResults<Alarm>.Element) {
        
        withAnimation {
            
        }
    }
    
}


