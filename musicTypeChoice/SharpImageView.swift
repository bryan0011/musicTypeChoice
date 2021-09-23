//
//  SharpImageView.swift
//  SharpImageView
//
//  Created by Bryan Kuo on 2021/7/22.
//

import UIKit

class SharpImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height*0.25))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: 0, y: bounds.height*0.75))
        path.close()
        let sharpLayer = CAShapeLayer()
        sharpLayer.path = path.cgPath
        layer.mask = sharpLayer
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
