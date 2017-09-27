//
//  ItemCell.swift
//  fril
//
//  Created by Nguyễn Đình Đông on 8/18/17.
//  Copyright © 2017 Nguyễn Đình Đông. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var loveButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.changeLoveButtonColor()
    
    }
    
    
    func changeLoveButtonColor()
    {
        let stencil = self.loveButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.loveButton.setImage(stencil, for: .normal)
        self.loveButton.tintColor = UIColor.white
    }
}
