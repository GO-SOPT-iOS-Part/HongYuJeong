//
//  UIView+.swift
//  Seminar_3
//
//  Created by 홍유정 on 2023/04/22.
//

import UIKit.UIView

extension UIView {
    
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}
