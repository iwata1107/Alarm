//
//  ShareData.swift
//  NewAlarm
//
//  Created by 岩田照太 on 2021/03/05.
//

import Foundation

class ShareData: ObservableObject {
        
    @Published var alarmData = UserDefaults.standard.array(forKey: "alarm") as? [Date] ?? []

}
