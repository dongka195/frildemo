//
//  DetailVC.swift
//  fril
//
//  Created by Nguyễn Đình Đông on 8/27/17.
//  Copyright © 2017 Nguyễn Đình Đông. All rights reserved.
//

import UIKit

class DetailVC: BaseViewController ,UIScrollViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var stretchyView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    private let kTableHeaderHeight: CGFloat = 300.0
    var headerView: UIView!

    var overlayView:UIView!
    var offsetDenominator:CGFloat!
    let TARGER_COLOR = UIColor.red
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.tableView._register(PriceCell.self)
        self.tableView._register(ShareCell.self)
        self.tableView._register(InfoCell.self)
        self.tableView._register(CateCell.self)
        self.tableView._register(DetailProduct.self)
        self.tableView._register(LoveCell.self)
        self.tableView._register(UserPostCell.self)
        self.tableView._register(CommentCell.self)
        self.tableView._register(MoreCell.self)

        

        

        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
        
        if let navCtrl = self.navigationController {
            self.offsetDenominator = headerView.frame.size.height + navCtrl.navigationBar.frame.height
            
//            let targetCIColor = CIColor(CGColor: self.TARGER_COLOR.CGColor)
            let targetCIColor = CIColor(cgColor: self.TARGER_COLOR.cgColor)
            let overlayColor = UIColor(red: targetCIColor.red, green: targetCIColor.green, blue: targetCIColor.blue, alpha: 0.0)
            
            self.overlayView = UIView(frame: CGRect(x: 0, y: 0, width: headerView.frame.width, height: 64))
            self.overlayView.backgroundColor = overlayColor
            
            self.view.addSubview(self.overlayView)
        }
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = UIColor.blue
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
      

    }
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: UIScreen.main.bounds.size.width, height: kTableHeaderHeight + 40)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + 40
        }
        
        headerView.frame = headerRect
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.updateHeaderView()
        print(self.tableView.contentOffset.y)

        
        if let navCtrl = self.navigationController, let breakpoint = offsetDenominator{
            let alpha = scrollView.contentOffset.y / breakpoint
            
            if alpha >= 1.0  {
                navCtrl.navigationBar.backgroundColor = self.TARGER_COLOR
            } else {
                let targetCIColor = CIColor(cgColor: self.TARGER_COLOR.cgColor)
                let overlayColor = UIColor(red: targetCIColor.red, green: targetCIColor.green, blue: targetCIColor.blue, alpha: alpha)
                
                self.overlayView.backgroundColor = overlayColor
                navCtrl.navigationBar.backgroundColor = UIColor.clear
            }
        }
        
        
    }
    
}
extension DetailVC : UITableViewDataSource, UITableViewDelegate
{
    
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1
        {
            return 1
        }else if section == 2 || section == 5 || section == 6
        {
            return 2
        }else if section == 3 || section == 4
        {
            return 1
        }
        
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.setCell(tableView:tableView,indexPath:indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1
        {
        
                return 80

        }else if indexPath.section == 2
        {
            if indexPath.row == 0
            {
                return 30
            }
            else
            {
                return 500
            }

        }else if indexPath.section == 3
        {
            return 320
        }
        else if indexPath.section == 4
        {
            return 65
        }else if indexPath.section == 5
        {
            if indexPath.row == 0
            {
                return 30
            }
            else
            {
                return 200
            }
        }
        else if indexPath.section == 6
        {
            if indexPath.row == 0
            {
                return 30
            }
            else
            {
                return 100
            }

        }
        else if indexPath.section == 7
        {
            if indexPath.row == 0
            {
                return 30
            }
            else
            {
                return 130
            }
            
        }

        return 80
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5

    }
}
extension DetailVC
{
    
    func setCell( tableView:UITableView, indexPath: IndexPath) ->UITableViewCell
    {
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PriceCell", for: indexPath) as! PriceCell
            return cell
            
        }else if indexPath.section == 1
        {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ShareCell", for: indexPath) as! ShareCell
                return cell
            
        }else if indexPath.section == 2
        {
            if indexPath.row == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CateCell", for: indexPath) as! CateCell
                return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoCell
                return cell
            }

        }else if indexPath.section == 3
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailProduct", for: indexPath) as! DetailProduct
            return cell
        }else if indexPath.section == 4
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoveCell", for: indexPath) as! LoveCell
            return cell
        }else if indexPath.section == 5
        {
            if indexPath.row == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CateCell", for: indexPath) as! CateCell
                return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserPostCell", for: indexPath) as! UserPostCell
                return cell
            }
        }else if indexPath.section == 6
        {
            if indexPath.row == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CateCell", for: indexPath) as! CateCell
                return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
                return cell
            }

        }
        else
        {
            //Last section
            if indexPath.row == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CateCell", for: indexPath) as! CateCell
                return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MoreCell", for: indexPath) as! MoreCell
                return cell
            }
        }
    }
    

}




