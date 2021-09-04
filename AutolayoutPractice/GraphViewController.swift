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
    
    let graphA = UIView()
    let graphB = UIView()
    let graphC = UIView()
    let graphD = UIView()
    let graphE = UIView()

    override func viewDidLoad() {
        container.backgroundColor = .systemGray2
        
        graphA.backgroundColor = .systemRed
        graphB.backgroundColor = .systemGreen
        graphC.backgroundColor = .systemBlue
        graphD.backgroundColor = .systemYellow
        graphE.backgroundColor = .systemPink

        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [container].forEach {
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
            $0.height.equalToSuperview().multipliedBy(0.2)
        }
        
        graphB.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.equalTo(graphA.snp.right).offset(20)
            $0.right.equalTo(graphC.snp.left).offset(-20)
            $0.height.equalToSuperview().multipliedBy(0.4)
            $0.width.equalTo(graphA)
        }
        
        graphC.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.equalTo(graphB.snp.right).offset(20)
            $0.right.equalTo(graphD.snp.left).offset(-20)
            $0.height.equalToSuperview().multipliedBy(0.6)
            $0.width.equalTo(graphA)
        }

        graphD.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.equalTo(graphC.snp.right).offset(20)
            $0.right.equalTo(graphE.snp.left).offset(-20)
            $0.height.equalToSuperview().multipliedBy(0.8)
            $0.width.equalTo(graphA)
        }
        
        graphE.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.equalTo(graphD.snp.right).offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalToSuperview()
            $0.width.equalTo(graphA)
        }
    }
}

