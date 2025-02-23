//
//  BaseView.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/23/25.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let middleButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.view.backgroundColor = .black
        self.tabBar.backgroundColor = .darkGray
        self.tabBar.barTintColor = .black
        self.tabBar.isTranslucent = false 
        setupTabs()
        setupMiddleButton()
    }

    private func setupTabs() {
        let homeVC = UINavigationController(rootViewController: DashboardViewController())
        let investVC = UINavigationController(rootViewController: HomeViewController())
        let transactionsVC = UINavigationController(rootViewController: HomeViewController())
        let settingsVC = UINavigationController(rootViewController: SettingsViewController())

        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        investVC.tabBarItem = UITabBarItem(title: "Invest", image: UIImage(systemName: "chart.bar.fill"), tag: 1)
        transactionsVC.tabBarItem = UITabBarItem(title: "Transactions", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape.fill"), tag: 3)

        self.viewControllers = [homeVC, investVC, UIViewController(), transactionsVC, settingsVC]

        self.tabBar.tintColor = UIColor.systemYellow
        self.tabBar.unselectedItemTintColor = UIColor.white
    }

    private func setupMiddleButton() {
        let buttonSize: CGFloat = 60
        middleButton.frame = CGRect(x: (self.view.bounds.width / 2) - (buttonSize / 2),
                                    y: -20,
                                    width: buttonSize,
                                    height: buttonSize)
        
        middleButton.layer.cornerRadius = 12
        middleButton.clipsToBounds = true
        
        middleButton.setImage(UIImage(systemName: "square.grid.2x2.fill"), for: .normal)
        middleButton.tintColor = .white
        middleButton.backgroundColor = UIColor.systemYellow
        
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.3
        middleButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        middleButton.layer.shadowRadius = 3
        
        middleButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        
        self.tabBar.addSubview(middleButton)
        self.tabBar.bringSubviewToFront(middleButton)
    }


    @objc private func menuButtonTapped() {
        print("Middle button tapped!")
    }
}
