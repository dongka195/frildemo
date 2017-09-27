//
//  HomeVC.swift
//  fril
//
//  Created by Nguyễn Đình Đông on 8/16/17.
//  Copyright © 2017 Nguyễn Đình Đông. All rights reserved.
//

import UIKit
import CarbonKit
import BBBadgeBarButtonItem
class HomeVC: BaseViewController ,CarbonTabSwipeNavigationDelegate{
    
    var items = ["Đồ nam", "Hàng mới", "Hanmade","Đồ nữ"]
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCarbon()
        self.setRightBarButtonItem()
        
        
        
        
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        switch (index) {
        case 0:
            let vc = storyboard.instantiateViewController(withIdentifier: "SubHomeVC") as! SubHomeVC
            return vc
        case 1:
            let vc = storyboard.instantiateViewController(withIdentifier: "SubHomeVC") as! SubHomeVC
            return vc
        default:
            let vc = storyboard.instantiateViewController(withIdentifier: "SubHomeVC") as! SubHomeVC
            return vc
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setCarbon()
    {
        
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.currentTabIndex = 1
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        
        
        let menuTabItems:UInt = UInt(items.count)
        let totalWidth = self.view.frame.width
        let tabWidth = (totalWidth / 3)
        for index:UInt in 0 ..< menuTabItems {
            carbonTabSwipeNavigation.carbonSegmentedControl!.setWidth(tabWidth, forSegmentAt: Int(index))
            
        }
        
    }
    
    func setRightBarButtonItem()
    {
        let customButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        customButton.setImage(UIImage(named: "shopping-cart"), for: .normal)
        customButton.addTarget(self, action: #selector(rightButtonPress), for: .touchUpInside)
        let barButton = BBBadgeBarButtonItem(customUIButton: customButton)
        barButton?.badgeValue = "5"
        barButton?.badgeOriginX = 13
        barButton?.badgeOriginY = -9
        self.navigationItem.rightBarButtonItem = barButton
        
        
        let stencil = customButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
        customButton.setImage(stencil, for: .normal)
        customButton.tintColor = UIColor.blue

        

    }
    func rightButtonPress()
    {
        print("Touch")

    }
    
}
