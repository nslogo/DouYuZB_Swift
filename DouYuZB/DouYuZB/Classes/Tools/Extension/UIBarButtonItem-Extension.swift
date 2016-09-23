//
//  UIBarButtonItem-Extension.swift
//  DouYuZB
//
//  Created by nie on 16/9/19.
//  Copyright © 2016年 ZoroNie. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    /*
    class func creatItem (imageName : String, hightImageName : String, size : CGSize) -> UIBarButtonItem {
        
        let btn  = UIButton()
        btn.setImage(UIImage(named : imageName), for: .normal)
        btn.setImage(UIImage(named : hightImageName), for: .highlighted)
        btn.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        return UIBarButtonItem(customView: btn)
    }
    */
    
    //便利构造函数 1 convenience开头 2 在构造函数中必须调用一个设计的构造函数（self）
    //首页右侧item数组
    convenience init(imageName : String, hightImageName : String, size : CGSize) {
        let btn  = UIButton()
        btn.setImage(UIImage(named : imageName), for: .normal)
        btn.setImage(UIImage(named : hightImageName), for: .highlighted)
        btn.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        self.init(customView : btn)
    }
    
    
    //首页左侧logo item
    convenience init(logoImageName : String) {
        let btn  = UIButton()
        btn.setImage(UIImage(named : logoImageName), for: .normal)
        btn.sizeToFit()
        self.init(customView : btn)
    }
}
