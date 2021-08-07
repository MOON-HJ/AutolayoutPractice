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
    let customKeyboard = UIView()
    let customKeyboardContainer = UIStackView()
    let topButtonContainer = UIStackView()
    let middleButtonContainer = UIStackView()
    let bottomButtonContainer = UIStackView()
    let number1Button = UIButton()
    let number2Button = UIButton()
    let number3Button = UIButton()
    let number4Button = UIButton()
    let number5Button = UIButton()
    let number6Button = UIButton()
    let number7Button = UIButton()
    let number8Button = UIButton()
    let number9Button = UIButton()
    let topEmptyButton = UIButton()
    let middleEmptyButton = UIButton()
    let bottomEmptyButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        customKeyboardTextField.backgroundColor = .systemGray6
        defaultKeyboardTextField.backgroundColor = .systemGray6

        [customKeyboardTextField, defaultKeyboardTextField].forEach {
            self.view.addSubview($0)
        }
        
        self.customKeyboard.addSubview(customKeyboardContainer)
        [topButtonContainer, middleButtonContainer, bottomButtonContainer].forEach {
            customKeyboardContainer.addArrangedSubview($0)
        }
        
        [number1Button, number2Button, topEmptyButton ,number3Button].forEach {
            topButtonContainer.addArrangedSubview($0)
        }
        
        [number4Button, middleEmptyButton, number5Button, number6Button].forEach {
            middleButtonContainer.addArrangedSubview($0)
        }

        [number7Button, number8Button, number9Button, bottomEmptyButton].forEach {
            bottomButtonContainer.addArrangedSubview($0)
        }
        
        let buttons = [number1Button, number2Button, number3Button, number4Button, number5Button, number6Button, number7Button, number8Button, number9Button]
        let emptyButtons = [topEmptyButton, middleEmptyButton, bottomEmptyButton]
        let stacks = [topButtonContainer, middleButtonContainer, bottomButtonContainer]
        
        customKeyboardContainer.axis = .vertical
        customKeyboardContainer.distribution = .fillEqually
        customKeyboardContainer.spacing = 2.0
        
        stacks.forEach {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 2.0
        }
        buttons.enumerated().forEach {
            $0.element.backgroundColor = .systemBlue
            $0.element.setTitleColor(.white, for: .normal)
            $0.element.setTitle("\($0.offset + 1)", for: .normal)
        }
        
        emptyButtons.forEach {
            $0.isUserInteractionEnabled = false
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
        
        customKeyboardContainer.snp.makeConstraints {
            $0.edges.equalTo(customKeyboard.safeAreaLayoutGuide)
        }

        
    }
}
