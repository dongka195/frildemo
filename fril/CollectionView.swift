//
//  CollectionView.swift
//  fril
//
//  Created by Nguyễn Đình Đông on 8/18/17.
//  Copyright © 2017 Nguyễn Đình Đông. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView
{
    func _registerNib(_ name:AnyClass)
    {
       let nib = UINib(nibName: String(describing: name), bundle: nil)
       self.register(nib, forCellWithReuseIdentifier: String(describing: name))
    }
}
