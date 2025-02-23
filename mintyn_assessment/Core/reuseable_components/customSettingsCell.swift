//
//  customSettingsCell.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/23/25.
//

import Foundation
import UIKit
class SettingsCell: UITableViewCell {
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func configure(iconName: String, title: String, isDestructive: Bool) {
        backgroundColor = .black
        contentView.backgroundColor = .black 
        
        iconImageView.image = UIImage(systemName: iconName)
        titleLabel.text = title
        
        if isDestructive {
            titleLabel.textColor = .systemRed
            iconImageView.tintColor = .systemRed
        } else {
            titleLabel.textColor = .white
            iconImageView.tintColor = .white
        }
        
        setupLayout()
    }

    private func setupLayout() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(arrowImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            arrowImageView.widthAnchor.constraint(equalToConstant: 15),
            arrowImageView.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
}

