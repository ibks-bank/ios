//
//  MainController.swift
//  bank
//
//  Created by Yulia Popova on 25/3/2022.
//

import UIKit

class MainController: UIViewController {
    
    private struct UIConstants {
        static let spacing = 40.0
        static let popupCornerRadius : Float = 25.0
        static let blurRadius = 10.0
    }
    
    private lazy var enterCodeLabel : UILabel = {
        let label = UILabel()
        label.text = "MainController"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigation()
        configureInputsStackView()
        
        AuthService.shared.getData() { (result) in
            debugPrint(result)
        }
        
    }

    
    func configureNavigation() {
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = AuthStrings.headerSignIn.rawValue.localized
    }
    
    private func configureInputsStackView() {
        let stack = UIStackView(arrangedSubviews: [enterCodeLabel])
        stack.axis = .vertical
        stack.spacing = UIConstants.spacing
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.spacing).isActive = true
        stack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }

}
