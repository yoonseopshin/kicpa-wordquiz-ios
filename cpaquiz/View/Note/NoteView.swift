//
//  NoteView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import SwiftUI

struct NoteView: View {
    var body: some View {
        NavigationView {
            QuestionListView(questionList: questions)
                .navigationTitle("노트")
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
