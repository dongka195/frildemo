//
//  UITableView.swift
//  fril
//
//  Created by Nguyễn Đình Đông on 8/27/17.
//  Copyright © 2017 Nguyễn Đình Đông. All rights reserved.
//

import Foundation
extension UITableView
{
    func _register(_ clas : AnyClass){
        self.register(UINib(nibName: String(describing: clas), bundle: nil), forCellReuseIdentifier: String(describing: clas))
    }
}
