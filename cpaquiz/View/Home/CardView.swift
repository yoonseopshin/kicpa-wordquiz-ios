//
//  CardView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import SwiftUI

struct CardView: View {
    let quizType: TypeEnum
    @State private var showQuizSheet = false
    
    var body: some View {
        let title: String = toKoreanQuizType(from: quizType)
        let description: String = "총 \(filterQuestions(by: quizType, from: questions).count)문제"
        
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
            let quizQuestions = filterQuestions(by: quizType, from: questions)
            
            QuizView(
                currentQuestion: quizQuestions.randomElement()!,
                quizQuestions: quizQuestions
            )
                .padding(.top, 20)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(quizType: TypeEnum.business)
    }
}
