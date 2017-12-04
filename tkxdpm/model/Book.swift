//
//  Book.swift
//  tkxdpm
//
//  Created by TuanAnh on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

enum Kind {
    case Drama
    case Math
    case History
    case Biographies
}

class Book: NSObject {
    
    var name  = String()
    var id = Int()
    var kind : Kind!
    var author = String()
    var nxb = String()
    
    init(name : String , id : Int , kind : Kind , author : String , nxb :String) {
        
        self.name = name
        self.id = id
        self.kind = kind
        self.author = author
        self.nxb = nxb;
    }
    
    

}
