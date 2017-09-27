//
//  DetailProduct.swift
//  fril
//
//  Created by Nguyễn Đình Đông on 8/28/17.
//  Copyright © 2017 Nguyễn Đình Đông. All rights reserved.
//

import UIKit

class DetailProduct: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    var imvArrays = ["","diamond","delivery-truck","box","calendar","pin"]
    var infoArrays = ["","Loại sản phẩm","Chi phí gửi hàng","Cách gửi hàng","Ngày gửi hàng","Nơi bán"]
    var detailArrays = ["","Hàng mới","Miễn phí (CK)","Chưa quyết định","Khoảng 1 - 2 ngày","Hà Nội"]
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.tableView._register(PaymentCell.self)
        self.tableView._register(CategoryCell.self)

        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension DetailProduct : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            return cell

        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell", for: indexPath) as! PaymentCell
            cell.imv.image = UIImage(named: self.imvArrays[indexPath.row])
            cell.label.text = self.infoArrays[indexPath.row]
            cell.descriptionLabel.text = self.detailArrays[indexPath.row]
            return cell
        }
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 100
        }
        return 45
    }
}
