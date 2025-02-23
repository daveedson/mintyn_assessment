//
//  login_page.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/20/25.
//
import UIKit
import Combine

class LoginViewController: UIViewController {
    
    private let viewModel = LoginViewModel()
    private var cancellables: Set<AnyCancellable> = []

    private let bottomSheetView = UIView()
    private var bottomSheetBottomConstraint: NSLayoutConstraint?

    private let phoneTextField = CustomTextField(placeholder: "Phone Number")
    private let passwordTextField = CustomTextField(placeholder: "Password", isSecure: true)

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        return button
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = .black
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBottomSheet()
        bindViewModel()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func setupUI() {
            view.backgroundColor = .black

            let backButton = UIButton(type: .system)
            backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
            backButton.tintColor = .white
            backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
            view.addSubview(backButton)

            let welcomeLabel = UILabel()
            welcomeLabel.text = "Welcome back, David"
            welcomeLabel.textColor = .white
            welcomeLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
            welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(welcomeLabel)

            let featureGridView = FeatureGrid.createFeatureGrid()
            featureGridView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(featureGridView)

            NSLayoutConstraint.activate([
                backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

                welcomeLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
                welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                featureGridView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
                featureGridView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                featureGridView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                featureGridView.heightAnchor.constraint(equalToConstant: 200)
            ])
        }

    private func setupBottomSheet() {
        bottomSheetView.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        bottomSheetView.layer.cornerRadius = 16
        bottomSheetView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomSheetView)

        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        bottomSheetView.addSubview(phoneTextField)
        bottomSheetView.addSubview(passwordTextField)
        bottomSheetView.addSubview(errorLabel)
        bottomSheetView.addSubview(loginButton)
        bottomSheetView.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            bottomSheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomSheetView.heightAnchor.constraint(equalToConstant: 400),

            phoneTextField.topAnchor.constraint(equalTo: bottomSheetView.topAnchor, constant: 20),
            phoneTextField.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 20),
            phoneTextField.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -20),
            phoneTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            errorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            errorLabel.centerXAnchor.constraint(equalTo: bottomSheetView.centerXAnchor),

            loginButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50),

            activityIndicator.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor),
        ])
    }

    private func bindViewModel() {
        phoneTextField.textPublisher
            .assign(to: \.phoneNumber, on: viewModel)
            .store(in: &cancellables)

        passwordTextField.textPublisher
            .assign(to: \.password, on: viewModel)
            .store(in: &cancellables)

        viewModel.$loginState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                switch state {
                case .idle:
                    self?.errorLabel.isHidden = true
                    self?.loginButton.isEnabled = true
                case .loading:
                    self?.loginButton.setTitle("", for: .normal)
                    self?.activityIndicator.startAnimating()
                    self?.loginButton.isEnabled = false
                case .success:
                    self?.presentHomeScreen()
                case .error(let message):
                    self?.errorLabel.text = message
                    self?.errorLabel.isHidden = false
                    self?.loginButton.isEnabled = true
                }
            }
            .store(in: &cancellables)
    }

    @objc private func handleLogin() {
        viewModel.login()
    }
    
    @objc private func handleBackButton() {
        self.dismiss(animated: true, completion: nil)
    }

    private func presentHomeScreen() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.switchToHomeScreen()
        }
    }

}
