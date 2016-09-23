//
//  MainViewController.swift
//  DouYuZB
//
//  Created by nie on 16/9/19.
//  Copyright © 2016年 ZoroNie. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVC(storyName: "Home")
        addChildVC(storyName: "Live")
        addChildVC(storyName: "Follow")
        addChildVC(storyName: "Profile")
    }
    //MARK : - 通过storyBoard创建架构
    private func addChildVC(storyName : String) {
        
        //获取子控制器
        let childVC = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        //将子控制器添加到父控制器
        addChildViewController(childVC)
        
    }

}
