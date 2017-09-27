//
//  UserPostCell.swift
//  fril
//
//  Created by Nguyễn Đình Đông on 8/29/17.
//  Copyright © 2017 Nguyễn Đình Đông. All rights reserved.
//

import UIKit

class UserPostCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()

        self.tableView._register(UserCell.self)
        self.tableView._register(StatusCell.self)

        

        self.tableView.delegate = self
        self.tableView.dataSource = self
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension UserPostCell : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
            return cell
        }else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StatusCell", for: indexPath) as! StatusCell
            return cell
        }
        
     }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

