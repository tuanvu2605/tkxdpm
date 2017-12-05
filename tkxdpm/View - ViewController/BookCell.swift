//
//  BookCell.swift
//  tkxdpm
//
//  Created by Tuan Vu on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell {
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func display_(book : Book)
    {
        self.bookName.text = book.name
    }

}
