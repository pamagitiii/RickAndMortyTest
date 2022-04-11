//
//  UIView+.swift
//  RMTest
//
//  Created by Anatoliy on 11.04.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}
