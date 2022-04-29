//
//  NewBankAccountViewController.swift
//  bank
//
//  Created by Yulia Popova on 18/4/2022.
//

import UIKit
import PopupDialog

class NewBankAccountViewController: UIViewController {

//    private lazy var rublesCurrencyAccount : UIView = {
//
//        var v = UIView()
//
////        var iv = UIImageView()
////        iv.image = UIImage(systemName: "rublesign.square.fill")
////        iv.tintColor = UIColor.black
////        iv.translatesAutoresizingMaskIntoConstraints = false
////        iv.contentMode = .scaleAspectFit
////        iv.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
////        iv.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
//        v.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
//        v.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
//
//        var iv = UIImageView()
//        iv.image = UIImage(systemName: "rublesign.square")
//        iv.tintColor = UIColor.white
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.contentMode = .scaleAspectFit
//
//        iv.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
//        iv.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
//
//        v.addSubview(iv)
//
//        iv.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
//        iv.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
//
//        var button = UIButton()
//        v.addSubview(button)
//
//        button.frame.size.height = 100.0
//        button.frame.size.width = 100.0
//        button.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
//        button.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
//        button.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
//        button.addTarget(self, action: #selector(rub(_:)), for: .touchUpInside)
//
//        return v
//    }()
//
//    var euroCurrencyAccount : UIView = {
//
//        var v = UIView()
//
//        v.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
//        v.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
//
//        var iv = UIImageView()
//        iv.image = UIImage(systemName: "eurosign.square")
//        iv.tintColor = UIColor.white
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.contentMode = .scaleAspectFit
//
//        iv.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
//        iv.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
//
//        v.addSubview(iv)
//
//        iv.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
//        iv.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
//
//        var button = UIButton()
//        v.addSubview(button)
//
//        button.frame.size.height = 100.0
//        button.frame.size.width = 100.0
//        button.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
//        button.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
//        button.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
//        button.addTarget(self, action: #selector(euro(_:)), for: .touchUpInside)
//
//        return v
//    }()
//
//    var dollarCurrencyAccount : UIView = {
//
//        var v = UIView()
//
//        v.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
//        v.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
//
//        var iv = UIImageView()
//        iv.image = UIImage(systemName: "dollarsign.square")
//        iv.tintColor = UIColor.white
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.contentMode = .scaleAspectFit
//
//        iv.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
//        iv.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
//
//        v.addSubview(iv)
//
//        iv.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
//        iv.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
//
//        var button = UIButton()
//        v.addSubview(button)
//
//        button.frame.size.height = 100.0
//        button.frame.size.width = 100.0
//        button.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
//        button.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
//        button.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
//        button.addTarget(self, action: #selector(dollar(_:)), for: .touchUpInside)
//
//        return v
//    }()

    private var service = BankAccountService.shared
    
    private lazy var accountNameInputView : InputField = {
        let inputField = InputField(labelImage: UIImage(systemName: "signature"), placeholderText: "Enter account name")
        inputField.textField.keyboardType = .asciiCapable
        inputField.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        return inputField
    }()
    
    private lazy var limitInputView : InputField = {
        let inputField = InputField(labelImage: UIImage(systemName: "pencil"), placeholderText: "Enter limit")
        inputField.textField.keyboardType = .numberPad
        inputField.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        return inputField
    }()
    
    private lazy var signInButton : CustomRoundedButton = {
        let button = CustomRoundedButton(title: "Add new account")
        button.button.addTarget(self, action: #selector(addNewAccount), for: .touchUpInside)
        return button
    }()
    
    @objc func addNewAccount() {
        
        
        
        let limit = limitInputView.textField.text!
        
        let accountName = accountNameInputView.textField.text!
        
        print(limit, accountName)
        
        service.createBankAccount(currency: "CURRENCY_RUB", limit: limit, name: accountName) { result in
            switch result {
            case .success:
                let title = "Bank account was created!"

                let controller = BankAccountsViewController()
                self.navigationController?.pushViewController(controller, animated: true)
                
                lazy var popup : PopupDialog = {
                   let pop = PopupDialog(title: title, message: nil)
                    let button = CancelButton(title: "Accept") {
                        let controller = BankAccountsViewController()
                        self.present(controller, animated: false)
                    }
                    pop.addButton(button)
                    return pop
                }()

                self.present(popup, animated: true, completion: nil)
            case .failure(let error):
                let title = "Error!"
                let message = "Bank account wasn't created!"
                lazy var popup : PopupDialog = {
                   let pop = PopupDialog(title: title, message: message)
                    let button = CancelButton(title: "OK") {}
                    pop.addButton(button)
                    return pop
                }()

                self.present(popup, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        title = "Create new Bank Account"

        var verticalStack = UIStackView(arrangedSubviews: [accountNameInputView, limitInputView, signInButton])
        verticalStack.axis = .vertical
        verticalStack.alignment = .center
        verticalStack.spacing = 30.0
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(verticalStack)
        
        verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        verticalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func rub(_ sender: UIButton) {
        print("rub")
    }
    
    @objc func dollar(_ sender: UIButton) {
        print("dollar")
    }
    
    @objc func euro(_ sender: UIButton) {
        print("euro")
    }
}
