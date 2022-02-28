//
//  ContentView.swift
//  NewAlarm
//
//  Created by 岩田照太 on 2021/03/04.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var setData: ShareData
    @State var isShow: Bool = false
    let notificationdata = NotificationData()
   
    var dateFormat: DateFormatter {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_JP")
        df.dateStyle = .short
        df.timeStyle = .short
        df.dateFormat = " yyyy / MM / dd    HH : mm  "
        return df
    }
    
    var body: some View {
        NavigationView{
            ZStack{
            List{
                ForEach(setData.alarmData, id: \.self){ index in
                    let str = dateFormat.string(from: index)
                    RowView(str: str)
                    }
                .onDelete(perform: rowRemove)
            }
            .navigationBarItems(trailing:
                                    Button(action: {isShow = true}){
                    Image(systemName: "plus")
                        .imageScale(.large)
                    }
                    .padding()
                    .sheet(isPresented: $isShow){
                        SettingView(isPresented: $isShow)
                    }
            )
          }
        }
    }
    
    func rowRemove(offsets: IndexSet) {
        setData.alarmData.remove(atOffsets: offsets)
        UserDefaults.standard.setValue(setData.alarmData, forKey: "alarm")
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ShareData())
    }
}
