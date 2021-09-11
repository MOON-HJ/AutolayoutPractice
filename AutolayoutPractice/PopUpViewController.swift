//
//  PopUpViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/09/11.
//

import UIKit
import SnapKit

//class PopUpViewController: UIViewController {
//    let button = UIButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//        button.setTitle("버튼 클릭ㄱ", for: .normal)
//        button.setTitleColor(.systemPink, for: .normal)
//        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
//
//        [button].forEach {
//            self.view.addSubview($0)
//        }
//
//        button.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.centerY.equalToSuperview()
//        }
//    }
//
//    @objc func didTap(sender: UIButton) {
//        print("did Tap")
//    }
//}


class PopUpViewController: UIViewController {
    let container = UIView()
    let imageView = UIImageView(image: UIImage(named: "bg5"))
    let balloon = UIImageView(image: UIImage(named: "balloon_3"))
    let label = UILabel()
    let textField = UITextField()
    let leftButton = UIButton()
    let rightButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        container.backgroundColor = UIColor(red: 211/255, green:  211/255, blue:  211/255, alpha: 1)
        container.layer.cornerRadius = 8
        container.clipsToBounds = true
        label.text = "나는글자 나는글자 나는 매우 긴 글자, 나는 두 줄 글자"
        label.textColor = .black
        label.numberOfLines = 2
        textField.backgroundColor = .white
        leftButton.setTitle("나는왼쪽", for: .normal)
        leftButton.setTitleColor(.systemGray6, for: .normal)
        rightButton.setTitle("나는오른쪽", for: .normal)
        rightButton.setTitleColor(.systemRed, for: .normal)
        
        [container, balloon].forEach {
            self.view.addSubview($0)
        }
        
        [imageView, label, textField, leftButton, rightButton].forEach {
            self.container.addSubview($0)
        }
        
        container.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().multipliedBy(0.9)
        }
        
        balloon.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(70)
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(container.snp.top)
        }
        
        imageView.snp.makeConstraints {
            $0.width.equalTo(240)
            $0.height.equalTo(130)
            $0.top.right.left.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        
        leftButton.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(20)
            $0.width.equalTo(rightButton)
            $0.height.equalTo(rightButton)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalTo(rightButton.snp.left).offset(-3)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        rightButton.snp.makeConstraints {
            $0.top.equalTo(leftButton)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalTo(leftButton)
        }

    }
}
