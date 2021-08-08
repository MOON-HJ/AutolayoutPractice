//
//  CustomSwitchViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/08/08.
//

import UIKit
import SnapKit

class CustomSwitchViewController: UIViewController {
    
    let switchContainer = UIView()
    let switchButton = UIButton()
    
    let switchWidth = 150
    let switchHeight = 50
    
    private var value = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        switchContainer.backgroundColor = .systemGray5
        switchButton.backgroundColor = .red
        
        switchButton.layer.cornerRadius = CGFloat(switchHeight / 2)
        switchContainer.layer.cornerRadius = CGFloat(switchHeight / 2)
        
        [switchContainer].forEach {
            self.view.addSubview($0)
        }
        
        [switchButton].forEach {
            self.switchContainer.addSubview($0)
        }
        
        switchContainer.snp.makeConstraints {
            $0.height.equalTo(switchHeight)
            $0.width.equalTo(switchWidth)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        switchButton.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.width.equalTo(switchHeight)
            $0.centerX.equalToSuperview().offset( ((switchWidth - switchHeight) / 2) * (value ? 1 : -1) )
            $0.centerY.equalToSuperview()
        }
        
        switchButton.addTarget(self, action: #selector(toggleSwitch), for: .touchUpInside)

    }
    
    @objc func toggleSwitch(_ sender: UIButton) {
        value.toggle()
        switchButton.snp.updateConstraints {
            $0.centerX.equalToSuperview().offset( ((switchWidth - switchHeight) / 2) * (value ? 1 : -1) )
        }
            
        switchContainer.backgroundColor = value ? .yellow : .systemGray5 
        
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

