//
//  GoogleAdBannerView.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/06.
//

import SwiftUI
import GoogleMobileAds

#if DEBUG
private let adUnitId = "ca-app-pub-3940256099942544/2934735716"
#else
private let adUnitId = "ca-app-pub-5004953701825085/7230776650"
#endif

struct GoogleAdBannerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let bannerSize = GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth(UIScreen.main.bounds.width)
        let banner = GADBannerView(adSize: bannerSize)
        banner.rootViewController = viewController
        viewController.view.addSubview(banner)
        viewController.view.frame = CGRect(origin: .zero, size: bannerSize.size)
        banner.adUnitID = adUnitId
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
