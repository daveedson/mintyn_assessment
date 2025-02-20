//
//  ViewController.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/20/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let welcomeVC = WelcomeViewController()
            welcomeVC.modalPresentationStyle = .fullScreen
            present(welcomeVC, animated: true, completion: nil)
    }


}

