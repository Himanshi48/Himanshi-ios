//
//  AppDelegate.swift
//  AppEventCount
//
//  Created by Himanshi Godara on 03/09/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var launchCount = 0
    var configurationForConnectingCount = 0

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        launchCount += 1
        return true
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        configurationForConnectingCount += 1
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
