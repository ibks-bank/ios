//
//  MainController.swift
//  bank
//
//  Created by Yulia Popova on 25/3/2022.
//

import UIKit

class BankAccountsViewController: UIViewController {
    
    var service = BankAccountService.shared
    
    private struct UIConstants {
        static let spacing = 40.0
        static let popupCornerRadius : Float = 25.0
        static let blurRadius = 10.0
    }
    
    private lazy var logOutButton : UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Выйти"
        return button
    }()
    
    private lazy var replenishBalanceButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 30.0
        button.setTitle("Пополнить баланс", for: .normal)
        button.addTarget(self, action: #selector(replenishBalance), for: .touchUpInside)
        return button
    }()
    
    private lazy var getTransactionsButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 30.0
        button.setTitle("Транзакции", for: .normal)
        button.addTarget(self, action: #selector(getTransactions), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    }()
    
    var accounts : [BankAccountService.BankAccountResponse] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.service.getBankAccounts { result in
                for account in result {
                    self.accounts.append(account)
                    self.tableView.reloadData()
                }
            }
        }
        
        view.backgroundColor = UIColor.systemBackground
        configureNavigation()
        configureInputsStackView()
        
        print(accounts)
//        service.getBankAccount(accountID: "1") { result in
//            debugPrint(result)
//        }
//
//        service.createBankAccount(currency: "CURRENCY_EURO", limit: "1000", name: "string", completion: { result in
//            debugPrint(result)
//        })
//
//        service.createBankAccount(currency: "CURRENCY_EURO", limit: "1000", name: "string", completion: { result in
//            debugPrint(result)
//        })
//
//        service.createBankAccount(currency: "CURRENCY_DOLLAR_US", limit: "3000", name: "string", completion: { result in
//            debugPrint(result)
//        })
        
    }

    @objc func replenishBalance() {
        print("replenishBalance")
    }
    
    @objc func getTransactions() {
        print("replenishBalance")
    }
    
    func configureNavigation() {
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = AuthStrings.headerSignIn.rawValue.localized
        navigationItem.rightBarButtonItem = logOutButton
    }
    
    private func configureInputsStackView() {
        
        view.addSubview(replenishBalanceButton)
        replenishBalanceButton.translatesAutoresizingMaskIntoConstraints = false
        replenishBalanceButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0).isActive = true
        replenishBalanceButton.rightAnchor.constraint(equalTo: view.leftAnchor, constant: (view.frame.size.width / 2) - 5.0).isActive = true
        replenishBalanceButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
        replenishBalanceButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        
        view.addSubview(getTransactionsButton)
        getTransactionsButton.translatesAutoresizingMaskIntoConstraints = false
        getTransactionsButton.leftAnchor.constraint(equalTo: view.rightAnchor, constant: -1 * (view.frame.size.width / 2) + 5.0).isActive = true
        getTransactionsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0).isActive = true
        getTransactionsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
        getTransactionsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rowHeight = 40.0
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
}

extension BankAccountsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 90
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 12.0)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12.0)
        cell.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.02)
        
        var view = UIView()
        view.layer.cornerRadius = 30.0

        cell.addSubview(view)
        
        view.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10).isActive = true
        view.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10).isActive = true
        view.topAnchor.constraint(equalTo: cell.topAnchor, constant: 10).isActive = true
        view.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -10).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false

        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize.init(width: 0, height: 2)
        view.layer.shadowColor = UIColor.systemGray.cgColor
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.4
        
        if indexPath.row != 0 {
            
            view.backgroundColor = UIColor.systemGray6
            
            var iv = UIImageView()
            
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            
            let currency = self.accounts[indexPath.row - 1].currency
            
            iv.image = getCurrencyImage(currency: currency)
            iv.tintColor = UIColor.systemBlue
            
            
            cell.addSubview(iv)
            
            iv.topAnchor.constraint(equalTo: cell.topAnchor, constant: 30).isActive = true
            iv.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -30).isActive = true
            iv.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 30).isActive = true
            iv.trailingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 60).isActive = true
            
            let bankAccountLabel = UILabel()
            
            bankAccountLabel.text = "IBKS Bank Account #" + self.accounts[indexPath.row - 1].id + " " + getCurrencyCode(currency: currency)
            bankAccountLabel.textColor = UIColor.systemGray2
            bankAccountLabel.font = UIFont.systemFont(ofSize: 14.0)
            
            cell.addSubview(bankAccountLabel)
            
            bankAccountLabel.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 10).isActive = true
            bankAccountLabel.leadingAnchor.constraint(equalTo: iv.trailingAnchor, constant: 10).isActive = true
            bankAccountLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let limitLabel = UILabel()
            
            limitLabel.text = self.accounts[indexPath.row - 1].limit + " " + getCurrencySymbol(currency: currency)
            limitLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
            
            cell.addSubview(limitLabel)
            
            limitLabel.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: -10).isActive = true
            limitLabel.leadingAnchor.constraint(equalTo: iv.trailingAnchor, constant: 10).isActive = true
            limitLabel.translatesAutoresizingMaskIntoConstraints = false
            
            cell.textLabel?.leadingAnchor.constraint(equalTo: cell.imageView!.trailingAnchor, constant: 50).isActive = true

        } else {
            
            view.backgroundColor = UIColor.systemGray6
            
            var label = UILabel()
            label.text = "Открыть новый счет"
            label.textColor = UIColor.systemBlue
            label.font = UIFont.boldSystemFont(ofSize: 18.0)
            cell.addSubview(label)
            
            label.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            label.translatesAutoresizingMaskIntoConstraints = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            var controller = NewBankAccountViewController()
            self.navigationController?.pushViewController(controller, animated: false)
            self.dismiss(animated: true, completion: nil)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
