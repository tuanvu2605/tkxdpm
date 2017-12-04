//
//  LoginController.swift
//  tkxdpm
//
//  Created by TuanAnh on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var btnContinue: UIButton!
     fileprivate let loginPresenter = LoginPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        loginPresenter.attach(loginView: self)
        

    }
    
    func setupUI()
    {
        btnContinue.layer.cornerRadius = 5.0
    }

    
    @IBAction func btnContinueDidTap(_ sender: Any) {
        loginPresenter.login(u: txtUsername.text!, p: txtPassword.text!)
    }
    


}

extension LoginController : LoginView
{
    func startLogin() {
        print("startLogin")
    }
    func loginfinish(status: Bool, user: User?) {
        print("loginfinish")
    }
}
