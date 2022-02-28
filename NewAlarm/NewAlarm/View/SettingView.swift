//
//  SettingView.swift
//  NewAlarm
//
//  Created by 岩田照太 on 2021/03/04.
//

import SwiftUI


struct SettingView: View {
    @State var thDate = Date()
    @EnvironmentObject var setData: ShareData
    @Binding var isPresented: Bool
    let notificationdata = NotificationData()
    
    
    var dateFormat: DateFormatter {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_JP")
        df.calendar = Calendar(identifier: .japanese)
        df.dateStyle = .short
        df.timeStyle = .short
        
        return df
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    DatePicker(selection: $thDate,
                               displayedComponents: [.date, .hourAndMinute]
                               ,label: { EmptyView()}
                    )
                    .foregroundColor(.white)
                    .datePickerStyle(WheelDatePickerStyle())
                    .font(.title2)
                    .environment(\.locale, Locale(identifier: "ja_JP"))
                    .frame(width: 100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100, alignment: .center)
                    .padding()
                    .padding()
                    .padding()
                    
                    
                    //}
                    //.toolbar {
                    Button(action: {
                        notificationdata.requestPush() //通知のリクエストを送る
                        notificationdata.scheduleNotification(thDate: thDate) //通知のデータを保存するために送る
                        isPresented = false
                        setData.alarmData.append(thDate) //配列を繋げる
                        setData.alarmData.sort() //ソート
                        UserDefaults.standard.set(setData.alarmData, forKey: "alarm") //保存
                    })
                    {
                        Text("保存")
                            .imageScale(.large)
                            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            .padding()
            .frame(width: 400.0, height: 800.0)
        }
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingView(isPresented: Binding.constant(false))
                .padding([.top, .trailing])
                .environmentObject(ShareData())
        }
    }
}
