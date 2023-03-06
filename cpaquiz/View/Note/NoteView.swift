//
//  NoteView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import SwiftUI
import GoogleMobileAds

struct NoteView: View {
    var body: some View {
        NavigationView {
            VStack {
                GoogleAdBannerView()
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth(UIScreen.main.bounds.width).size.height
                    )
                
                QuestionListView(
                    questionList: questions,
                    listHeaderTitle: "전체문제"
                )
                    .navigationTitle("노트")
            }
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
