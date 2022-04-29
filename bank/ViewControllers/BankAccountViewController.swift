//
//  BankAccountViewController.swift
//  bank
//
//  Created by Yulia Popova on 29/4/2022.
//

import UIKit

class BankAccountViewController: UIViewController {
    
    var account : BankAccountService.BankAccountResponse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        navigationItem.title = "Профиль"
        print(account)
        
        configureUI()
//        print(account?.currency, account?.id, account.)
    }
    
    private func getCurrencyImage(currency: String) -> UIImage {
        switch currency {
        case "CURRENCY_RUB": return UIImage(systemName: "rublesign.circle")!
        case "CURRENCY_EURO": return UIImage(systemName: "dollarsign.circle")!
        case "CURRENCY_DOLLAR_US": return UIImage(systemName: "eurosign.circle")!
        default: return UIImage(systemName: "nosign")!
        }
    }
    
    private func getCurrencySymbol(currency: String) -> String {
        switch currency {
        case "CURRENCY_RUB": return "₽"
        case "CURRENCY_EURO": return "$"
        case "CURRENCY_DOLLAR_US": return "€"
        default: return ""
        }
    }
    
    private func getCurrencyCode(currency: String) -> String {
        switch currency {
        case "CURRENCY_RUB": return "RUB"
        case "CURRENCY_EURO": return "EUR"
        case "CURRENCY_DOLLAR_US": return "USD"
        default: return ""
        }
    }
    
    func configureUI() {
        
        var iv = UIImageView()
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        let currency = self.account?.currency
        
        iv.image = getCurrencyImage(currency: currency!)
        iv.tintColor = UIColor.systemBlue
        
        
        view.addSubview(iv)
        
        iv.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        iv.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 100).isActive = true
        iv.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let bankAccountLabel = UILabel()
        
        bankAccountLabel.text = "IBKS Bank Account #" + self.account!.id + " " + getCurrencyCode(currency: account!.currency)
        bankAccountLabel.textColor = UIColor.systemGray2
        bankAccountLabel.font = UIFont.systemFont(ofSize: 14.0)
        
        view.addSubview(bankAccountLabel)
        
        bankAccountLabel.topAnchor.constraint(equalTo: iv.bottomAnchor, constant: 20).isActive = true
        bankAccountLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        bankAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let limitLabel = UILabel()
        
        limitLabel.text = self.account!.limit + " " + getCurrencySymbol(currency: currency!)
        limitLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        view.addSubview(limitLabel)
        
        limitLabel.topAnchor.constraint(equalTo: iv.bottomAnchor, constant: 40).isActive = true
        limitLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        limitLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
