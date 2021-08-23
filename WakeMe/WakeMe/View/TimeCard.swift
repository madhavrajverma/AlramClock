//
//  TimeCard.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/18/21.
//

import SwiftUI
import UserNotifications

struct TimeCard :View {
    
    @State  var isOn:Bool = false 
     var alarm :Alarm
    
    
     var formatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()

    var body: some View {
        VStack(alignment:.leading) {
            HStack(alignment:.top) {
                Text(alarm.time ?? Date(),formatter: formatter)
                    .font(.title)
                    .fontWeight(.bold)
                
                Toggle("", isOn: $isOn  )
                    .toggleStyle(SwitchToggleStyle(tint: .red))
                    .onChange(of: isOn) { (_) in
                        updateData()
                    }
            }
            Text(alarm.label ?? "")
                .font(.headline)
                .fontWeight(.regular)

        }
        
    }
    
    private func updateData() {
        
        
        withAnimation {
            alarm.isOn = isOn
            PersistenceController.shared.save()
        }
        
        
        guard let id = alarm.id else {
            return
        }
        
        guard let  time  = alarm.time , let label = alarm.label else {
            return
        }
        
        if isOn == false {
            NotificationManager.instances.cancelNotification(id: id )
        }else {
            NotificationManager.instances.scheduleNotification(id:id , title: label, date: time,sound: "")
        }
    }
    
    
}
