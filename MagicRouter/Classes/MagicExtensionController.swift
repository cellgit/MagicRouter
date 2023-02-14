//
//  MagicExtensionController.swift
//  MagicRouter_Example
//
//  Created by liuhongli on 2023/2/14.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

//MARK: - 跳转页面
extension UIViewController {
    /**
     返回到上一个页面
     */
    @objc open func dismissRouterController(animated: Bool) {
        let children = self.navigationController?.children
        if children?.count ?? 0 > 1 && children?.last == self {
            self.navigationController?.popViewController(animated: animated)
        }else {
            self.dismiss(animated: animated, completion: nil)
        }
    }
    
    /**
     通过 url 的方式 present 一个控制器
     
     - 可重写：重写需要在最后调用 super 方法实现跳转
     
     - parameter url: 路由
     - parameter parameters: 可选参数
     - parameter animated: 是否执行动画
     - parameter callBackParameters: 目标参数回调
     */
    @objc open func presentRouterControllerWithUrl(_ url: String, parameters: [String: Any]? = nil, animated: Bool = true, callBackParameters: (([String: Any]) -> Void)? = nil) {
        presentRouterController(MagicRouter.shared.viewController(url, parameters: parameters, callBackParameters: callBackParameters), animated: animated)
    }
    
    /**
     通过 viewController 的方式 present 一个控制器
     
     - 可重写：重写需要在最后调用 super 方法实现跳转
     
     - parameter viewController: target viewController
     - parameter animated: 是否执行动画
     */
    @objc open func presentRouterController(_ viewController: UIViewController?, animated: Bool = true) {
        guard let vc = viewController else {
            // 找不到控制器，发送错误通知
            MagicRouter.shared.postRouterErrorNotification()
            return
        }
        
        present(vc, animated: animated, completion: nil)
    }
    
    /**
     通过 url 的方式 push 一个控制器, 需要带有 navigationController
     
     - 可重写：重写需要在最后调用 super 方法实现跳转
     
     - parameter url: 路由
     - parameter parameters: 可选参数
     - parameter animated: 是否执行动画
     - parameter callBackParameters: 目标参数回调
     */
    @objc open func pushRouterControllerWithUrl(_ url: String, parameters: [String: Any]? = nil, animated: Bool = true, callBackParameters: (([String: Any]) -> Void)? = nil) {
        pushRouterController(MagicRouter.shared.viewController(url, parameters: parameters, callBackParameters: callBackParameters), animated: animated)
    }
    
    /**
     通过 viewController 的方式 push 一个控制器, 需要带有 navigationController
     
     - 可重写：重写需要在最后调用 super 方法实现跳转
     
     - parameter viewController: target viewController
     - parameter animated: 是否执行动画
     */
    @objc open func pushRouterController(_ viewController: UIViewController?, animated: Bool = true) {
        guard let navigationController = self.navigationController else {
            // 找不到 navigationController 发送错误通知
            MagicRouter.shared.postRouterErrorNotification()
            return
        }
        
        guard let vc = viewController else {
            // 找不到控制器，发送错误通知
            MagicRouter.shared.postRouterErrorNotification()
            return
        }
        
        navigationController.pushViewController(vc, animated: animated)
    }
    
    
}

//MARK: - 获取控制器
extension UIViewController {
    /**
     返回当前的控制器
     可通过重写该方法，对传入的参数进行初始化，赋值等操作
     
     - 可重写：重写不需要调用 super 方法
     
     - parameter parameters: 可选参数
     - returns: 返回一个 UIViewController 控制器
     */
    @objc open class func routerController(_ parameters: [String: Any]? = nil, callBackParameters: (([String: Any]) -> Void)? = nil) -> UIViewController? {
        // 返回一个控制器
        return self.init()
    }
    
    /**
     通过 url 获取目标控制器
     
     - parameter url: 路由
     - parameter parameters: 传参
     - parameter callBackParameters: 目标参数回调
     
     - returns: 返回一个 UIViewController 控制器
     */
    @objc open func viewController(_ url: String, parameters: [String : Any]? = nil, callBackParameters: (([String: Any]) -> Void)? = nil) -> UIViewController? {
        MagicRouter.shared.viewController(url, parameters: parameters, callBackParameters: callBackParameters)
    }
}
