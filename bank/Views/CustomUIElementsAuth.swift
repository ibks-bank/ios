//
//  CustomUIElementsAuth.swift
//  bank
//
//  Created by Yulia Popova on 17/3/2022.
//

import UIKit

final class InputField: UIView, UITextFieldDelegate {

    private struct UIConstants {
        static let height = 25.0
        static let width = 200.0
        
        static let iconWidth = 20.0
        static let iconHeight = 20.0
        
        static let paddingLeft = 28.0
        static let paddingRight = -28.0
        static let paddingBottom = -8.0
        
        static let space = 5.0
        
        static let dividerWidth = 1.0
    }
    
    // MARK: - Public Properties
    
    public lazy var textField = UITextField()
    
    // MARK: - Private Properties
    
    private let icon = UIImageView()
    private let dividerView = UIView()
    
    // MARK: - Initializers
    
    init(labelImage: UIImage? = nil, keyboardType: UIKeyboardType = .default, placeholderText: String) {
        super.init(frame: .zero)
        
        heightAnchor.constraint(equalToConstant: UIConstants.height).isActive = true
        addIcon(labelImage: labelImage)
        addTextfield(placeholderText: placeholderText)
        addDivider()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    // MARK: - Private methods
    
    private func addIcon(labelImage: UIImage? = nil) {
        addSubview(icon)
        icon.image = labelImage
        icon.tintColor = UIColor.AppColors.accentColor
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.widthAnchor.constraint(equalToConstant: UIConstants.iconWidth).isActive = true
        icon.heightAnchor.constraint(equalToConstant: UIConstants.iconHeight).isActive = true
        icon.leftAnchor.constraint(equalTo: leftAnchor, constant: UIConstants.paddingLeft).isActive = true
        icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: UIConstants.paddingBottom).isActive = true
    }
    
    private func addTextfield(placeholderText: String) {
        addSubview(textField)
        textField.autocorrectionType = .no
        textField.placeholder = placeholderText
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false

        textField.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: UIConstants.space).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: UIConstants.paddingRight).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: UIConstants.paddingBottom).isActive = true
    }

    private func addDivider() {
        addSubview(dividerView)
        dividerView.backgroundColor = UIColor.AppColors.accentColor
        dividerView.translatesAutoresizingMaskIntoConstraints = false

        dividerView.heightAnchor.constraint(equalToConstant: UIConstants.dividerWidth).isActive = true
        dividerView.leftAnchor.constraint(equalTo: leftAnchor, constant: UIConstants.paddingLeft).isActive = true
        dividerView.rightAnchor.constraint(equalTo: rightAnchor, constant: UIConstants.paddingRight).isActive = true
        dividerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

final class CustomRoundedButton: UIView {

    private struct UIConstants {
        static let height = 30.0
        static let width = 200.0
    }

    // MARK: - Public Properties
    // MARK: - Private Properties
    public lazy var button = UIButton(type: .system)
    
    // MARK: - Initializers
    init(title: String, target: Any? = nil, action: Selector? = nil) {

        super.init(frame: .zero)

        heightAnchor.constraint(equalToConstant: UIConstants.height).isActive = true

        if let target = target, let action = action {
            button.addTarget(target, action: action, for: .touchUpInside)
        }

        button.layer.cornerRadius = UIConstants.height / 2;
        button.backgroundColor = UIColor.AppColors.accentColor
        button.setTitle(title, for: .normal)
        button.tintColor = .white

        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: UIConstants.width).isActive = true
        button.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    // MARK: - Private methods
}

final class AttributedCustomButton: UIButton {
    private struct UIConstants {
        static let fontSize = 16.0
    }

    // MARK: - Public Properties
    // MARK: - Private Properties
    // MARK: - Initializers
    init(firstPart: String, secondPart: String) {
        super.init(frame: .zero)
        let attributedTitle = NSMutableAttributedString(
            string: firstPart,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: UIConstants.fontSize),
                NSAttributedString.Key.foregroundColor: UIColor.black
            ]
        )
        attributedTitle.append(NSAttributedString(
            string: secondPart,
            attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: UIConstants.fontSize),
                NSAttributedString.Key.foregroundColor: UIColor.AppColors.accentColor
            ]
        ))
        setAttributedTitle(attributedTitle, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    // MARK: - Private methods
}
