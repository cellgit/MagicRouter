//
//  JiFenViewController.swift
//  iPhone_C
//
//  Created by liuhongli on 2023/2/13.
//  Copyright © 2023 freedom HOU. All rights reserved.
//

import UIKit

class JiFenViewController: UIViewController {

    private let titleName: String
    
    init(titleName: String) {
        self.titleName = titleName
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "积分"
        initialUI()
    }
    
    func initialUI() {
        view.backgroundColor = .white
        
    }
    

}

extension JiFenViewController {
    /// 如果需要参数,则重写该方法进行参数获取
    /// - Parameters:
    ///   - parameters: 传入的参数
    ///   - callBackParameters: 数据回调
    /// - Returns: UIViewController
    override class func routerController(_ parameters: [String : Any]? = nil, callBackParameters: (([String : Any]) -> Void)? = nil) -> UIViewController? {
        // 解析 parameters,根据key获取值
        if let titleName = parameters?["titleName"] as? String {
            return JiFenViewController.init(titleName: titleName)
        } else {
            // 如果参数获取错误,则无法初始化控制器,则返回nil
            return nil
        }
    }
}
