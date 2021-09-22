//
//  CalculateViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/07/31.
//

import UIKit
import SnapKit

class CalculateViewController: UIViewController {
    
    let label = UILabel()
    let buttonGroupView = UIView()
    
    let stackView0 = UIStackView()
    
    let stackView1 = UIStackView()
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    
    let stackView2 = UIStackView()
    let button4 = UIButton()
    let button5 = UIButton()
    let button6 = UIButton()
    
    let stackView3 = UIStackView()
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    
    let stackView4 = UIStackView()
    let button0 = UIButton()
    let button = UIButton()
    
    var buttons: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let buttons1 = [button1, button2, button3]
        let buttons2 = [button4, button5, button6]
        let buttons3 = [button7, button8, button9]
        let buttons4 = [button0, button]
        
        buttons = buttons1 + buttons2 + buttons3 + [button]
        
        let stacks = [stackView1, stackView2, stackView3, stackView4]

        label.text = "result"
        label.backgroundColor = .systemGray3
        label.layer.cornerRadius = 50.0
        label.layer.masksToBounds = true
        
        
        stackView0.axis = .vertical
        stackView0.spacing = 10.0
        stackView0.distribution = .fillEqually
        
        stacks.forEach {
            $0.axis = .horizontal
            $0.spacing = 10.0
            $0.distribution = .equalSpacing
        }
        
        
        [label, buttonGroupView].forEach {
            self.view.addSubview($0)
        }
        
        [stackView0].forEach {
            self.buttonGroupView.addSubview($0)
        }
        
        [stackView1, stackView2, stackView3, stackView4].forEach {
            self.stackView0.addArrangedSubview($0)
        }
        
        buttons1.forEach {
            stackView1.addArrangedSubview($0)
        }
        
        buttons2.forEach {
            stackView2.addArrangedSubview($0)
        }
        
        buttons3.forEach {
            stackView3.addArrangedSubview($0)
        }
        
        buttons4.forEach {
            stackView4.addArrangedSubview($0)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40.0)
            $0.left.equalToSuperview().offset(40.0)
            $0.right.equalToSuperview().offset(-40.0)
            $0.height.equalTo(buttonGroupView).dividedBy(2)
        }
        
        buttonGroupView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(40.0).priority(.high)
            $0.left.equalToSuperview().offset(40.0)
            $0.right.equalToSuperview().offset(-40.0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40.0)
        }
        
        stackView0.snp.makeConstraints {
            $0.top.right.bottom.left.equalToSuperview()
        }

        buttons.forEach { btn in
            btn.snp.makeConstraints {
                $0.height.equalTo(btn.snp.width)
            }
        }
        
        button0.snp.makeConstraints {
            $0.height.equalTo(button1)
            $0.right.equalTo(button8.snp.right)
        }
        
        button.snp.makeConstraints {
            $0.width.equalTo(button1)
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        buttons.forEach {
            $0.backgroundColor = .systemGray4
            $0.layer.cornerRadius = $0.bounds.width / 2
            $0.clipsToBounds = true
        }
        
        button0.backgroundColor = .systemOrange
        button0.layer.cornerRadius = button0.bounds.height / 2
    }


}

