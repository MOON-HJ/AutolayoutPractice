//
//  CustomKeyboardViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/08/07.
//

import UIKit
 
class CustomKeyboardViewController: UIViewController {
    let customKeyboardTextField = UITextField()
    let defaultKeyboardTextField = UITextField()

//    Custom Keyboard
    let customKeyboard = CustomKeyboard()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        customKeyboardTextField.backgroundColor = .systemGray6
        defaultKeyboardTextField.backgroundColor = .systemGray6

        [customKeyboardTextField, defaultKeyboardTextField].forEach {
            self.view.addSubview($0)
        }
        customKeyboardTextField.inputView = customKeyboard
        
        customKeyboardTextField.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
        
        defaultKeyboardTextField.snp.makeConstraints {
            $0.top.equalTo(customKeyboardTextField.snp.bottom).offset(30)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        customKeyboard.snp.makeConstraints {
            $0.width.equalTo(self.view.bounds.width)
        }
    }
}


