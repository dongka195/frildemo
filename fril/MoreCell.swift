//
//  MoreCell.swift
//  fril
//
//  Created by Nguyễn Đình Đông on 9/11/17.
//  Copyright © 2017 Nguyễn Đình Đông. All rights reserved.
//

import UIKit

class MoreCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Chỉnh sửa khoảng các giữa các cell
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let f = contentView.frame
        let fr = UIEdgeInsetsInsetRect(f, UIEdgeInsetsMake(0, 0, 0, 0))
        contentView.frame = fr
    }

    
    
}
