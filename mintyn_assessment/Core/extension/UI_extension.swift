//
//  UI_extension.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/20/25.
//

import Foundation
import UIKit

extension UIColor {
    static let gold = UIColor(red: 212/255, green: 175/255, blue: 55/255, alpha: 1.0)
    
    static func goldGradient() -> UIColor {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1.0).cgColor,
            UIColor(red: 212/255, green: 175/255, blue: 55/255, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return UIColor(patternImage: image)
    }
}
