//
//  AppDelegate.swift
//  SensorRx
//
//  Created by Ray on 2022/9/21.
//

import UIKit
import SensorsAnalyticsSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let config = SAConfigOptions.init(serverURL:"https://sensors-datasink.wsecar.com/sa?project=default", launchOptions: launchOptions);
        config.enableLog = true
        config.autoTrackEventType = SensorsAnalyticsAutoTrackEventType(rawValue: SensorsAnalyticsAutoTrackEventType.eventTypeAppStart.rawValue | SensorsAnalyticsAutoTrackEventType.eventTypeAppEnd.rawValue | SensorsAnalyticsAutoTrackEventType.eventTypeAppClick.rawValue)
        
        SensorsAnalyticsSDK.start(configOptions: config)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

