//
//  SignInViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/09/12.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    let titleLabel = UILabel()
    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    let emailField = UITextField()
    let passwordField = UITextField()
    let signinButton = UIButton()
    let descriptionEmailLabel = UILabel()
    let descriptionPasswordLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleLabel.text = "Sign In"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        emailLabel.text = "E-mail"
        emailLabel.textColor = .black
        
        passwordLabel.text = "Password"
        passwordLabel.textColor = .black
        
        emailField.borderStyle = .roundedRect
        emailField.layer.borderColor = UIColor.systemGray.cgColor
        emailField.layer.borderWidth = 1
        emailField.backgroundColor = .white
        emailField.textColor = .black
        
        passwordField.borderStyle = .roundedRect
        passwordField.layer.borderColor = UIColor.systemGray.cgColor
        passwordField.layer.borderWidth = 1
        passwordField.backgroundColor = .white
        passwordField.textColor = .black
        
        descriptionEmailLabel.text = "Please enter a valid email Address"
        descriptionEmailLabel.textColor = .systemRed
        descriptionEmailLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        
        descriptionPasswordLabel.text = "Minimum 8 Characters"
        descriptionPasswordLabel.textColor = .systemRed
        descriptionPasswordLabel.font = UIFont.preferredFont(forTextStyle: .caption2)

        signinButton.setTitle("Sign In", for: .normal)
        signinButton.backgroundColor = .systemBlue
        
        [titleLabel, emailLabel, passwordLabel, emailField, passwordField, signinButton, descriptionEmailLabel, descriptionPasswordLabel].forEach {
            self.view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }

        emailField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        
        descriptionEmailLabel.snp.makeConstraints {
            $0.top.equalTo(emailField.snp.bottom).offset(5)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }

        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionEmailLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }

        passwordField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }

        descriptionPasswordLabel.snp.makeConstraints {
            $0.top.equalTo(passwordField.snp.bottom).offset(5)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }

        signinButton.snp.makeConstraints {
            $0.top.equalTo(descriptionPasswordLabel.snp.bottom).offset(30)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            
        }
    }
}

