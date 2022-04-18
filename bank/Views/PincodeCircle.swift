//
//  PincodeCircle.swift
//  bank
//
//  Created by Yulia Popova on 18/4/2022.
//

import UIKit

final class PincodeCircle: UIImageView {

    init() {
        super.init(frame: .zero)
        image = UIImage(systemName: "circle")
        tintColor = UIColor.AppColors.accentColor
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
        widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    // MARK: - Private methods
}
