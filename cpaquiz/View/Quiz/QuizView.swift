//
//  QuizView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/02.
//

import SwiftUI

struct QuizView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var currentQuestion: Question
    @State private var quizUiState: QuizUiState = QuizUiState.quiz
    @State private var solvedQuestions: Int = 0
    @State private var updater: Int = 0
    @State private var totalQuestions: Array<Question> = []
    @State private var selectedAnswer: Int = -1
    @State private var toastConfig: ToastConfig = ToastConfig()
    
    var body: some View {
        VStack(alignment: .leading) {
            switch quizUiState {
            case .quiz:
                HStack {
                    VStack(alignment: .leading) {
                        Text("퀴즈")
                            .font(.title2)
                        Text("\(min(solvedQuestions + 1, 5))/5")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                QuestionDetailView(
                    question: currentQuestion,
                    mode: QuestionDetailMode.quiz,
                    selectedAnswer: $selectedAnswer
                )
                    .toast(toastConfig: $toastConfig)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    CircleButton(icon: "checkmark", bodyColor: Color(.systemTeal), iconColor: Color.white) {
                        totalQuestions.append(currentQuestion)
                        
                        if (currentQuestion.answer == selectedAnswer) {
                            toastConfig = ToastConfig(
                                isShowing: true, icon: "checkmark.circle", message: "정답입니다.")
                        } else {
                            toastConfig = ToastConfig(
                                isShowing: true, icon: "xmark.circle", message: "오답입니다.")
                        }
                        
                        if (solvedQuestions < 5) {
                            solvedQuestions += 1
                            
                            if (solvedQuestions >= 5) {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    quizUiState = QuizUiState.result
                                }
                            } else {
                                selectedAnswer = -1
                                currentQuestion = questions.randomElement()!
                            }
                        }
                    }
                    .padding(.trailing, 20)
                }
                Spacer()
            case .result:
                NavigationView {
                    QuestionListView(questionList: totalQuestions)
                        .navigationTitle("결과")
                        .navigationBarItems(trailing: Button("확인") {
                            dismiss()
                        })
                }
            }
        }
    }
}

enum QuizUiState {
    case quiz
    case result
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(currentQuestion: questions.randomElement()!)
    }
}
