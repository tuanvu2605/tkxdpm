//
//  UserCell.swift
//  tkxdpm
//
//  Created by Tuan Vu on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var kind: UILabel!
    @IBOutlet weak var cardStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func display_(user : BookUser)
    {
        name.text = user.name
        kind.text = "\(user.role)"
        cardStatus.text = "Thẻ chưa kích hoạt"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
