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
    var hub  : MBProgressHUD!
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
        self.hub = MBProgressHUD.showAdded(to: self.view, animated: true)
        hub.show(animated: true)
        print("startLogin")
    }
    func loginfinish(status: Bool, user: User?) {
        print("loginfinish")
        MBProgressHUD.hide(for: self.view, animated: true)
        if !status || user?.role != Role.librarian
        {
           self.hub = MBProgressHUD.showAdded(to: self.view, animated: true)
           hub.mode = .text
           hub.label.text = "Đăng nhập thất bại"
           hub.hide(animated: true, afterDelay: 2)
           return;
        }
        let userManager = UserManagerController(nibName: "UserManagerController", bundle: nil)
        self.present(userManager, animated: true, completion: nil)
    }
}
