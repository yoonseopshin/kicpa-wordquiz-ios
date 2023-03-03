//
//  QuestionDetailView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import SwiftUI

struct QuestionDetailView: View {
    let question: Question
    let mode: QuestionDetailMode
    @Binding var selectedAnswer: Int
    
    var body: some View {
        ScrollView {
            HStack {
                Text("\(String(question.year))년 \(question.pid)번")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Spacer()
                Text(toKoreanQuizType(from: question.type))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
            
            VStack(alignment: .leading) {
                Text(question.description)
                    .font(.body)
                    .padding(.top, 12)
                
                if (question.subDescription.isEmpty == false) {
                    Divider()
                    
                    Text(question.subDescription.joined(separator: "\n"))
                        .foregroundColor(Color(.secondaryLabel))
                        .font(.callout)
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    ForEach(0..<question.questions.count, id: \.self) { index in
                        if (mode == QuestionDetailMode.detail) {
                            UnclickableRadioButton(
                                id: index,
                                label: question.questions[index],
                                selectedID: question.answer
                            )
                        } else {
                            RadioButton(
                                id: index,
                                label: question.questions[index],
                                selectedID: $selectedAnswer
                            )
                        }
                    }
                }
                .padding(.vertical)
            }
            .cornerRadius(10)
            .padding(.horizontal, 16)
            .shadow(radius: 5)
            .onAppear {
                selectedAnswer = -1
            }
        }
        .padding(.top, 20)
        
    }
}

struct UnclickableRadioButton: View {
    let id: Int
    let label: String
    let selectedID: Int
    
    var body: some View {
        HStack {
            Image(systemName: selectedID == id ? "largecircle.fill.circle" : "circle")
                .foregroundColor(selectedID == id ? Color.blue : Color.gray)
            Text(label)
                .multilineTextAlignment(.leading)
                .foregroundColor(.secondary)
                .font(.body)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 5)
    }
}

struct RadioButton: View {
    let id: Int
    let label: String
    @Binding var selectedID: Int
    
    var body: some View {
        Button(action: {
            self.selectedID = self.id
        }) {
            HStack {
                Image(systemName: selectedID == id ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(selectedID == id ? Color.blue : Color.gray)
                Text(label)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.secondary)
                    .font(.callout)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 5)
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetailView(
            question: questions[103],
            mode: QuestionDetailMode.detail,
            selectedAnswer: .constant(-1)
        )
    }
}
