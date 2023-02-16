//
//  ViewController.swift
//  MagicRouter
//
//  Created by cellgit on 02/14/2023.
//  Copyright (c) 2023 cellgit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var button1: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setTitle("积分", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 44/2
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.addTarget(self, action: #selector(button1Action(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setTitle("勋章", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 44/2
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.addTarget(self, action: #selector(button2Action(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView1: UIStackView = {
        let stack = UIStackView.init(arrangedSubviews: [button1, button2])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        return stack
    }()
    
    @objc
    func button1Action(sender: UIButton) {
        let parameters = ["titleName": "积分商城"]
        self.pushRouterControllerWithUrl("app_jifen://jifen", parameters: parameters, animated: true) { parameters in
            // 页面参数回调
            print("==========")
            print("页面参数回调")
            print("当前页面: A_Controller")
            print("参数来自: apps://pathA_Detail")
            print("参数内容: \(parameters)")
            print("==========")
        }
    }
    @objc
    func button2Action(sender: UIButton) {
        self.pushRouterControllerWithUrl("app_medals://medals", parameters: nil, animated: true) { parameters in
            // 页面参数回调
            print("==========")
            print("页面参数回调")
            print("当前页面: A_Controller")
            print("参数来自: apps://pathA_Detail")
            print("参数内容: \(parameters)")
            print("==========")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController"
        initialUI()
    }
    
    func initialUI() {
        view.addSubview(stackView1)
        stackView1.frame = CGRect(x: 100, y: 200, width: 200, height: 88)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

