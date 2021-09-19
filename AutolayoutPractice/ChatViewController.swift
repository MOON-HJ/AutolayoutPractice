//
//  ChatViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/09/18.
//

import UIKit
import SnapKit

class ChatViewController: UIViewController {
        
    let tableView = UITableView()
    let inputTextView = UIView()
    let textView = UITextView()
    let sendButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendButton.setTitle("전송", for: .normal)
        sendButton.setTitleColor(.systemBlue, for: .normal)
        inputTextView.backgroundColor = .systemGray
    
        tableView.register(MyBubbleTableViewCell.self, forCellReuseIdentifier: MyBubbleTableViewCell.id)
        tableView.register(YourBubbleTableViewCell.self, forCellReuseIdentifier: YourBubbleTableViewCell.id)
        
        [inputTextView, tableView].forEach {
            self.view.addSubview($0)
        }

        [textView, sendButton].forEach {
            self.inputTextView.addSubview($0)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(inputTextView.snp.top)
        }
        
        inputTextView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    
        textView.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(4)
            $0.right.equalTo(sendButton.snp.left).offset(-4)
            $0.bottom.equalToSuperview().offset(-4)
            $0.height.equalTo(40)
        }
        
        sendButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.bottom.equalToSuperview().offset(-4)
        }
        sendButton.contentEdgeInsets.left = 20
        sendButton.contentEdgeInsets.right = 20
        
        
    }
}

