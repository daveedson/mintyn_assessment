//
//  welcome_page.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/20/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let viewModel = WelcomeViewModel()
    private let loginButton = UIButton(type: .system)
    private let createAccountButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()

    }
    
    private func setupBindings() {
           viewModel.navigateToLogin = { [weak self] in
               guard let self = self else { return }
               let loginVC = LoginViewController()
               loginVC.modalPresentationStyle = .fullScreen
               self.present(loginVC, animated: true, completion: nil)
           }
       }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Animate Login Button from Right
        UIView.animate(withDuration: 0.8, delay: 0.2, options: .curveEaseOut, animations: {
            self.loginButton.transform = .identity
            self.createAccountButton.transform = .identity
        })
    }

    private func setupUI() {
        view.backgroundColor = .black
        
       
        let logoImageView = UIImageView(image: UIImage(named: "mintyn_logo"))
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
       
        let bottomSheetView = UIView()
        bottomSheetView.backgroundColor = UIColor(white: 0.1, alpha: 1.0) 
        bottomSheetView.layer.cornerRadius = 20
        bottomSheetView.layer.masksToBounds = true
        view.addSubview(bottomSheetView)
        
      
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to\nMintyn Digital Bank"
        welcomeLabel.textAlignment = .center
        welcomeLabel.numberOfLines = 2
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 22)
        welcomeLabel.textColor = .white
        bottomSheetView.addSubview(welcomeLabel)
        
      
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Get started with the bank that puts you in control."
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 2
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .lightGray
        bottomSheetView.addSubview(descriptionLabel)
        
       
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1.0).cgColor,
            UIColor(red: 212/255, green: 175/255, blue: 55/255, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        gradientLayer.cornerRadius = 10

        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        loginButton.setBackgroundImage(gradientImage, for: .normal)
        bottomSheetView.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        createAccountButton.setTitle("Create account", for: .normal)
        createAccountButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        createAccountButton.setTitleColor(.gold, for: .normal)
        createAccountButton.layer.borderColor = UIColor.gold.cgColor
        createAccountButton.layer.borderWidth = 2
        createAccountButton.layer.cornerRadius = 10
        bottomSheetView.addSubview(createAccountButton)
        
        // Version Label
        let versionLabel = UILabel()
        versionLabel.text = "Mintyn Version 1.3.94"
        versionLabel.font = UIFont.systemFont(ofSize: 12)
        versionLabel.textColor = .lightGray
        versionLabel.textAlignment = .center
        bottomSheetView.addSubview(versionLabel)
        
       
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomSheetView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Logo Positioning
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: bottomSheetView.topAnchor, constant: -70),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
               
            // Bottom Sheet Constraints
            bottomSheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomSheetView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            // Welcome Text
            welcomeLabel.topAnchor.constraint(equalTo: bottomSheetView.topAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -20),
            
            // Description Text
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -20),
            
            // Login Button (Slide in from Right)
            loginButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
          
            createAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            createAccountButton.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 40),
            createAccountButton.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -40),
            createAccountButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Version Label
            versionLabel.bottomAnchor.constraint(equalTo: bottomSheetView.bottomAnchor, constant: -20),
            versionLabel.centerXAnchor.constraint(equalTo: bottomSheetView.centerXAnchor)
        ])
        
        // Initial Off-Screen Position
        loginButton.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        createAccountButton.transform = CGAffineTransform(translationX: -view.frame.width, y: 0)
    }
    
    
    @objc private func loginButtonTapped() {
            viewModel.handleLoginTap()
        }
}
