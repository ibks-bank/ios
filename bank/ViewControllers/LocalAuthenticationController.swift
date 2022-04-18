//
//  LocalAuthenticationController.swift
//  bank
//
//  Created by Yulia Popova on 18/4/2022.
//

import UIKit
import LocalAuthentication

class LocalAuthenticationController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        localAuthenticationUsingFaceId()
    }
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter pincode"
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.frame.size.height = 20.0
        label.textColor = UIColor.black
        
        var iv = PincodeCircle()
        var iv1 = PincodeCircle()
        var iv2 = PincodeCircle()
        var iv3 = PincodeCircle()
        
        var s = UIStackView(arrangedSubviews: [iv, iv1, iv2, iv3])
        s.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        s.axis = .horizontal
        s.spacing = 0.0
        s.alignment = .center
        s.distribution = .fill
        
        
        var button1 = NumberButton(title: "1", target: self, action: nil)
        var button2 = NumberButton(title: "2", target: self, action: nil)
        var button3 = NumberButton(title: "3", target: self, action: nil)
        
        
        var stack1 = UIStackView(arrangedSubviews: [button1, button2, button3])
        stack1.axis = .horizontal
        stack1.spacing = 100.0
        
        var button4 = NumberButton(title: "4", target: self, action: nil)
        var button5 = NumberButton(title: "5", target: self, action: nil)
        var button6 = NumberButton(title: "6", target: self, action: nil)
        
        
        var stack2 = UIStackView(arrangedSubviews: [button4, button5, button6])
        stack2.axis = .horizontal
        stack2.spacing = 100.0
        
        var button7 = NumberButton(title: "7", target: self, action: nil)
        var button8 = NumberButton(title: "8", target: self, action: nil)
        var button9 = NumberButton(title: "9", target: self, action: nil)
        
        
        var stack3 = UIStackView(arrangedSubviews: [button7, button8, button9])
        stack3.axis = .horizontal
        stack3.spacing = 100.0
        
        var button10 = NumberButton(imageName: "faceid", target: self, action: nil)
        var button11 = NumberButton(title: "0", target: self, action: nil)
        var button12 = NumberButton(imageName: "delete.left.fill", target: self, action: nil)
        
        
        var stack4 = UIStackView(arrangedSubviews: [button10, button11, button12])
        stack4.axis = .horizontal
        stack4.spacing = 100.0
        
        var stack5 = UIStackView(arrangedSubviews: [label, s, stack1, stack2, stack3, stack4])
        stack5.alignment = .center
        stack5.distribution = .equalCentering
        stack5.axis = .vertical
        stack5.spacing = 10.0
        view.addSubview(stack5)

        stack5.translatesAutoresizingMaskIntoConstraints = false
        stack5.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack5.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func localAuthenticationUsingFaceId() {
        let context = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please authenticate to proceed.") { (success, error) in
                if success {
                    DispatchQueue.main.async {
                        
                        var controller = MainController()
                        
                        self.navigationController?.pushViewController(controller, animated: true)
                        self.dismiss(animated: true, completion: nil)
                    }
                } else {
                    guard let error = error else { return }
                    print(error.localizedDescription)
                }
            }
        }
    }

}
