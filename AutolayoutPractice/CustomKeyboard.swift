//
//  CustomKeyboard.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/08/07.
//

import UIKit

protocol CustomKeyboardDelegate {
    func keyboardTapped(value: String)
}

class CustomKeyboard: UIView {
    
    var delegate: CustomKeyboardDelegate?
    
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
    
    override func layoutSubviews() {
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
        
        self.addSubview(customKeyboardContainer)
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

        customKeyboardContainer.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        number1Button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        number2Button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        number3Button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        number4Button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        number5Button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        number6Button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        number7Button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        number8Button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        number9Button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonAction(sender: UIButton) {
        delegate?.keyboardTapped(value: sender.titleLabel?.text ?? "")
    }
}
