//
//  CustomView.swift
//  CustomView
//
//  Created by Shawn Roller on 1/25/18.
//  Copyright © 2018 Shawn Roller. All rights reserved.
//

import UIKit

@IBDesignable

class CustomView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 12
    @IBInspectable var shadow: Bool = true
    @IBInspectable var transparent: Bool = true
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layer: CALayer = self.layer
        self.clipsToBounds = true
        layer.masksToBounds = false
        layer.cornerRadius = self.cornerRadius
        layer.masksToBounds = false
        
        if self.shadow {
            layer.shadowOffset = CGSize(width: 0, height: 0)
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 1.0
            layer.shadowOpacity = 0.35
            let roundedRect = CGRect(x: -1, y: 0, width: layer.bounds.width + 2, height: layer.bounds.height + 3)
            layer.shadowPath = UIBezierPath(roundedRect: roundedRect, cornerRadius: layer.cornerRadius).cgPath
        }
        
        if self.transparent {
            self.backgroundColor = UIColor.white.withAlphaComponent(0.35)
            let effect = UIBlurEffect(style: .light)
            let blurView = UIVisualEffectView(effect: effect)
            blurView.alpha = 0.7
            blurView.frame = self.bounds
            blurView.layer.cornerRadius = 12
            blurView.clipsToBounds = true
            self.insertSubview(blurView, at: 0)
        }
    }
    
}

