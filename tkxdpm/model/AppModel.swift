//
//  AppModel.swift
//  tkxdpm
//
//  Created by TuanAnh on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

class AppModel: NSObject {
    
    static let shared =  AppModel()
    var listAccount = [Account]()
    var listUser = [User]()
    override init() {
        
        let libAccount = Account(username: "librarian", password: "lib12345")
        let adminAccount = Account(username: "admin", password: "lib12345")
        let customerAccount = Account(username: "customer", password: "lib12345")
        let guestAccount = Account(username: "guest", password: "lib12345")
        listAccount = [libAccount,adminAccount,customerAccount,guestAccount]
        
        let card = Card(id: 1, isActive: false)
        
        
        
        let book1 = Book(name: "đại số tuyến tính", id: 1, kind: .Math, author: "AuthorX", nxb: "nhà xuất bản bách khoa")
        let book2 = Book(name: "vật lý đại cương", id: 2, kind: .Biographies, author: "AuthorX", nxb: "nhà xuất bản bách khoa")
        let book3 = Book(name: "Titanic", id: 3, kind: .Drama, author: "AuthorX", nxb: "nhà xuất bản hà nội")
        let book4 = Book(name: "chiến tranh thế giới thứ 4", id: 4, kind: .History, author: "AuthorX", nxb: "nhà xuất bản hà nội")
        let listBook1 = [book1 ,book2]
        let listBook2 = [book3 , book4]
        let lib = Librarian(id: 1, role: .librarian, name: "Librarian", username: "librarian", isBlocked: false, isDeleted: false)
        let admin = Admin(id: 2, role: .admin, name: "admin", username: "admin", isBlocked: false, isDeleted: false)
        let customer = Customer(id:3 , role: .customer, name: "Customer", username: "customer", isBlocked: false, isDeleted: false)
        customer.studentId = "20146046"
        customer.birthDate = "26/05/1995"
        customer.card = card
        customer.listBook = listBook1
        
        let guest = Guest(id: 4, role: .guest, name: "guest", username: "guest", isBlocked: false, isDeleted: false)
        guest.listBook = listBook2
        listUser = [lib,admin,customer,guest]
        
        
        
        
    }
    

}
