//
//  custom_textfield.swift
//  mintyn_assessment
//
//  Created by DavidOnoh on 2/20/25.
//

import UIKit
import Combine

class CustomTextField: UITextField {
    private var cancellables = Set<AnyCancellable>()

    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { ($0.object as? UITextField)?.text }
            .eraseToAnyPublisher()
    }

    init(placeholder: String, isSecure: Bool = false) {
        super.init(frame: .zero)
        
        self.isSecureTextEntry = isSecure
        self.textColor = .white
        self.tintColor = .white
        
        self.font = UIFont.systemFont(ofSize: 16)
        self.borderStyle = .roundedRect
        self.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )

        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


