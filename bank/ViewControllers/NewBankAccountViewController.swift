//
//  NewBankAccountViewController.swift
//  bank
//
//  Created by Yulia Popova on 18/4/2022.
//

import UIKit

class NewBankAccountViewController: UIViewController {

    private lazy var rublesCurrencyAccount : UIView = {
        
        var v = UIView()
                
//        var iv = UIImageView()
//        iv.image = UIImage(systemName: "rublesign.square.fill")
//        iv.tintColor = UIColor.black
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.contentMode = .scaleAspectFit
//        iv.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
//        iv.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        v.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        v.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        
//        v.addSubview(iv)
//
//        iv.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
//        iv.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
        
        
        var button = UIButton()
        v.addSubview(button)

        button.backgroundColor = UIColor.green
        button.frame.size.height = 100.0
        button.frame.size.width = 100.0
        button.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        button.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(rub(_:)), for: .touchUpInside)
        
        return v
    }()
    
    var euroCurrencyAccount : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(systemName: "eurosign.square")
        iv.tintColor = UIColor.black
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        return iv
    }()
    
    var dollarCurrencyAccount : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(systemName: "dollarsign.square")
        iv.tintColor = UIColor.black
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Create new Bank Account"

        var stack = UIStackView(arrangedSubviews: [rublesCurrencyAccount, euroCurrencyAccount, dollarCurrencyAccount])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func rub(_ sender: UIButton) {
        print("rub")
    }
}
