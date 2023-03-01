//
//  SettingsView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Text("설정화면 무엇을 넣을까?")
            .navigationTitle("설정")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
