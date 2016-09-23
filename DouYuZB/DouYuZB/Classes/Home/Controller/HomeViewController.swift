//
//  HomeViewController.swift
//  DouYuZB
//
//  Created by nie on 16/9/19.
//  Copyright © 2016年 ZoroNie. All rights reserved.
//

import UIKit

fileprivate let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {

    //MARK : - 懒加载属性 
    //pageTitleView {}()闭包
    fileprivate lazy var pageTitleView : PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    //pageContentView
    fileprivate lazy var pageContentView : PageContentView = {[weak self] in
        
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabBarH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        //确定所有的子控制器
        var childVCs = [UIViewController]()
        var recomeVC : RecommendViewController = RecommendViewController()
        childVCs.append(recomeVC)
        for _ in 0..<3 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVCs.append(vc)
        }
        let contentView = PageContentView(frame: contentFrame, childVCs: childVCs, parentViewController: self!)
        contentView.delegate = self
        
        return contentView
    }()
    
    //private let kItemMargin : CGFloat = 10
    //private let kItemW : CGFloat = (kScreenW - 3 * kItemMargin) / 2
    
    //fileprivate lazy var collectionView : UICollectionView = {[weak self] in
    
        //创建布局
       // let layout = UICollectionViewFlowLayout()
        //layout.itemSize = CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    
   // }()
    
    
    //MARK : - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置UI界面
        setupUI()
    }
}

// MARK: - 设置UI界面
extension HomeViewController {
    
    fileprivate func setupUI() {
        //不需要调整UIScrollView的内边距，UIScrollView在navigation下默认会加64
        automaticallyAdjustsScrollViewInsets = false
        
        //设置导航栏
        setupNavigationBar()
        
        //添加titleView
        view.addSubview(pageTitleView)
        
        //添加contentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.blue
    }
    
    
    private func setupNavigationBar() {
        
        //左侧的item 
        //自定义便利构造函数创建item
        navigationItem.leftBarButtonItem = UIBarButtonItem(logoImageName: "logo")
        
        //右侧的item数组
        let size = CGSize(width: 40, height: 40)
        //自定义类方法创建item
        //let historyItem = UIBarButtonItem.creatItem(imageName: "image_my_history", hightImageName: "Image_my_history_click", size: size)
        //自定义便利构造函数创建item
        let historyItem = UIBarButtonItem(imageName: "image_my_history", hightImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", hightImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", hightImageName: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
        
    
    }
}

// MARK: - 遵守的PageTitleViewDelegate协议 
extension HomeViewController : PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

// MARK:- 遵守PageContentViewDelegate协议
extension HomeViewController : PageContentViewDelegate {
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}















