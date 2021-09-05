//
//  DiagonalViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/09/05.
//

import UIKit
import SnapKit

class DiagonalViewController: UIViewController {
    
    let imageView = DiagonalImageView(image: UIImage(named: "bgV1"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.innerHeight = 200
        
        [imageView].forEach {
            self.view.addSubview($0)
        }

        imageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(400)
            $0.centerY.equalToSuperview().offset(-100)
        }
    }
}

