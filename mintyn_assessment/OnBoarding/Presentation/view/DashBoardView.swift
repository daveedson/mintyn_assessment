//
//  DashBoardView.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/23/25.
//

import UIKit

class DashboardViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        
        setupScrollView()
        setupUI()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.backgroundColor = .black
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupUI() {
        let headerView = HeaderView()
        let balanceView = BalanceView()
        let transactionButtonsView = TransactionButtonsView()
        let featureButtonsView = FeatureButtonsView()
        let quickAccessViewController = QuickAccessViewController()
        let quickAccessLabel = UILabel()
        
        contentView.addSubview(headerView)
        contentView.addSubview(balanceView)
        contentView.addSubview(transactionButtonsView)
        contentView.addSubview(featureButtonsView)
        contentView.addSubview(quickAccessLabel)
        
        addChild(quickAccessViewController)
        contentView.addSubview(quickAccessViewController.view)
        quickAccessViewController.view.translatesAutoresizingMaskIntoConstraints = false
        quickAccessViewController.didMove(toParent: self)
        
       
        quickAccessLabel.text = "Quick Access"
        quickAccessLabel.textColor = .white
        quickAccessLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        quickAccessLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        transactionButtonsView.translatesAutoresizingMaskIntoConstraints = false
        featureButtonsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -7),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 80),
            
            balanceView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            balanceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            balanceView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            balanceView.heightAnchor.constraint(equalToConstant: 120),
            
            transactionButtonsView.topAnchor.constraint(equalTo: balanceView.bottomAnchor, constant: 50),
            transactionButtonsView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            transactionButtonsView.widthAnchor.constraint(equalToConstant: 300),
            transactionButtonsView.heightAnchor.constraint(equalToConstant: 50),
            
            featureButtonsView.topAnchor.constraint(equalTo: transactionButtonsView.bottomAnchor, constant: 50),
            featureButtonsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            featureButtonsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            featureButtonsView.heightAnchor.constraint(equalToConstant: 120),
            
            quickAccessLabel.topAnchor.constraint(equalTo: featureButtonsView.bottomAnchor, constant: 30),
            quickAccessLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            quickAccessViewController.view.topAnchor.constraint(equalTo: quickAccessLabel.bottomAnchor, constant: 10),
            quickAccessViewController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            quickAccessViewController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            quickAccessViewController.view.heightAnchor.constraint(equalToConstant: 200),
            quickAccessViewController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
