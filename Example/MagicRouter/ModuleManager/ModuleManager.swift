//
//  ModuleManager.swift
//  iPhone_C
//
//  Created by liuhongli on 2023/2/16.
//  Copyright © 2023 freedom HOU. All rights reserved.
//

import Foundation
import UIKit

class ModuleManager: NSObject {
    /// 注册所有模块
    static func register() {
        Module_JiFen.registerPages()
        Module_Medals.registerPages()
    }
    
}
