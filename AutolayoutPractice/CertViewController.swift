//
//  CertViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/08/01.
//

import UIKit

class CertViewController: UIViewController {
    let titleLabel = UILabel()
    let nameLabel = UILabel()
    let authLabel = UILabel()
    let categoryLabel = UILabel()
    let expiredLabel = UILabel()
    
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        titleLabel.text = "공인인증서"
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 29 )
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.textAlignment = .center
        
        nameLabel.text = "문효재"
        nameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30 )
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.5
        nameLabel.textAlignment = .center
        
        authLabel.text = "발급자 : 금융결제원"
        authLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17 )
        authLabel.adjustsFontSizeToFitWidth = true
        authLabel.minimumScaleFactor = 0.5
        
        categoryLabel.text = "종  류 : 은행"
        categoryLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17 )
        categoryLabel.adjustsFontSizeToFitWidth = true
        categoryLabel.minimumScaleFactor = 0.5
        
        expiredLabel.text = "만료일 : 2021-08-01"
        expiredLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17 )
        expiredLabel.adjustsFontSizeToFitWidth = true
        expiredLabel.minimumScaleFactor = 0.5


        
        [imageView].forEach {
            self.view.addSubview($0)
        }
        
        [titleLabel, nameLabel, authLabel, categoryLabel, expiredLabel].forEach {
            self.imageView.addSubview($0)
        }
        
        imageView.image = UIImage(named: "cert")
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        
        imageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().multipliedBy(0.35)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().multipliedBy(0.71)
        }
        
        authLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().multipliedBy(1)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.left.equalTo(authLabel.snp.left)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().multipliedBy(1.1)
        }
        
        expiredLabel.snp.makeConstraints {
            $0.left.equalTo(authLabel.snp.left)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().multipliedBy(1.2)
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imageView.snp.makeConstraints {
            $0.height.equalTo(imageView.bounds.width / 1009 * 1438 )
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(3)
        }
        
        nameLabel.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(2)
        }
        
        [authLabel, categoryLabel, expiredLabel].forEach {
            $0.snp.makeConstraints {
                $0.width.equalToSuperview().dividedBy(2)
            }
        }
    }
}
