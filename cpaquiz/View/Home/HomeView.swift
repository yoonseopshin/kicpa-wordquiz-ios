//
//  HomeView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/01.
//

import SwiftUI
import GoogleMobileAds

struct HomeView: View {
    let cardColumns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
    let cards = [
        CardView(quizType: TypeEnum.accounting),
        CardView(quizType: TypeEnum.business),
        CardView(quizType: TypeEnum.commercialLaw),
        CardView(quizType: TypeEnum.taxLaw)
    ]
    // FIXME: fetch from network
    let dday = calculateDDay(targetDateString: "2024-02-25")
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    GoogleAdBannerView()
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth(UIScreen.main.bounds.width).size.height
                        )
                    
                    LazyVGrid(columns: cardColumns, spacing: 16) {
                        ForEach(cards, id: \.quizType) { card in
                            card.aspectRatio(1.66, contentMode: .fit)
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
