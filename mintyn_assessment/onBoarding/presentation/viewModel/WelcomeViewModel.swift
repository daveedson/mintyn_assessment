//
//  WelcomeViewModel.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/20/25.
//

import Foundation
import UIKit

class WelcomeViewModel {
    var navigateToLogin: (() -> Void)?

    func handleLoginTap() {
        navigateToLogin?()
    }
}
