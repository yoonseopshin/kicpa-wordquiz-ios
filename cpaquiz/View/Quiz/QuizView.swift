//
//  QuizView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/02.
//

import SwiftUI
import GoogleMobileAds

struct QuizView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var currentQuestion: Question
    @State private var quizUiState: QuizUiState = QuizUiState.quiz
    @State private var solvedQuestions: Int = 0
    @State private var updater: Int = 0
    @State private var totalQuestions: Array<Question> = []
    @State private var selectedAnswer: Int = -1
    @State private var toastConfig: ToastConfig = ToastConfig()
    
    // FIXME: questions -> questions which are filtered by type
    var quizQuestions: Array<Question>
    
    
    var body: some View {
        VStack(alignment: .leading) {
            switch quizUiState {
            case .quiz:
                HStack {
                    VStack(alignment: .leading) {
                        Text("퀴즈")
                            .font(.title)
                        Text("\(min(solvedQuestions + 1, 5))/5")
                            .font(.headline)
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
                    
                    CircleButton(icon: "checkmark", bodyColor: Color(.systemIndigo), iconColor: Color.white) {
                        if (selectedAnswer < 0 || selectedAnswer > 4) {
                            toastConfig = ToastConfig(
                                isShowing: true, icon: "exclamationmark.triangle.fill", message: "정답을 선택해주세요.")
                            return
                        }
                        
                        totalQuestions.append(currentQuestion)
                        
                        if (currentQuestion.answer == selectedAnswer) {
                            toastConfig = ToastConfig(
                                isShowing: true, icon: "checkmark.circle.fill", message: "정답입니다.", background: Color(.systemGreen))
                        } else {
                            toastConfig = ToastConfig(
                                isShowing: true, icon: "xmark.circle.fill", message: "오답입니다.", background: Color(.systemRed))
                        }
                        
                        if (solvedQuestions < 5) {
                            solvedQuestions += 1
                            
                            if (solvedQuestions >= 5) {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    quizUiState = QuizUiState.result
                                }
                            } else {
                                selectedAnswer = -1
                                currentQuestion = quizQuestions.randomElement()!
                            }
                        }
                    }
                    .padding(.trailing, 20)
                }
                Spacer()
            case .result:
                NavigationView {
                    VStack {
                        GoogleAdBannerView()
                            .frame(
                                width: UIScreen.main.bounds.width,
                                height: GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth(UIScreen.main.bounds.width).size.height
                            )
                        
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
}

enum QuizUiState {
    case quiz
    case result
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(
            currentQuestion: questions.randomElement()!,
            quizQuestions: questions
        )
    }
}
