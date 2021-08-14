//
//  ExpandableViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/08/14.
//

import UIKit
import SnapKit

class ExpandableViewController: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.tableView.dataSource = self
        self.tableView.allowsSelection = false
        
        // tableView의 계산된 높이 값은 68이다. 즉 Default Height이다.
        tableView.estimatedRowHeight = 68.0
        // tableView의 rowHeight는 유동적일 수 있다
        tableView.rowHeight = UITableView.automaticDimension

        tableView.register(ExpandableCell.self, forCellReuseIdentifier: ExpandableCell.id)
        
        [tableView].forEach {
            self.view.addSubview($0)
        }
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension ExpandableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableCell.id) as? ExpandableCell else { return UITableViewCell() }
        cell.configure(title: "hello world", description: "Lorem Ipsum")
        return cell
    }
    
}


final class ExpandableCell: UITableViewCell {
    static let id = "expandableCell"
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .systemRed
        
        titleLabel.sizeToFit()
        titleLabel.numberOfLines = 1
        descriptionLabel.sizeToFit()
        descriptionLabel.numberOfLines = 0
        
        
        thumbnail.image = UIImage(named: "girl")
        
        [thumbnail, titleLabel, descriptionLabel].forEach {
            self.contentView.addSubview($0)
        }
        
        thumbnail.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(16)
            $0.width.height.equalTo(48)
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
