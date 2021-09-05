//
//  AppDelegate.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/07/31.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window:UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        // 계산기 레이아웃
//        window?.rootViewController = ViewController()
        
        // 인증서 레이아웃
//        window?.rootViewController = CertViewController()
        
        // 커스텀키보드
//        window?.rootViewController = CustomKeyboardViewController()
        
        // 커스텀 스위치
//        window?.rootViewController = CustomSwitchViewController()
        
        // 아코디언
//        window?.rootViewController = ExpandableViewController()
        
        // 플로팅버튼
//        window?.rootViewController = FloatingButtonViewController()
        
        // 그래프
//        window?.rootViewController = GraphViewController()

        // 커스텀 뷰
        window?.rootViewController = DiagonalViewController()
        
        window?.makeKeyAndVisible()
        return true
    }
}

