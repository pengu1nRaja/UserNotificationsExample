//
//  MainTableView.swift
//  UserNotificationsExample
//
//  Created by PenguinRaja on 20.10.2021.
//

import UIKit

class MainTableView: UITableViewController {
    
    let reuseIdentifier = "reuseIdentifier"
    
    let notifications = Notifications()
    
    let notificationsType = ["First Notification",
                         "Second Notification",
                         "Third Notification",
                         "Fourth Notification",
                         "Fifth Notification"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return notificationsType.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        cell.textLabel?.text = notificationsType[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.textLabel?.textColor = .systemBlue
        
        let notificationType = notificationsType[indexPath.row]
        
        let alert = UIAlertController(title: notificationType,
                                      message: "After 5 seconds \(notificationType) will appear",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.notifications.scheduleNotification(notificationType: notificationType)
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
