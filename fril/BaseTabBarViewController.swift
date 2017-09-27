//
//  BaseTabBarViewController.swift
//  POK
//
//  Created by DONGKA on 4/26/17.
//  Copyright © 2017 DONGKA. All rights reserved.
//

import Foundation
import UIKit
import MMTabBarAnimation
import UIColor_Hex_Swift

class BaseTabBarViewController: MMTabBarAnimateController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setAnimate(index: 0, animate: .icon(type: .scale(rate: 1.2)))
        super.setAnimate(index: 1, animate: .icon(type: .scale(rate: 1.2)))
        super.setAnimate(index: 2, animate: .icon(type: .scale(rate: 1.2)))
        super.setAnimate(index: 3, animate: .icon(type: .scale(rate: 1.2)))
        super.setBadgeAnimate(index: 0, animate: .scale(rate: 1.2))
        super.setBadgeAnimate(index: 1, animate: .scale(rate: 1.2))
        super.setBadgeAnimate(index: 2, animate: .scale(rate: 1.2))
        super.setBadgeAnimate(index: 3, animate: .scale(rate: 1.2))
        
        self.tabBar.barTintColor = UIColor("#111111")
        self.tabBar.backgroundColor = UIColor("#111111")
        

    }
    
    
    
}
