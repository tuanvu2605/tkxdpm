//
//  LoginPresenter.swift
//  tkxdpm
//
//  Created by TuanAnh on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

protocol LoginView : NSObjectProtocol {
    
    func startLogin()
    func loginfinish(status : Bool , user : User?)
    
}

class LoginPresenter: NSObject {
    
    weak fileprivate var loginView : LoginView?
    
    func attach(loginView : LoginView)
    {
        self.loginView = loginView
    }
    
    func login(u : String , p : String)
    {
        loginView?.startLogin()
        let deadlineTime = DispatchTime.now() + .seconds(3)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
          
            var userTemp : User?
            for account in AppModel.shared.listAccount
            {
                if (account.username == u && account.password == p)
                {
                    for userModel in AppModel.shared.listUser
                    {
                        if userModel.username == u
                        {
                            userTemp = userModel
                        }
                    }
                }
            }
            if userTemp != nil
            {
                self.loginView?.loginfinish(status: true, user: userTemp!)
            }else
            {
                self.loginView?.loginfinish(status: false, user: nil)
            }
            
            
            
        }
    }
    
}
