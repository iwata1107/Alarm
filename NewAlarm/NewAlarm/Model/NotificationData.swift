//
//  NotificationData.swift
//  NewAlarm
//
//  Created by 岩田照太 on 2021/03/14.
//

import SwiftUI


class NotificationData {
    
    var dateFormat1: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yyyyMMddHHmmss"
        return df
    }
    
    var dateFormat2: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日HH時mm分"
        return df
    }
   
    func scheduleNotification(thDate: Date) -> Void {
        let str1 = dateFormat1.string(from: thDate)
        let str2 = dateFormat2.string(from: thDate)
        let num = Int(str1)!
        let content = UNMutableNotificationContent()
        content.title = "\(str2)です"
       // content.subtitle =
        //content.body = "Your body"
        //content.sound = UNNotificationSound.default
        content.sound = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "sample.mp3"))
        
        var reminderDate = thDate
        
        if reminderDate < Date() {
            if let addedValue = Calendar.current.date(byAdding: .day, value: 1, to: reminderDate) {
                reminderDate = addedValue
            }
        }
        
        let comps = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: reminderDate)
                               
        let trigger = UNCalendarNotificationTrigger(dateMatching: comps, repeats: false)
        
        let request = UNNotificationRequest.init(identifier: "\(num)", content: content, trigger: trigger)

         UNUserNotificationCenter.current().add(request) {(error) in
             if let error = error {
                 print("Uh oh! We had an error: \(error)")
             }
         }
    }
    
    func requestPush() -> Void {
        print("aa")
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
  
    }
