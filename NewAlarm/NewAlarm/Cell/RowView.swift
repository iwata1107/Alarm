//
//  RowView.swift
//  NewAlarm
//
//  Created by 岩田照太 on 2021/03/09.
//

import SwiftUI

struct RowView: View {
    let str: String
    
    
    var body: some View {
        
        ZStack{
            Color.black
                    .edgesIgnoringSafeArea(.all)
            Text(str)
                .font(.title2)
                .frame(height: 70)
                .foregroundColor(.white)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(str: "ss").previewLayout(.fixed(width: 300, height: 100))
    }
}
