//
//  RegistrationController.swift
//  bank
//
//  Created by Yulia Popova on 17/3/2022.
//

import UIKit
import PopupDialog

class RegistrationController: UIViewController {

    private struct UIConstants {
        static let spacing = 10.0
    }

    // MARK: - Public Property
    // MARK: - Private Property
    private lazy var envelopeInputView = InputField(labelImage: UIImage.AuthIcons.envelopeIcon, placeholderText: AuthStrings.email.rawValue.localized)
    
    private lazy var passwordInputView : InputField = {
        lazy var passwordInput = InputField(labelImage: UIImage.AuthIcons.lockIcon, placeholderText: AuthStrings.password.rawValue.localized)
        passwordInput.textField.isSecureTextEntry = true
        return passwordInput
    }()
    
    private lazy var retypePasswordInputView : InputField = {
        let retypePasswordInput = InputField(labelImage: UIImage.AuthIcons.lockIcon, placeholderText: AuthStrings.retypePassword.rawValue.localized)
        retypePasswordInput.textField.isSecureTextEntry = true
        return retypePasswordInput
    }()
    
    private lazy var pasportSeries = InputField(labelImage: UIImage.AuthIcons.personIcon, placeholderText: AuthStrings.pasportSeries.rawValue.localized)
    
    private lazy var pasportNumber = InputField(labelImage: UIImage.AuthIcons.personIcon, placeholderText: AuthStrings.pasportNumber.rawValue.localized)
    
    private lazy var fullName = InputField(labelImage: UIImage.AuthIcons.personIcon, placeholderText: AuthStrings.fullName.rawValue.localized)
    
    private lazy var issuedBy = InputField(labelImage: UIImage.AuthIcons.personIcon, placeholderText: AuthStrings.issuedBy.rawValue.localized)
    
    private lazy var issuedAt = InputField(labelImage: UIImage.AuthIcons.personIcon, placeholderText: AuthStrings.issuedAt.rawValue.localized)
    
    private lazy var address = InputField(labelImage: UIImage.AuthIcons.personIcon, placeholderText: AuthStrings.address.rawValue.localized)
    
    private lazy var place = InputField(labelImage: UIImage.AuthIcons.personIcon, placeholderText: AuthStrings.place.rawValue.localized)
    
    private lazy var date = InputField(labelImage: UIImage.AuthIcons.personIcon, placeholderText: AuthStrings.date.rawValue.localized)
    
    
    private lazy var registerButton : CustomRoundedButton = {
        let button = CustomRoundedButton(title: AuthStrings.signUp.rawValue.localized)
        button.button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    private lazy var signInButton = AttributedCustomButton(firstPart: AuthStrings.alreadySignedUp.rawValue.localized, secondPart: AuthStrings.signIn.rawValue.localized)

    // MARK: - Public Methods
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.hidesBarsOnSwipe = true
        view.backgroundColor = .white
        navigationItem.title = AuthStrings.headerSignUp.rawValue.localized
        view.backgroundColor = .white
        configureInputsStackView()
    }
    
    @objc func signUp() {
        guard let email = envelopeInputView.textField.text else {return}
                guard let password = passwordInputView.textField.text else {return}
        AuthService.shared.signUp(email: email, password: password) { (result) in
            switch result {
            case .success:
                let controller = TwoFAController()
                self.navigationController?.pushViewController(controller, animated: true)

            case .failure(let error):

                let title = AuthStrings.signInUnsuccessful.rawValue.localized
                let message = error.localizedDescription

                lazy var popup : PopupDialog = {
                   let pop = PopupDialog(title: title, message: message)
                    let button = CancelButton(title: AuthStrings.accept.rawValue.localized) {}
                    pop.addButton(button)
                    return pop
                }()

                self.present(popup, animated: true, completion: nil)
            }
        }
    }

    // MARK: - Private Methods
    private func configureInputsStackView() {
        let stack = UIStackView(arrangedSubviews: [envelopeInputView, passwordInputView, retypePasswordInputView, pasportSeries, pasportNumber, fullName, issuedAt, issuedBy, address, place, date, registerButton, signInButton])
        stack.axis = .vertical
        stack.spacing = UIConstants.spacing
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.spacing).isActive = true
        stack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
}
