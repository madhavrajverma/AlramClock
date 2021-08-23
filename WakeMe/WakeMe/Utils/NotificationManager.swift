//
//  NotificationManager.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/21/21.
//

import Foundation
import UserNotifications


class NotificationManager:  NSObject  {
    static let instances = NotificationManager()
    let notificationCenter = UNUserNotificationCenter.current()

    
    func requestAuthroization() {
        
        let options:UNAuthorizationOptions  = [.alert,.sound,.badge]
        notificationCenter.requestAuthorization(options: options) { (succes, error) in
            if let error = error {
                print(error.localizedDescription)
            }else {
                print(succes)
            }
            
        }
        
        
    }
    
    
    func scheduleNotification(id:String, title:String,date:Date,sound:String) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = "Get up"
        content.sound = UNNotificationSound(named: UNNotificationSoundName("alarm.wav"))
       

//        content.sound = .default
        
        let components = Calendar.current.dateComponents([.hour,.minute,.second,.nanosecond
        ], from: date)
        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        
        let request = UNNotificationRequest(identifier: id, content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func cancelNotification(id:String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
//        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
}


extension NotificationManager: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("The notification is about to be presented")
        
        completionHandler([.badge, .sound, .banner])
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let identifier = response.actionIdentifier
        
        switch identifier {
            
        case UNNotificationDismissActionIdentifier:
            print("Notification was dismissed")
            completionHandler()
            
        case UNNotificationDefaultActionIdentifier:
            print("The user opened the app from the notification")
            completionHandler()
            
        default:
            print("The default case was called")
            completionHandler()
        }
    }
    
}
