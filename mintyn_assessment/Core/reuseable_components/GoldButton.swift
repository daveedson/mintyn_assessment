//
//  GoldButton.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/20/25.
//

import UIKit

class GoldButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.backgroundColor = UIColor.goldGradient() 
    }
}

