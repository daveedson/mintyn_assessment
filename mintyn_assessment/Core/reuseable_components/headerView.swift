//
//  headerView.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/23/25.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "mintyn_logo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    private let headsetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "headphones"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    private let bellButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bell.fill"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .black
        
        buttonStackView.addArrangedSubview(searchButton)
        buttonStackView.addArrangedSubview(headsetButton)
        buttonStackView.addArrangedSubview(bellButton)
        
        let mainStackView = UIStackView(arrangedSubviews: [logoImageView, UIView(), buttonStackView])
        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        mainStackView.spacing = 10
        
        addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            logoImageView.widthAnchor.constraint(equalToConstant: 50), // Adjust based on logo size
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            headsetButton.widthAnchor.constraint(equalToConstant: 40),
            headsetButton.heightAnchor.constraint(equalToConstant: 40),
            
            bellButton.widthAnchor.constraint(equalToConstant: 40),
            bellButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
