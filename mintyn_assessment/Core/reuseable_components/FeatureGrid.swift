//
//  FeatureGrid.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/20/25.
//

import Foundation
import UIKit
class FeatureGrid{
    static  func createFeatureGrid() -> UIStackView {
        let features = [
            ("EasyCollect", "shield.fill"),
            ("Open an Account", "shield.fill"),
            ("CAC Business Registration", "doc.fill"),
            ("Contact Support", "person.crop.circle.fill.badge.questionmark")
        ]

        let gridStack = UIStackView()
        gridStack.axis = .vertical
        gridStack.spacing = 15
        gridStack.distribution = .fillEqually

        for i in stride(from: 0, to: features.count, by: 2) {
            let rowStack = UIStackView()
            rowStack.axis = .horizontal
            rowStack.spacing = 10
            rowStack.distribution = .fillEqually

            let firstFeature = FeatureButton.createFeatureButton(title: features[i].0, iconName: features[i].1)
            rowStack.addArrangedSubview(firstFeature)

            if i + 1 < features.count {
                let secondFeature =  FeatureButton.createFeatureButton(title: features[i + 1].0, iconName: features[i + 1].1)
                rowStack.addArrangedSubview(secondFeature)
            }

            gridStack.addArrangedSubview(rowStack)
        }

        return gridStack
    }
}
