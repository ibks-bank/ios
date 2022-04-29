//
//  ProfileViewController.swift
//  bank
//
//  Created by Yulia Popova on 28/4/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var service = AuthService.shared
    
    var profilePicture : UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(systemName: "person.circle")
        iv.tintColor = UIColor.systemBlue
        iv.backgroundColor = UIColor.systemGray6
        iv.layer.cornerRadius = 50.0
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    var fistNameLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        return label
    }()
    
    var middleNameLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        return label
    }()
    
    var lastNameLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        return label
    }()
    
    var addressLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    var birthdateLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    var birthplaceLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        navigationItem.title = "Провиль"
        
        configureUI()
    }
    
    func configureUI() {
        service.getPassport { [self] result in
            guard let result = result else {
                return
            }
            self.fistNameLabel.text = result.firstName.capitalized
            self.middleNameLabel.text = result.middleName.capitalized
            self.lastNameLabel.text = result.lastName.capitalized
            self.addressLabel.text = result.address.capitalized
            self.birthdateLabel.text = result.birthdate.capitalized
            self.birthplaceLabel.text = result.birthplace.capitalized
            
        
            var stack = UIStackView(arrangedSubviews: [profilePicture, fistNameLabel, middleNameLabel, lastNameLabel, addressLabel, birthdateLabel, birthplaceLabel])
            stack.alignment = .center
            stack.axis = .vertical
            
            view.addSubview(stack)
            
            profilePicture.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
            profilePicture.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
            
            stack.translatesAutoresizingMaskIntoConstraints = false
            
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
        }
    }
}
