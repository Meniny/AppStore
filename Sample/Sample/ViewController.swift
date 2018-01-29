//
//  ViewController.swift
//  Sample
//
//  Created by 李二狗 on 2018/1/29.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

import UIKit
import AppStore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        AppStore.shared.checkVersion(checkType: .immediately)
    }

}

