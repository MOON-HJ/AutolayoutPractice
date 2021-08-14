//
//  ExpandableViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/08/14.
//

import UIKit
import SnapKit

class ExpandableViewController: UIViewController {
    
    struct ExpandableModel {
        var description: String
        var isExpanded: Bool
    }
    
    var dataModels: [ExpandableModel] = []
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ExpandableCell.self, forCellReuseIdentifier: ExpandableCell.id)
        tableView.tableFooterView = UIView()
        
        [tableView].forEach {
            self.view.addSubview($0)
        }
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let textArray = ["short short short", "long long long long long long long long", "short short short", "long long long long long long long long","long long long long long long long long long long long long long long long long"]
        
        dataModels = textArray.map { ExpandableModel(description: $0, isExpanded: false)}
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

/*
 토글시 애니메아션 튀는 현상 방지하기 위한 방법
 
 1. heightForRowAt 에서 정확한 높이 지정
 2. tableview.reloadData()
 3. tableView.estimatedSectionHeaderHeight = 0
    tableView.estimatedSectionFooterHeight = 0
 4. 애니메이션 효과 없애기 -> 확실히 해결
 */

extension ExpandableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dataModels[indexPath.row].isExpanded.toggle()
//        tableView.reloadRows(at: [indexPath], with: .none)
        
//        tableView.reloadData()
        
        UIView.setAnimationsEnabled(false)
        tableView.reloadRows(at: [indexPath], with: .none)
        UIView.setAnimationsEnabled(true)

    }
}

extension ExpandableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableCell.id) as? ExpandableCell else { return UITableViewCell() }
        cell.configure(title: "hello world", description: dataModels[indexPath.item].description)
        
        if dataModels[indexPath.row].isExpanded { cell.descriptionLabel.numberOfLines = 0}
        else { cell.descriptionLabel.numberOfLines = 1}
        cell.selectionStyle = .none
        
        return cell
    }
}


final class ExpandableCell: UITableViewCell {
    static let id = "expandableCell"
    
    let containerView = UIView()
    let thumbnail = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func configure(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.setUpConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.sizeToFit()
        titleLabel.numberOfLines = 1
        descriptionLabel.sizeToFit()
        descriptionLabel.lineBreakMode = .byTruncatingTail
        
        thumbnail.image = UIImage(named: "girl")
        
        self.addSubview(self.containerView)
        [thumbnail, titleLabel, descriptionLabel].forEach {
            self.containerView.addSubview($0)
        }
        
        self.setUpConstraints()
    }
    
    private func setUpConstraints() {
        self.containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        thumbnail.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(16)
            $0.width.height.equalTo(48).priority(.required)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(thumbnail.snp.right).offset(16)
            $0.centerY.equalTo(thumbnail.snp.centerY)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.top.equalTo(thumbnail.snp.bottom).offset(16)
            $0.bottom.equalToSuperview().offset(-16)
        }

    }
}
