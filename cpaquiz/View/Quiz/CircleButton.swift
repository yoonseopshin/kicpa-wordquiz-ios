//
//  CircleButton.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/02.
//

import SwiftUI

struct CircleButton: View {
    var icon: String
    var bodyColor: Color
    var iconColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .foregroundColor(iconColor)
                .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                .background(bodyColor)
                .clipShape(Circle())
        }
        .shadow(radius: 5)
        
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(icon: "checkmark", bodyColor: Color(.systemTeal), iconColor: Color.white, action: {})
    }
}
