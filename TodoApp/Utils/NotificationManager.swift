//
//  NotificationManager.swift
//  TodoApp
//
//  Created by Esteban SEMELLIER on 29/04/2023.
//

import Foundation
import UserNotifications

protocol INotificationManager {
    var handleNotification: ((UNNotification) -> Void)? { get }
    func requestPermission(completionHandler: @escaping (Bool, Error?) -> Void)
    func scheduleNotification(id: String, content: UNNotificationContent, trigger: UNNotificationTrigger)
    func removePendingNotification(id: String)
}

class NotificationManager: NSObject, UNUserNotificationCenterDelegate, INotificationManager {
    let notificationCenter: UNUserNotificationCenter
    var handleNotification: ((UNNotification) -> Void)?
    
    init(handleNotification: ((UNNotification) -> Void)? = nil) {
        self.notificationCenter = UNUserNotificationCenter.current()
        self.handleNotification = handleNotification
    }
    
    func requestPermission(completionHandler: @escaping (Bool, Error?) -> Void) {
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { isGranted, error in
            completionHandler(isGranted, error)
        }
    }
    
    func scheduleNotification(id: String, content: UNNotificationContent, trigger: UNNotificationTrigger) {
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        notificationCenter.add(request)
    }
    
    func removePendingNotification(id: String) {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [id])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> ()) {
        completionHandler([.banner, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> ()) {
        if let handler = self.handleNotification  {
            handler(response.notification)
        }
        completionHandler()
    }
}



