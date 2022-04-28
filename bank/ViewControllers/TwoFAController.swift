//
//   TwoFAController.swift
//  bank
//
//  Created by Yulia Popova on 18/3/2022.
//

import UIKit
import PopupDialog

class TwoFAController: UIViewController {
    
    var mail: String = ""
    var password: String = ""
    
    private struct UIConstants {
        static let spacing = 40.0
        static let popupCornerRadius : Float = 25.0
        static let blurRadius = 10.0
    }
    
    private lazy var enterCodeLabel : UILabel = {
        let label = UILabel()
        label.text = "Check your e-mail."
        label.textAlignment = .center
        return label
    }()
    
    private lazy var codeInputView = InputField(labelImage: UIImage.AuthIcons.code, placeholderText: AuthStrings.enterCode.rawValue.localized)

    private lazy var submitButton : CustomRoundedButton = {
        let button = CustomRoundedButton(title: AuthStrings.submit.rawValue.localized)
        button.button.addTarget(self, action: #selector(submit), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray6
        configureNavigation()
        configureInputsStackView()
        configurePopUpView()
    }
    
    @objc func submit() {
        guard let code = codeInputView.textField.text else {return}
        AuthService.shared.enterCode(email: mail, password: password, code: code) { (result) in
            switch result {
            case .success:
                let controller = TabBarController()
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
    
    func configureNavigation() {
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = AuthStrings.headerSignIn.rawValue.localized
    }
    
    private func configureInputsStackView() {
        let stack = UIStackView(arrangedSubviews: [enterCodeLabel, codeInputView, submitButton])
        stack.axis = .vertical
        stack.spacing = UIConstants.spacing
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.spacing).isActive = true
        stack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
    
    private func configurePopUpView() {

        let overlayAppearance = PopupDialogOverlayView.appearance()
        overlayAppearance.blurRadius = UIConstants.blurRadius
        overlayAppearance.blurEnabled = true

        let containerAppearance = PopupDialogContainerView.appearance()
        containerAppearance.backgroundColor = UIColor.white
        containerAppearance.cornerRadius = UIConstants.popupCornerRadius

        let dialogAppearance = PopupDialogDefaultView.appearance()
        dialogAppearance.backgroundColor = .white
        dialogAppearance.titleColor = UIColor.AppColors.accentColor
        dialogAppearance.titleTextAlignment = .center
        dialogAppearance.messageColor = UIColor(white: 0.6, alpha: 1)
        dialogAppearance.messageTextAlignment = .center
    }

}
