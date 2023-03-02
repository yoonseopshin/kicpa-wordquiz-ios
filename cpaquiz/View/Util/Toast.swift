//
//  ToastView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/02.
//

import SwiftUI

struct ToastConfig {
    var isShowing: Bool = false
    var icon: String = ""
    var message: String = ""
    var duration: TimeInterval = 1
}

struct ToastModifier: ViewModifier {
    @Binding var config: ToastConfig
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if config.isShowing {
                toast
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + config.duration) {
                            withAnimation {
                                config = ToastConfig(isShowing: false)
                            }
                        }
                    }
            }
        }
    }
    
    private var toast: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName:config.icon)
                Text(config.message)
                    .font(.footnote)
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(5)
            .shadow(radius: 5)
        }
        .padding()
    }
}

extension View {
    func toast(toastConfig: Binding<ToastConfig>) -> some View {
        modifier(ToastModifier(config: toastConfig))
    }
}

struct ToastView: View {
    @State private var toastConfig = ToastConfig(
        isShowing: false, icon: "", message: "", duration: 2.5
    )
    
    var body: some View {
        Text("Click me!")
            .onTapGesture {
                toastConfig = ToastConfig(
                    isShowing: true, icon: "heart.fill", message: "test", duration: 2.5)
            }
            .toast(toastConfig: $toastConfig)
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView()
    }
}
