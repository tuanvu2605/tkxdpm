//
//  User.swift
//  tkxdpm
//
//  Created by TuanAnh on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

enum Role {
    case librarian
    case admin
    case customer
    case guest
}

class User: NSObject {
    
    var id = Int()
    var role : Role!
    var name = String()
    var username = String()
    var isBlocked = false
    var isDeleted = false
    
    init(id : Int , role : Role , name : String , username:String , isBlocked : Bool , isDeleted : Bool) {
        self.id = id
        self.role = role
        self.name = name
        self.username = username
        self.isBlocked = isBlocked
        self.isDeleted = isDeleted

    }

}
