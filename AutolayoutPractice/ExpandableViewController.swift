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
        
        let textArray = ["형사피해자는 법률이 정하는 바에 의하여 당해 사건의 재판절차에서 진술할 수 있다. 모든 국민은 신속한 재판을 받을 권리를 가진다. 형사피고인은 상당한 이유가 없는 한 지체없이 공개재판을 받을 권리를 가진다.", "대한민국은 민주공화국이다. 근로조건의 기준은 인간의 존엄성을 보장하도록 법률로 정한다. 공공필요에 의한 재산권의 수용·사용 또는 제한 및 그에 대한 보상은 법률로써 하되, 정당한 보상을 지급하여야 한다", "공공필요에 의한 재산권의 수용·사용 또는 제한 및 그에 대한 보상은 법률로써 하되, 정당한 보상을 지급하여야 한다. 국회는 법률에 저촉되지 아니하는 범위안에서 의사와 내부규율에 관한 규칙을 제정할 수 있다.", "국회는 헌법개정안이 공고된 날로부터 60일 이내에 의결하여야 하며, 국회의 의결은 재적의원 3분의 2 이상의 찬성을 얻어야 한다.", "국회는 국가의 예산안을 심의·확정한다. 대통령의 국법상 행위는 문서로써 하며, 이 문서에는 국무총리와 관계 국무위원이 부서한다. 군사에 관한 것도 또한 같다. 제3항의 승인을 얻지 못한 때에는 그 처분 또는 명령은 그때부터 효력을 상실한다. 이 경우 그 명령에 의하여 개정 또는 폐지되었던 법률은 그 명령이 승인을 얻지 못한 때부터 당연히 효력을 회복한다."]
        
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
