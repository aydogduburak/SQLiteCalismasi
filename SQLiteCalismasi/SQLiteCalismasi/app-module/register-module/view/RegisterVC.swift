//
//  RegisterVC.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import UIKit

class RegisterVC: UIViewController {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfPasswordConfirm: UITextField!
    
    var registerPresenterNesnesi : ViewToPresenterRegisterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        RegisterRouter.createModule(ref: self)
    }

    @IBAction func buttonRegister(_ sender: Any) {
        if let un = tfName.text, let ue = tfEmail.text, let up = tfPassword.text, let upc = tfPasswordConfirm.text {
            if up == upc {
                registerPresenterNesnesi?.kisiKayit(name: un, email: ue, password: up)
                navigationController?.popToRootViewController(animated: true)
            }else {
                print("Şifreler uyuşmuyor.")
            }
        }
    }
}
