//
//  ViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/07/31.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let buttonGroupView = UIView()
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let buttons1 = [button1, button2, button3]
        let buttons2 = [button4, button5, button6]
        let buttons3 = [button7, button8, button9]
        let buttons4 = [button0, button]
        
        let buttons = buttons1 + buttons2 + buttons3 + buttons4
        let stacks = [stackView1, stackView2, stackView3]

        label.text = "hello World"
        label.backgroundColor = .lightGray
        buttonGroupView.backgroundColor = .systemYellow
        
        stacks.forEach {
            $0.axis = .horizontal
            $0.spacing = 10.0
            $0.distribution = .fillEqually
        }
        
        stackView4.axis = .horizontal
        stackView4.spacing = 10.0
        stackView4.distribution = .fill
        
        
        buttons.forEach {
            $0.backgroundColor = .systemGray4
        }
        
        [label, buttonGroupView].forEach {
            self.view.addSubview($0)
        }
        
        [stackView1, stackView2, stackView3, stackView4].forEach {
            self.buttonGroupView.addSubview($0)
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
            $0.height.equalTo(150)
        }
        
        buttonGroupView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(40.0)
            $0.left.equalToSuperview().offset(40.0)
            $0.right.equalToSuperview().offset(-40.0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40.0)
        }
        
        stackView1.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
        
        stackView2.snp.makeConstraints {
            $0.top.equalTo(stackView1.snp.bottom).offset(10.0)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(stackView1)
        }
        
        stackView3.snp.makeConstraints {
            $0.top.equalTo(stackView2.snp.bottom).offset(10.0)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(stackView1)
        }
        
        stackView4.snp.makeConstraints {
            $0.top.equalTo(stackView3.snp.bottom).offset(10.0)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(stackView1)
            $0.bottom.equalToSuperview()

        }
        
        button.snp.makeConstraints {
            $0.width.equalTo(button1)
        }
        
        
    }


}

