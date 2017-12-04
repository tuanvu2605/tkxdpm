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
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: userCellId) as! UserCell
        let user  = listUser[indexPath.row]
        cell.display_(user: user)
        return cell
    }
    
}
