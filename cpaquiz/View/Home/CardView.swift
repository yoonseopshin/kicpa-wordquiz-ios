//
//  CardView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import SwiftUI

struct CardView: View {
    let title: String
    let description: String
    @State private var showQuizSheet = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(systemName: "play.circle")
                .font(.system(size: 24))
                .foregroundColor(.blue)
            VStack(alignment: .leading, spacing: 4) {
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.primary)

            }
            .padding(.trailing, 8)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 12)
        .padding(.vertical, 24)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
        .shadow(radius: 2)
        .onTapGesture {
            showQuizSheet = true
        }
        .sheet(isPresented: $showQuizSheet) {
            QuizView(currentQuestion: questions.randomElement()!)
                .padding(.top, 20)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "회계학", description: "총 123문제")
            .previewLayout(.fixed(width: 200, height: 200))
            .padding()
    }
}
