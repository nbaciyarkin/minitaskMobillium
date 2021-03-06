//
//  LoginViewController.swift
//  Mobillium Task
//
//  Created by Yarkın Gazibaba on 11.05.2022.
//

import UIKit

class RegisterViewController: UIViewController, UITextViewDelegate {
    
    private let nameTf: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        return textField
    }()
    
    private let emailTf: UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail"
        textField.backgroundColor = .secondarySystemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        return textField
    }()
    
    private let password: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = .secondarySystemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let retypePassword: UITextField = {
        let textField = UITextField()
        textField.placeholder = "ReTypePassword"
        textField.backgroundColor = .secondarySystemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let registerbutton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(btn_TUI), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"

        view.backgroundColor = .cyan
        
        view.addSubview(nameTf)
        view.addSubview(emailTf)
        view.addSubview(password)
        view.addSubview(retypePassword)
        view.addSubview(registerbutton)
        
        
        //when I tried to run physical device I came across keyboard issue I deal with the textFliedDelegate methods
        nameTf.delegate = self
        emailTf.delegate = self
        password.delegate = self
        retypePassword.delegate = self

        applyConstraints()
    }
    
    @objc private func btn_TUI(){
        if(checkCharacterThree()&&checkPasswordConsistency()){
            let vc = LoginViewController()
            vc.received_name = nameTf.text
            vc.received_password = password.text
            navigationController?.pushViewController(vc, animated: true)
        } else {
            print("wrong")
        }
    }
    
    private func checkCharacterThree() -> Bool {
        if(nameTf.text!.count >= 3 && emailTf.text!.count >= 3 && password.text!.count >= 3 && retypePassword.text!.count >= 3){
            return true
        } else {
            return false
        }
    }
    
    private func checkPasswordConsistency() -> Bool{
        if(retypePassword.text == password.text) {
            return true
        } else {
            return false
        }
    }
       
    private func applyConstraints(){
        let nameTfConstraints = [
            nameTf.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            nameTf.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameTf.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameTf.widthAnchor.constraint(equalToConstant: 250),
            nameTf.heightAnchor.constraint(equalToConstant: 35)
        ]
        
        let emailTfConstraints = [
            emailTf.topAnchor.constraint(equalTo: nameTf.topAnchor, constant: 45),
            emailTf.leadingAnchor.constraint(equalTo: nameTf.leadingAnchor),
            emailTf.trailingAnchor.constraint(equalTo: nameTf.trailingAnchor),
            emailTf.heightAnchor.constraint(equalToConstant: 35)
        ]
        
        let passwordConstraints = [
            password.topAnchor.constraint(equalTo: emailTf.topAnchor, constant: 45),
            password.leadingAnchor.constraint(equalTo: nameTf.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: nameTf.trailingAnchor),
            password.heightAnchor.constraint(equalToConstant: 35)
        ]
        
        let rePasswordConstraints = [
            retypePassword.topAnchor.constraint(equalTo: password.topAnchor, constant: 45),
            retypePassword.leadingAnchor.constraint(equalTo: nameTf.leadingAnchor),
            retypePassword.trailingAnchor.constraint(equalTo: nameTf.trailingAnchor),
            retypePassword.heightAnchor.constraint(equalToConstant: 35),
            
        ]
        
        let buttonConstraints = [
            
            registerbutton.leadingAnchor.constraint(equalTo: nameTf.leadingAnchor, constant: 80),
            registerbutton.trailingAnchor.constraint(equalTo: nameTf.trailingAnchor, constant: -80),
            registerbutton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
        ]
        
        NSLayoutConstraint.activate(nameTfConstraints)
        NSLayoutConstraint.activate(emailTfConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(rePasswordConstraints)
        NSLayoutConstraint.activate(buttonConstraints)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
