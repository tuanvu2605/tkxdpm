//
//  UserManagerController.swift
//  tkxdpm
//
//  Created by TuanAnh on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

class UserManagerController: UIViewController {
    @IBOutlet var tbl: UITableView!
    @IBOutlet var lblName: UILabel!
    let  userCellId = "userCellId"
    var listUser : [BookUser]!
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl.delegate = self
        tbl.dataSource = self
        tbl.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: userCellId)
        listUser = AppModel.shared.listBookUser
        tbl.reloadData()
        // Do any additional setup after loading the view.
    }



}

extension UserManagerController : UITableViewDelegate , UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUser.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: userCellId) as! UserCell
        let user  = listUser[indexPath.row]
        cell.display_(user: user)
        cell.delagate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user  = listUser[indexPath.row]
//        manager(user: user)
        let bookController = UserBooksController(nibName: "UserBooksController", bundle: nil)
        bookController.listBooks = user.listBook
        self.present(bookController, animated: true, completion: nil)
    }
    
}


extension UserManagerController : UserCellDelegate
{
    func buttonSettingDidTap(cell: UITableViewCell) {
        let indpx = self.tbl.indexPath(for: cell)
        let user = self.listUser[(indpx?.row)!]
        manager(user: user)
    }
}

extension UserManagerController
{
    func manager(user : BookUser)
    {
        let alertController = UIAlertController(title: "Quản lý người dùng", message: "Chọn action", preferredStyle: .actionSheet)
        let blockAction = UIAlertAction(title: "Block Tài khoản", style: .default) { (action) in
           AppModel.shared.lib.activeUser(u: user)
            self.tbl.reloadData()
        }
        
        let activeAction = UIAlertAction(title: "Kích hoạt thẻ", style: .default) { (action) in
          
            AppModel.shared.lib.activeCard(u: user)
            self.tbl.reloadData()
        }
        
        let deleteAccount = UIAlertAction(title: "Xóa tài khoản", style: .destructive) { (action) in
            AppModel.shared.lib.deleteUser(u: user)
            self.tbl.reloadData()
        }
        let cancel = UIAlertAction(title: "Huỷ", style: .cancel) { (action) in
            
        }
        
        alertController.addAction(blockAction)
        alertController.addAction(activeAction)
        alertController.addAction(deleteAccount)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
}
