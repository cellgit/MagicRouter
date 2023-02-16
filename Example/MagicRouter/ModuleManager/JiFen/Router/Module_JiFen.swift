//
//  Module_JiFen.swift
//  iPhone_C
//
//  Created by liuhongli on 2023/2/16.
//  Copyright © 2023 freedom HOU. All rights reserved.
//


/*
 url:app_jifen://jifen
 
 注: 每个模块的 scheme 不可以相同
 */

import Foundation
import MagicRouter

//MARK: - 模块积分
public class Module_JiFen: RouterMoudleProtocol {
    public var moudle: String { "Module_JiFen" }
    public var scheme: String { "app_jifen" }
    public var pathDic: [String: String] {
        ["jifen": "JiFenViewController"]
    }
    
    public class func registerPages() {
        Module_JiFen().registerPages()
    }
}
