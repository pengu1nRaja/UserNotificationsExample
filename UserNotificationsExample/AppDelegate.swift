//
//  AppDelegate.swift
//  UserNotificationsExample
//
//  Created by PenguinRaja on 20.10.2021.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let notificationCenter = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let mainVC = MainTableView()
        
        window?.rootViewController = mainVC
        
        requestAuthorization()
        return true
    }
    
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            print("Permission granted: \(granted)")
        }
    }
}

