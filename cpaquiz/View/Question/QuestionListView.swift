//
//  QuestionListView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import SwiftUI

struct QuestionListView: View {
    var questionList: Array<Question>
    
    var body: some View {
        VStack {
            List(questionList) { question in
                QuestionSummaryView(question: question)
            }
        }
    }
}

struct QuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionListView(questionList: questions)
    }
}
