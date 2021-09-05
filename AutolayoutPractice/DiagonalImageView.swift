//
//  DiagonalImageView.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/09/05.
//

import UIKit

class DiagonalImageView: UIImageView {
//    BezierPath
//    Path -> Layer
//    Layer -> Mask
    var innerHeight:CGFloat = 0

    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: .init(x: self.bounds.width, y: .zero))
        path.addLine(to: .init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: .init(x: .zero, y: self.bounds.height - self.innerHeight))
        path.close()
        
        return path
    }
    
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        return shapeLayer
    }
    
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
    
    override func layoutSubviews() {
        self.makeMask()
    }
}
