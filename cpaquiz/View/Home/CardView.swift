//
//  CardView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import SwiftUI

struct CardView: View {
    let quizType: TypeEnum
    let subtypes: [String]
    @State var selectedSubtypes: [String]
    @State private var showQuizSheet = false
    @State private var showSubtypeAlert = false
    
    var body: some View {
        let title: String = toKoreanQuizType(from: quizType)
        let description: String = "총 \(filterQuestions(by: quizType, from: questions).count)문제"
        VStack {
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
                if (subtypes.isEmpty || !selectedSubtypes.isEmpty) {
                    showQuizSheet = true
                    showSubtypeAlert = false
                } else {
                    showQuizSheet = false
                    showSubtypeAlert = true
                }
            }
            .sheet(isPresented: $showQuizSheet) {
                let quizQuestions = filterQuestions(by: quizType, from: questions)
                
                let filteredQuestionsBySubtypes = quizQuestions.filter { question in
                    selectedSubtypes.contains(question.subtype)
                }
                
                QuizView(
                    // FIXME: To be stored to local storage
                    quizSize: 10,
                    currentQuestion:
                        filteredQuestionsBySubtypes.isEmpty ? quizQuestions.randomElement()! :
                        filteredQuestionsBySubtypes.randomElement()!,
                    quizQuestions:
                        filteredQuestionsBySubtypes.isEmpty ?
                    quizQuestions :
                        filteredQuestionsBySubtypes
                )
                .padding(.top, 20)
                
            }
            
            if !subtypes.isEmpty {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(subtypes, id: \.self) { subtype in
                                Text(subtype)
                                    .padding(10)
                                    .font(.footnote)
                                    .foregroundColor(selectedSubtypes.contains(subtype) ? .white : .primary)
                                    .background(selectedSubtypes.contains(subtype) ? Color(.systemBlue) : Color(.secondarySystemBackground))
                                    .clipShape(Capsule())
                                    .shadow(radius: 2)
                                    .onTapGesture {
                                        if (selectedSubtypes.contains(subtype)) {
                                            selectedSubtypes = selectedSubtypes.filter { $0 != subtype }
                                        } else {
                                            selectedSubtypes.append(subtype)
                                        }
                                    }
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .alert("\(title)의 세부 분류를 선택하세요.", isPresented: $showSubtypeAlert) {
                    Button("확인") {}
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(quizType: TypeEnum.commercialLaw, subtypes: ["어음수표법", "회사법", "상행위"], selectedSubtypes: ["회사법"])
    }
}
