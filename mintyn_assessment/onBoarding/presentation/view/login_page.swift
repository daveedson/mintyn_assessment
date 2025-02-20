//
//  login_page.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/20/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let bottomSheetView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBottomSheet()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        // Back Button
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backButton.tintColor = .white
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        view.addSubview(backButton)
        
        // Welcome Label
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome back, David"
        welcomeLabel.textColor = .white
        welcomeLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        
        // Feature Grid View (if you have a feature grid)
        let featureGridView = FeatureGrid.createFeatureGrid()
        featureGridView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(featureGridView)
        
        NSLayoutConstraint.activate([
            // Back Button
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            // Welcome Label
            welcomeLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Feature Grid View
            featureGridView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            featureGridView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            featureGridView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            featureGridView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupBottomSheet() {
        bottomSheetView.backgroundColor = .black
        bottomSheetView.layer.cornerRadius = 16
        bottomSheetView.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        bottomSheetView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bottomSheetView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(bottomSheetView)
        
        // Create UI elements inside bottom sheet
        let phoneTextField = CustomTextField(placeholder: "Phone Number")
        let passwordTextField = CustomTextField(placeholder: "Password", isSecure: true)
        
        let rememberMeCheckBox = UIButton(type: .system)
        rememberMeCheckBox.setTitle("Remember me", for: .normal)
        rememberMeCheckBox.setTitleColor(.gray, for: .normal)
        rememberMeCheckBox.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        rememberMeCheckBox.translatesAutoresizingMaskIntoConstraints = false
        
        let forgotPasswordButton = UIButton(type: .system)
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.setTitleColor(.systemYellow, for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemYellow
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.layer.cornerRadius = 8
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        let unlockDeviceLabel = UILabel()
        unlockDeviceLabel.text = "Not David?"
        unlockDeviceLabel.textColor = .gray
        unlockDeviceLabel.font = UIFont.systemFont(ofSize: 14)
        unlockDeviceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let unlockDeviceButton = UIButton(type: .system)
        unlockDeviceButton.setTitle("Unlock Device", for: .normal)
        unlockDeviceButton.setTitleColor(.systemYellow, for: .normal)
        unlockDeviceButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        unlockDeviceButton.translatesAutoresizingMaskIntoConstraints = false
        
        let versionLabel = UILabel()
        versionLabel.text = "Version 1.3.94"
        versionLabel.textColor = .gray
        versionLabel.font = UIFont.systemFont(ofSize: 12)
        versionLabel.textAlignment = .center
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding elements to bottom sheet
        bottomSheetView.addSubview(phoneTextField)
        bottomSheetView.addSubview(passwordTextField)
        bottomSheetView.addSubview(rememberMeCheckBox)
        bottomSheetView.addSubview(forgotPasswordButton)
        bottomSheetView.addSubview(loginButton)
        bottomSheetView.addSubview(unlockDeviceLabel)
        bottomSheetView.addSubview(unlockDeviceButton)
        bottomSheetView.addSubview(versionLabel)
        
        NSLayoutConstraint.activate([
            // Bottom Sheet Position
            bottomSheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomSheetView.heightAnchor.constraint(equalToConstant: 450),
            
            // Phone TextField
            phoneTextField.topAnchor.constraint(equalTo: bottomSheetView.topAnchor, constant: 20),
            phoneTextField.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 20),
            phoneTextField.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -20),
            phoneTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            // Password TextField
            passwordTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Remember Me Checkbox
            rememberMeCheckBox.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            rememberMeCheckBox.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 20),
            
            // Forgot Password Button
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -20),
            
            // Login Button
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Unlock Device
           
             unlockDeviceLabel.bottomAnchor.constraint(equalTo: versionLabel.topAnchor, constant: -10),
             unlockDeviceLabel.centerXAnchor.constraint(equalTo: bottomSheetView.centerXAnchor),
             
             // Unlock Device Button
             unlockDeviceButton.leadingAnchor.constraint(equalTo: unlockDeviceLabel.trailingAnchor, constant: 10),
             unlockDeviceButton.centerXAnchor.constraint(equalTo: unlockDeviceLabel.centerXAnchor),
             
             // Version Label
             versionLabel.bottomAnchor.constraint(equalTo: bottomSheetView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
             versionLabel.centerXAnchor.constraint(equalTo: bottomSheetView.centerXAnchor),
            
            // Version Label
            versionLabel.topAnchor.constraint(equalTo: unlockDeviceLabel.bottomAnchor, constant: 15),
            versionLabel.centerXAnchor.constraint(equalTo: bottomSheetView.centerXAnchor)
        ])
    }
    
    @objc private func handleBackButton() {
        dismiss(animated: true, completion: nil)
    }
}
