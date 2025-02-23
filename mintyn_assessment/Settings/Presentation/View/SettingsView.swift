//
//  SettingsView.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/23/25.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)

    private let settingsData: [(icon: String, title: String, isDestructive: Bool)] = [
        ("person", "Profile", false),
        ("folder", "Account Management", false),
        ("megaphone", "Referrals", false),
        ("shield", "Legal", false),
        ("clock", "Help and Support", false),
        ("iphone", "System", false),
        ("arrow.2.circlepath", "Create Business Account", false),
        ("arrow.uturn.left", "Logout", true)     ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI() {
        view.backgroundColor = .black
        
       
        let titleLabel = UILabel()
        titleLabel.text = "Settings"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        navigationItem.titleView = titleLabel  // Centering the title
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    
    // MARK: - UITableView Delegate & DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsCell
        let item = settingsData[indexPath.row]
        cell.configure(iconName: item.icon, title: item.title, isDestructive: item.isDestructive)
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let spacerView = UIView()
        spacerView.backgroundColor = .black
        return spacerView
    }

    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }

}
