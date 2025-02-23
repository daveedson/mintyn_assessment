//
//  TransactionButtonView.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/23/25.
//

import Foundation
import UIKit


class TransactionButtonsView: UIView {
    
    // MARK: - Properties
    var onAddMoneyTap: (() -> Void)?
    var onTransferTap: (() -> Void)?
    
    // MARK: - UI Elements
    private let addMoneyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(" Add Money", for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)

        let icon = UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate)
        button.setImage(icon, for: .normal)
        button.tintColor = .white

        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let transferButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(" Transfer", for: .normal)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.black, for: .normal)

        let icon = UIImage(systemName: "arrow.left.arrow.right")?.withRenderingMode(.alwaysTemplate)
        button.setImage(icon, for: .normal)
        button.tintColor = .black

        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    private func setupView() {
        addSubview(addMoneyButton)
        addSubview(transferButton)
        
        NSLayoutConstraint.activate([
            addMoneyButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            addMoneyButton.trailingAnchor.constraint(equalTo: transferButton.leadingAnchor, constant: -15),
            addMoneyButton.heightAnchor.constraint(equalToConstant: 50),
            addMoneyButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            transferButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            transferButton.heightAnchor.constraint(equalToConstant: 50),
            transferButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            addMoneyButton.widthAnchor.constraint(equalTo: transferButton.widthAnchor)
        ])
    }
    
    private func setupActions() {
        addMoneyButton.addTarget(self, action: #selector(addMoneyTapped), for: .touchUpInside)
        transferButton.addTarget(self, action: #selector(transferTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func addMoneyTapped() {
        onAddMoneyTap?()
    }
    
    @objc private func transferTapped() {
        onTransferTap?()
    }
}
