//
//  Account.swift
//  tkxdpm
//
//  Created by TuanAnh on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

class Account: NSObject {
    
    var username = String()
    var password = String()
    
    init(username : String , password : String) {
        self.username = username
        self.password = password
    }
    
}
