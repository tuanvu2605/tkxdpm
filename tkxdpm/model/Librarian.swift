//
//  Librarian.swift
//  tkxdpm
//
//  Created by TuanAnh on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

class Librarian: User {
    
    func activeUser(u : BookUser)
    {
        u.isBlocked = false
        
    }
    func deleteUser (u : BookUser)
    {
        u.isDeleted = true
    }
    
    func activeCard (u : BookUser)
    {
        u.card.isActive = true
    }

}
