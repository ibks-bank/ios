//
//  NumberButton.swift
//  bank
//
//  Created by Yulia Popova on 18/4/2022.
//

import UIKit

final class NumberButton: UIView {

    private struct UIConstants {
        static let height = 80.0
        static let width = 80.0
        static let textSize = 30.0
    }

    // MARK: - Public Properties
    // MARK: - Private Properties
    public lazy var button = UIButton(type: .system)
    
    
    private let icon = UIImageView()

    // MARK: - Initializers
    init(title: String = "", imageName: String = "", target: Any? = nil, action: Selector? = nil) {

        super.init(frame: .zero)

        heightAnchor.constraint(equalToConstant: UIConstants.height).isActive = true
        layer.masksToBounds = false
        layer.shadowOffset = CGSize.init(width: 0, height: 2)
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.4
        
        if let target = target, let action = action {
            button.addTarget(target, action: action, for: .touchUpInside)
        }

        button.layer.cornerRadius = UIConstants.height / 2;
        button.backgroundColor = UIColor.AppColors.accentColor
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: UIConstants.textSize)
        button.tintColor = .white

        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: UIConstants.width).isActive = true
        button.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        if imageName != "" {
            addSubview(icon)
            icon.image = UIImage(systemName: imageName)
            icon.tintColor = UIColor.white
            icon.translatesAutoresizingMaskIntoConstraints = false
            icon.widthAnchor.constraint(equalToConstant: UIConstants.textSize).isActive = true
            icon.heightAnchor.constraint(equalToConstant: UIConstants.textSize).isActive = true
            icon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            icon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    // MARK: - Private methods
}
