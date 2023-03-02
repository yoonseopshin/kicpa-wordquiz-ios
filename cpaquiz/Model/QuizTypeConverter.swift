//
//  QuizTypeConverter.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import Foundation

func toKoreanQuizType(from englishType: TypeEnum) -> String {
    switch englishType {
    case .accounting:
        return "회계학"
    case .business:
        return "경영학"
    case .commercialLaw:
        return "상법"
    case .taxLaw:
        return "세법"
    }
}

func countQuestionsByType(_ questions: [Question], type: TypeEnum) -> Int {
    var count = 0
    for question in questions {
        if question.type == type {
            count += 1
        }
    }
    return count
}
