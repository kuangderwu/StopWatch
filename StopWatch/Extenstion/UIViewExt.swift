//
//  UIViewExt.swift
//  StopWatch
//
//  Created by apple on 2018/10/10.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import UIKit

extension UIView {
    
    func fadeTo(duration: TimeInterval, alpha: CGFloat) {
        UIView.animate(withDuration: duration) {
            self.alpha = alpha
        }
    }
    
}
