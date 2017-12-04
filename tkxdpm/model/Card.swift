//
//  Card.swift
//  tkxdpm
//
//  Created by TuanAnh on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

class Card: NSObject {

    var id  = Int()
    var isActive = Bool()
    
    init(id : Int , isActive : Bool) {
        self.id = id
        self.isActive = isActive
    }
    
}
