//
//  Module_Medals.swift
//  iPhone_C
//
//  Created by liuhongli on 2023/2/16.
//  Copyright © 2023 freedom HOU. All rights reserved.
//

/*
 url: app_medals://medals
 */

import Foundation
import MagicRouter

//MARK: - 模块积分
public class Module_Medals: RouterMoudleProtocol {
    public var moudle: String { "Module_Medals" }
    public var scheme: String { "app_medals" }
    public var pathDic: [String: String] {
        ["medals": "MedalsViewController"]
    }
    
    public class func registerPages() {
        Module_Medals().registerPages()
    }
}
