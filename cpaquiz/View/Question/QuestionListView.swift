//
//  QuestionListView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import SwiftUI

struct QuestionListView: View {
    var questionList: Array<Question>
    var listHeaderTitle: String
    
    var body: some View {
        VStack {
            List {
                Section(header: HStack {
                    Text(listHeaderTitle)
                        .font(.title2)
                        .foregroundColor(Color(.label))
                    
                    Text("\(questionList.count)")
                        .padding(4)
                        .font(.footnote)
                        .foregroundColor(.white)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                    
                    Spacer()
                }
                    .padding(.vertical, 8)
                    .frame(minWidth:0, maxWidth: .infinity)                    
                ) {
                    ForEach(questionList) { question in
                        QuestionSummaryView(question: question)
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct QuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionListView(questionList: questions, listHeaderTitle: "전체문제")
    }
}
