//
//  loginViewModel.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/23/25.
//

import Combine
import Foundation

enum LoginState {
    case idle
    case loading
    case success
    case error(String)
}

class LoginViewModel: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var loginState: LoginState = .idle

    private var cancellables = Set<AnyCancellable>()

    init() {
        setupValidation()
    }

    private func setupValidation() {
        Publishers.CombineLatest($phoneNumber, $password)
            .map { !$0.isEmpty && !$1.isEmpty }
            .sink { [weak self] isValid in
                if !isValid {
                    self?.loginState = .error("Both fields are required")
                } else {
                    self?.loginState = .idle
                }
            }
            .store(in: &cancellables)
    }

    func login() {
        guard !phoneNumber.isEmpty, !password.isEmpty else {
            loginState = .error("Phone number and password cannot be empty")
            return
        }
        
        isLoading = true
        loginState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            self.isLoading = false
            
            // Mock authentication
            if self.phoneNumber == "1234567890" && self.password == "password" {
                self.loginState = .success
            } else {
                self.loginState = .error("Invalid credentials")
            }
        }
    }
}

