//
//  UserCell.swift
//  tkxdpm
//
//  Created by Tuan Vu on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

protocol UserCellDelegate {
   func  buttonSettingDidTap(cell : UITableViewCell )
}

class UserCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var kind: UILabel!
    @IBOutlet weak var cardStatus: UILabel!
    @IBOutlet var blockStatus: UILabel!

    @IBOutlet var deleteStatus: UILabel!
    var delagate : UserCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func display_(user : BookUser)
    {
        name.text = user.name
        if user.role == .customer
        {
          kind.text = "Thành Viên"
        }else
        {
          kind.text = "Khách"
        }
        if user.isBlocked
        {
            self.blockStatus.text = "Thẻ đang bị khóa"
        }else
        {
            self.blockStatus.text = "Thẻ đang hoạt động"
        }
        
        if user.isDeleted {
            self.deleteStatus.text = "Tài khoản bị xóa khỏi hệ thống"
        }else
        {
           self.deleteStatus.text = "Tài khoản đang hoạt động"
        }
        
        cardStatus.text = user.card.isActive ? "Thẻ đã kích hoạt" : "Thẻ chưa kích hoạt"
        
    }

    @IBAction func settingDidTap(_ sender: Any) {
        
        self.delagate?.buttonSettingDidTap(cell: self)
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
