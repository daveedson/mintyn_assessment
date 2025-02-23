//
//  FeatureButtonView.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/23/25.
//

import UIKit

class FeatureButtonView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(icon: UIImage?, title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        setupView(icon: icon, title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(icon: UIImage?, title: String) {
        imageView.image = icon
        titleLabel.text = title
        
        addSubview(imageView)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}

class FeatureButtonsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let budgetIcon = UIImage(named: "budget_icon")
        let easyCollectIcon = UIImage(named: "easycollect_icon")
        let businessIcon = UIImage(named: "business_icon")
        
        let budgetButton = FeatureButtonView(icon: budgetIcon, title: "Budget", backgroundColor: UIColor.systemPurple)
        let easyCollectButton = FeatureButtonView(icon: easyCollectIcon, title: "EasyCollect", backgroundColor: UIColor.systemGreen)
        let businessButton = FeatureButtonView(icon: businessIcon, title: "Business", backgroundColor: UIColor.systemRed)
        
        let stackView = UIStackView(arrangedSubviews: [budgetButton, easyCollectButton, businessButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            budgetButton.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}
