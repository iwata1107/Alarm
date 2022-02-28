//
//  NewAlarmApp.swift
//  NewAlarm
//
//  Created by 岩田照太 on 2021/03/04.
//

import SwiftUI

@main
struct NewAlarmApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ShareData())
        }
    }
}
