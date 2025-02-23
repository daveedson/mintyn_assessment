//
//  BalanceView.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/23/25.
//

import Foundation
import UIKit

class BalanceView: UIView {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "David Tochukwu Onoh"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let switchAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Switch Account", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return button
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "₦20,000.00"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private let eyeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "eye.fill")
        imageView.tintColor = UIColor.systemYellow
        return imageView
    }()
    
    private let detailsLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(
            string: "Individual • ",
            attributes: [.foregroundColor: UIColor.gray]
        )
        attributedText.append(NSAttributedString(
            string: "1114450290",
            attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 14)]
        ))
        attributedText.append(NSAttributedString(
            string: " • Tier 1 ",
            attributes: [.foregroundColor: UIColor.gray]
        ))
        
        label.attributedText = attributedText
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let tierIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "square.fill")
        imageView.tintColor = UIColor.systemYellow
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(nameLabel)
        addSubview(switchAccountButton)
        addSubview(balanceLabel)
        addSubview(eyeIcon)
        addSubview(detailsLabel)
        addSubview(tierIcon)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        switchAccountButton.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        eyeIcon.translatesAutoresizingMaskIntoConstraints = false
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        tierIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            switchAccountButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            switchAccountButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            switchAccountButton.widthAnchor.constraint(equalToConstant: 120),
            switchAccountButton.heightAnchor.constraint(equalToConstant: 30),
            
            balanceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            balanceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            eyeIcon.leadingAnchor.constraint(equalTo: balanceLabel.trailingAnchor, constant: 8),
            eyeIcon.centerYAnchor.constraint(equalTo: balanceLabel.centerYAnchor),
            eyeIcon.widthAnchor.constraint(equalToConstant: 20),
            eyeIcon.heightAnchor.constraint(equalToConstant: 20),
            
            detailsLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 10),
            detailsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tierIcon.leadingAnchor.constraint(equalTo: detailsLabel.trailingAnchor, constant: 5),
            tierIcon.centerYAnchor.constraint(equalTo: detailsLabel.centerYAnchor),
            tierIcon.widthAnchor.constraint(equalToConstant: 12),
            tierIcon.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
}
