//
//  UserManagerPresenter.swift
//  tkxdpm
//
//  Created by TuanAnh on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

protocol UserManagerView : NSObjectProtocol {
    func startLoading()
    func finishLoading(users : [User])
}

class UserManagerPresenter: NSObject {

    weak fileprivate var userManagerView : UserManagerView?
    
    func attach(userManagerView : UserManagerView)
    {
        self.userManagerView = userManagerView
    }
    
    func getUsers()
    {
       userManagerView?.startLoading()
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            self.userManagerView?.finishLoading(users: AppModel.shared.listUser)
        }
    }
    
    
    
}
