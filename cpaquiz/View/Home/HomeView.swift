//
//  HomeView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import SwiftUI

struct HomeView: View {
    let cardColumns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
    let cards = [
        CardView(title: toKoreanQuizType(from: TypeEnum.accounting), description: "총 \(countQuestionsByType(questions, type: TypeEnum.accounting))문제"),
        CardView(title: toKoreanQuizType(from: TypeEnum.business), description: "총 \(countQuestionsByType(questions, type: .business))문제"),
        CardView(title: toKoreanQuizType(from: TypeEnum.commercialLaw), description: "총 \(countQuestionsByType(questions, type: .commercialLaw))문제"),
        CardView(title: toKoreanQuizType(from: TypeEnum.taxLaw), description: "총 \(countQuestionsByType(questions, type: .taxLaw))문제"),
    ]
    // FIXME: fetch from network
    let dday = calculateDDay(targetDateString: "2024-02-25")
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    LazyVGrid(columns: cardColumns, spacing: 16) {
                        ForEach(cards, id: \.title) { card in
                            card.aspectRatio(0.75, contentMode: .fit)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 32)
            }
            .navigationTitle(dday)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
