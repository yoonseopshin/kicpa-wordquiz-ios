//
//  GoogleAdBannerView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/06.
//

import SwiftUI
import GoogleMobileAds

struct GoogleAdBannerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let bannerSize = GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth(UIScreen.main.bounds.width)
        let banner = GADBannerView(adSize: bannerSize)
        banner.rootViewController = viewController
        viewController.view.addSubview(banner)
        viewController.view.frame = CGRect(origin: .zero, size: bannerSize.size)
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        banner.load(GADRequest())
        return viewController
    }
    func updateUIViewController(_ viewController: UIViewController, context: Context) {
        
    }
}
struct GoogleAdBannerView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleAdBannerView()
    }
}
