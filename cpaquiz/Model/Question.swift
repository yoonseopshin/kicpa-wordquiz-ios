//
//  Question.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let question = try? JSONDecoder().decode(Question.self, from: jsonData)

import Foundation

// MARK: - QuestionElement
struct Question: Hashable, Codable, Identifiable {
    let id = UUID()
    let year, pid: Int
    let description: String
    let subDescription, questions: [String]
    let answer: Int
    let type: TypeEnum
    let source: Source

    enum CodingKeys: String, CodingKey {
        case year, pid, description
        case subDescription = "sub_description"
        case questions, answer, type, source
    }
}

enum Source: String, Hashable, Codable {
    case cpa = "CPA"
    case cta = "CTA"
}

enum TypeEnum: String, Hashable, Codable {
    case accounting = "Accounting"
    case business = "Business"
    case commercialLaw = "CommercialLaw"
    case taxLaw = "TaxLaw"
}
