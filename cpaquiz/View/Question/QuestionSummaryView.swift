//
//  QuestionSummaryView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import SwiftUI

struct QuestionSummaryView: View {
    @State private var showQuestionDetailSheet = false
    let question: Question
    
    var body: some View {
        // Change to Sheet
        VStack(spacing: 8) {
            HStack {
                Text(String(question.year))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Text(toKoreanQuizType(from: question.type))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Text(question.source.rawValue)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.horizontal)
            
            HStack {
                Text(question.description)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                Spacer()
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 8)
        .onTapGesture {
            showQuestionDetailSheet = true
        }
        .sheet(isPresented: $showQuestionDetailSheet) {
            QuestionDetailView(question: question, mode: QuestionDetailMode.detail)
                .padding(.top, 20)
        }
    }
}

struct QuestionSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionSummaryView(question: questions[0])
    }
}
