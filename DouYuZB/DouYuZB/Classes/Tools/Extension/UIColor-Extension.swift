//
//  UIColor-Extension.swift
//  DouYuZB
//
//  Created by nie on 16/9/20.
//  Copyright © 2016年 ZoroNie. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0 , blue: b / 255.0, alpha: 1)
    }
}
