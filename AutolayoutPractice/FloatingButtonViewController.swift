//
//  FloatingButtonViewController.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/08/15.
//

import UIKit
import SnapKit

class FloatingButtonViewController: UIViewController {
    
    let backgroundImage = UIImageView()
    let floatingButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        backgroundImage.image = UIImage(named: "bgV1")
        floatingButton.setImage(UIImage(named: "add_icon_green"), for: .normal)
        floatingButton.contentMode = .scaleAspectFit
        
        [backgroundImage, floatingButton].forEach {
            self.view.addSubview($0)
        }
    
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        floatingButton.snp.makeConstraints {
            $0.width.height.equalTo(60)
            $0.right.equalToSuperview().offset(-24)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-16)
        }
        
        floatingButton.addTarget(self, action: #selector(didTapFloatingButton), for: .touchUpInside)

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func didTapFloatingButton(sender: UIButton) {
        let viewController = FloatedButtonViewController()
        viewController.modalPresentationStyle = .overCurrentContext
        self.present(viewController, animated: false, completion: nil)
        
    }
}



// MARK: - 플로팅 된 화면
class FloatedButtonViewController: UIViewController {
    let blur = UIVisualEffectView(effect: UIBlurEffect.init(style: .dark))
    let floatingButton = UIButton()
    let food1Button = UIButton()
    let food2Button = UIButton()
    let food3Button = UIButton()
    
    var btn1CenterY: Constraint?
    var btn2CenterY: Constraint?
    var btn3CenterY: Constraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    
        floatingButton.setImage(UIImage(named: "add_icon_green"), for: .normal)
        floatingButton.contentMode = .scaleAspectFit
        
        let buttons = [food1Button, food2Button, food3Button]
        buttons.enumerated().forEach {
            $0.element.setImage(UIImage(named: "food\($0.offset + 1)"), for: .normal)
            $0.element.contentMode = .scaleAspectFit
        }
        
        ([blur] + buttons + [floatingButton]).forEach {
            self.view.addSubview($0)
        }
            
        floatingButton.snp.makeConstraints {
            $0.width.height.equalTo(60)
            $0.right.equalToSuperview().offset(-24)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-16)
        }
        
        buttons.forEach {
            $0.snp.makeConstraints {
                $0.width.height.equalTo(50)
                $0.centerX.equalTo(floatingButton)
            }
        }
        
        blur.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        food1Button.snp.makeConstraints {
            self.btn1CenterY = $0.centerY.equalTo(floatingButton).offset(0).constraint
        }

        food2Button.snp.makeConstraints {
            self.btn2CenterY = $0.centerY.equalTo(floatingButton).offset(0).constraint
        }

        food3Button.snp.makeConstraints {
            self.btn3CenterY = $0.centerY.equalTo(floatingButton).offset(0).constraint
        }

        floatingButton.addTarget(self, action: #selector(didTapFloatingButton), for: .touchUpInside)
    }

    @objc func didTapFloatingButton(sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.btn1CenterY?.update(offset: -80)
            self.btn2CenterY?.update(offset: -160)
            self.btn3CenterY?.update(offset: -240)
            
            self.view.layoutIfNeeded()
        }
    }
}
