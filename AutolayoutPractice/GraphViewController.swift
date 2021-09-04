//
//  GraphViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/07/31.
//

import UIKit
import SnapKit

class GraphViewController: UIViewController {
    
    let container = UIView()
    
    let containerHeight = 200.0
    
    private var AValue: Constraint?
    private var BValue: Constraint?
    private var CValue: Constraint?
    private var DValue: Constraint?
    private var EValue: Constraint?

    let graphA = UIView()
    let graphB = UIView()
    let graphC = UIView()
    let graphD = UIView()
    let graphE = UIView()
    
    let button1 = UIButton()
    let button2 = UIButton()

    override func viewDidLoad() {
        container.backgroundColor = .systemGray2

        graphA.backgroundColor = .systemRed
        graphB.backgroundColor = .systemGreen
        graphC.backgroundColor = .systemBlue
        graphD.backgroundColor = .systemYellow
        graphE.backgroundColor = .systemPink
        
        button1.setTitle("1번", for: .normal)
        button2.setTitle("2번", for: .normal)
        button1.setTitleColor(.systemBlue, for: .normal)
        button2.setTitleColor(.systemBlue, for: .normal)
        button1.addTarget(self, action: #selector(button1Action), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Action), for: .touchUpInside)

        super.viewDidLoad()
        view.backgroundColor = .white
        
        [container, button1, button2].forEach {
            self.view.addSubview($0)
        }
        
        [graphA, graphB, graphC, graphD, graphE].forEach {
            self.container.addSubview($0)
        }
    
        container.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(200)
            $0.centerY.equalToSuperview().offset(-100)
        }
        
        graphA.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.right.equalTo(graphB.snp.left).offset(-20)
            self.AValue = $0.height.equalToSuperview().constraint
        }
        
        graphB.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.equalTo(graphA.snp.right).offset(20)
            $0.right.equalTo(graphC.snp.left).offset(-20)
            self.BValue = $0.height.equalToSuperview().constraint
            $0.width.equalTo(graphA)
        }
        
        graphC.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.equalTo(graphB.snp.right).offset(20)
            $0.right.equalTo(graphD.snp.left).offset(-20)
            self.CValue = $0.height.equalToSuperview().constraint
            $0.width.equalTo(graphA)
        }

        graphD.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.equalTo(graphC.snp.right).offset(20)
            $0.right.equalTo(graphE.snp.left).offset(-20)
            self.DValue = $0.height.equalToSuperview().constraint
            $0.width.equalTo(graphA)
        }
        
        graphE.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.equalTo(graphD.snp.right).offset(20)
            $0.right.equalToSuperview().offset(-20)
            self.EValue = $0.height.equalToSuperview().constraint
            $0.width.equalTo(graphA)
        }
        
        button1.snp.makeConstraints {
            $0.top.equalTo(container.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        button2.snp.makeConstraints {
            $0.top.equalTo(button1.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
    }

    
    @objc func button1Action(sender: UIButton) {
        let a = setGraphHeight(0.5)
        let b = setGraphHeight(0.7)
        let c = setGraphHeight(0.2)
        let d = setGraphHeight(0.6)
        let e = setGraphHeight(0.3)

        UIView.animate(withDuration: 0.3) {
            self.AValue?.update(offset: a)
            self.BValue?.update(offset: b)
            self.CValue?.update(offset: c)
            self.DValue?.update(offset: d)
            self.EValue?.update(offset: e)

            self.view.layoutIfNeeded()
            
        }

    }
    
    @objc func button2Action(sender: UIButton) {
        let a = setGraphHeight(0.9)
        let b = setGraphHeight(0.3)
        let c = setGraphHeight(0.7)
        let d = setGraphHeight(0.1)
        let e = setGraphHeight(0.7)

        UIView.animate(withDuration: 0.3) {
            self.AValue?.update(offset: a)
            self.BValue?.update(offset: b)
            self.CValue?.update(offset: c)
            self.DValue?.update(offset: d)
            self.EValue?.update(offset: e)

            self.view.layoutIfNeeded()
            
        }

    }
    
    private func setGraphHeight(_ value: Double) -> Double {
        return -containerHeight * (1 - value)
    }
    
}

