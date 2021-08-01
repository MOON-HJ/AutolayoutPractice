//
//  CertViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/08/01.
//

import UIKit

class CertViewController: UIViewController {
    let titleLabel = UILabel()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        titleLabel.text = "공인인증서"
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 29 )
        
        [imageView].forEach {
            self.view.addSubview($0)
        }
        
        [titleLabel].forEach {
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imageView.snp.makeConstraints {
            $0.height.equalTo(imageView.bounds.width / 1009 * 1438 )
        }
    }
}
