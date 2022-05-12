//
//  LoginViewController.swift
//  Mobillium Task
//
//  Created by Yarkın Gazibaba on 11.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    var received_name:String?
    var received_password: String?
    
    let firstCheckBox = CustomCheckBox(frame: CGRect(x: 70, y: 70, width: 2, height: 2))
    let secondCheckBox = CustomCheckBox(frame: CGRect(x: 70, y: 70, width: 2, height: 2))
    
    private let firstLbl: UILabel = {
        let label = UILabel()
        label.text = "Remind me"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondarySystemBackground
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    private let secondLbl: UILabel = {
        let label = UILabel()
        label.text = "I accept to get promotional e-mail from Mobillium about ZonZero Program"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondarySystemBackground
        return label
    }()

    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray
        return stackView
    }()
    
    private let first_horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.layoutSubviews().self
        stackView.spacing = 1
        return stackView
    }()
    
    private let second_horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 1
        stackView.isHidden = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let nameTf: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        return textField
    }()
    
    private let password: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let logInbutton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .cyan
        button.setTitle("LogIn", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(btn_TUI), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(nameTf)
        view.addSubview(password)
        
        nameTf.delegate = self
        password.delegate = self
        
        configureVStackView()
        
        view.addSubview(logInbutton)
        applyConstraints()
        
        configureCheckBoxes()
    }
    
    @objc private func btn_TUI(){
        if(nameTf.text == received_name && password.text == received_password) {
            let vc = MovieViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        else if (nameTf.text != received_name){
            showAlert(alertTitle: "Incorrect Name", alertMessage: "Name value is incorrect")
        }
        else if (password.text != received_password){
            showAlert(alertTitle: "Incorrect Password", alertMessage: "Password value is incorrect")
        }
    }
    
    private func showAlert(alertTitle alertTtl: String, alertMessage alertMsg: String){
        let alertController: UIAlertController
        
        alertController = UIAlertController(title: alertTtl, message: alertMsg, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alertController.addAction(UIAlertAction(title: "Retry", style: .default, handler: {
            UIAlertAction in
            self.nameTf.text = ""
            self.password.text = ""
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    func configureCheckBoxes(){
        let firstCheckBoxgesture = UITapGestureRecognizer(target: self, action: #selector(didTapBox_first))
        firstCheckBox.addGestureRecognizer(firstCheckBoxgesture)
        
        let secondCheckBoxgesture = UITapGestureRecognizer(target: self, action: #selector(didTapBox_second))
        secondCheckBox.addGestureRecognizer(secondCheckBoxgesture)
    }
    
    
    @objc func didTapBox_first(){
        firstCheckBox.toggle()
        second_horizontalStackView.isHidden = false
    }
    

    @objc func didTapBox_second(){
        secondCheckBox.toggle()
    }
    
    private func configureVStackView(){
        view.addSubview(verticalStackView)
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 1
         
        addElementToHStack()
        
        setHStacksConstraints()
        
        addElementToVStackView()
        
        setVStackViewConstraints()

    }
    
    
    private func addElementToVStackView(){
        verticalStackView.addArrangedSubview(first_horizontalStackView)
        verticalStackView.addArrangedSubview(second_horizontalStackView)
    }
    
    private func setVStackViewConstraints(){
        let stackViewConstraints = [
            verticalStackView.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verticalStackView.heightAnchor.constraint(equalToConstant: 60)
            
        ]
        NSLayoutConstraint.activate(stackViewConstraints)
    }
    

    private func addElementToHStack(){
        addElementToFirstHStack()
        addElementToSecondHStack()
    }
    
    private func setHStacksConstraints(){

        let firsStackCnst = [
            first_horizontalStackView.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let firstCheckBoxConstrnts = [
            firstCheckBox.widthAnchor.constraint(equalToConstant: 50),
        ]
       
        let secondCheckBoxConstrnts = [
            secondCheckBox.widthAnchor.constraint(equalToConstant: 50),
        ]
        
        let secondStackCnst = [
            second_horizontalStackView.heightAnchor.constraint(equalToConstant: 20)
        ]
        
       
        NSLayoutConstraint.activate(firsStackCnst)
        NSLayoutConstraint.activate(firstCheckBoxConstrnts)
    
        NSLayoutConstraint.activate(secondStackCnst)
        NSLayoutConstraint.activate(secondCheckBoxConstrnts)
    }
    
    private func addElementToFirstHStack(){
        first_horizontalStackView.addArrangedSubview(firstCheckBox)
        first_horizontalStackView.addArrangedSubview(firstLbl)
    }
    
    private func addElementToSecondHStack(){
        second_horizontalStackView.addArrangedSubview(secondCheckBox)
        second_horizontalStackView.addArrangedSubview(secondLbl)
    }
    
    private func applyConstraints(){
        let nameTfConstraints = [
            nameTf.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            nameTf.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameTf.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameTf.widthAnchor.constraint(equalToConstant: 250),
            nameTf.heightAnchor.constraint(equalToConstant: 35)
        ]
        let passwordConstraints = [
            password.topAnchor.constraint(equalTo: nameTf.bottomAnchor, constant: 20),
            password.leadingAnchor.constraint(equalTo: nameTf.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: nameTf.trailingAnchor),
            password.heightAnchor.constraint(equalToConstant: 35)
        ]
        let logInButtonConstrants = [
            logInbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInbutton.topAnchor.constraint(equalTo: view.bottomAnchor,constant: -130),
            logInbutton.widthAnchor.constraint(equalToConstant: 120),
            logInbutton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            logInbutton.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(nameTfConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(logInButtonConstrants)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
