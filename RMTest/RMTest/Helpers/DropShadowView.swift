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
        
        // further optimization by rasterizing the container view and its shadow into bitmap instead of dynamically rendering it every time
        // take note that the rasterized bitmap will be saved into memory and it might take quite some memory if you have many cells
        
        // self.layer.shouldRasterize = true
        // self.layer.rasterizationScale = UIScreen.main.scale
    }

}
