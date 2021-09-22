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
    private var inputViewBottomConstraint: Constraint?
    private var textViewHeightConstraint: Constraint?
    private var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        sendButton.setTitle("전송", for: .normal)
        sendButton.setTitleColor(.systemBlue, for: .normal)
        inputTextView.backgroundColor = .systemGray
        textView.delegate = self
    
        tableView.keyboardDismissMode = .onDrag
        tableView.register(MyBubbleTableViewCell.self, forCellReuseIdentifier: MyBubbleTableViewCell.id)
        tableView.register(YourBubbleTableViewCell.self, forCellReuseIdentifier: YourBubbleTableViewCell.id)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    
        tableView.delegate = self
        tableView.dataSource = self
        
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
            self.inputViewBottomConstraint = $0.bottom.equalTo(self.view.safeAreaLayoutGuide).constraint
        }
    
        textView.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(4)
            $0.right.equalTo(sendButton.snp.left).offset(-4)
            $0.bottom.equalToSuperview().offset(-4)
            self.textViewHeightConstraint = $0.height.equalTo(40).constraint
        }
        
        sendButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.bottom.equalToSuperview().offset(-4)
        }
        sendButton.contentEdgeInsets.left = 20
        sendButton.contentEdgeInsets.right = 20
        sendButton.addTarget(self, action: #selector(sendData), for: .touchUpInside)
      
      
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    @objc func sendData(sender: UIButton) {
        data.append(textView.text)
        textView.text = ""
        let last = IndexPath(row: data.count - 1, section: 0)
        tableView.insertRows(at: [last], with: .automatic)
        tableView.scrollToRow(at: last, at: .bottom, animated: true)
        textViewHeightConstraint?.update(offset: 40)
    }
    
    @objc func keyboardWillShow(notifiaction: Notification) {
        let info = notifiaction.userInfo
        guard let keyboardFrame = info?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
    
        let height = keyboardFrame.size.height - view.safeAreaInsets.bottom
        
        guard let animationDuration = info?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
        
        UIView.animate(withDuration: animationDuration) { [weak self] in
            self?.inputViewBottomConstraint?.update(offset: -height)
            self?.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notifiaction: Notification) {
        let info = notifiaction.userInfo
        guard let animationDuration = info?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }

        UIView.animate(withDuration: animationDuration) { [weak self] in
            self?.inputViewBottomConstraint?.update(offset: 0)
            self?.view.layoutIfNeeded()
        }
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            guard let myCell = tableView.dequeueReusableCell(withIdentifier: MyBubbleTableViewCell.id, for: indexPath) as? MyBubbleTableViewCell else { return UITableViewCell()}
            myCell.textView.text = data[indexPath.row]
            return myCell
        } else {
            guard let yourCell = tableView.dequeueReusableCell(withIdentifier: YourBubbleTableViewCell.id, for: indexPath) as? YourBubbleTableViewCell else { return UITableViewCell()}
            yourCell.textView.text = data[indexPath.row]
            return yourCell
        }
    }
}

extension ChatViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        var height = textView.contentSize.height
        height = height <= 40 ? 40 : height
        height = height >= 100 ? 100 : height
    
        self.textViewHeightConstraint?.update(offset: height)
    }
}
