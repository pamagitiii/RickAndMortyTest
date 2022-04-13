//
//  DropShadowView.swift
//  RMTest
//
//  Created by Anatoliy on 11.04.2022.
//

import UIKit

class DropShadowView: UIView {
    var presetCornerRadius : CGFloat = 40.0
    
    override var bounds: CGRect {
        didSet {
            setupShadowPath()
        }
    }
    
    private func setupShadowPath() {
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: presetCornerRadius).cgPath
    }

}
