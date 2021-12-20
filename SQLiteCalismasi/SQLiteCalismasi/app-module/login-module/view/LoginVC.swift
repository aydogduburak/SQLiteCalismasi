//
//  ViewController.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    var loginPresenterNesnesi : ViewToPresenterLoginProtocol?
    var kisi : Kisiler?
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        veriTabaniKopyala()
        LoginRouter.createModule(ref: self)
        
        if ud.bool(forKey: "isLogin") {
            loginPresenterNesnesi?.login(email: ud.string(forKey: "email")!)
            performSegue(withIdentifier: "toNotlar", sender: kisi)
        }
    }
    
    func veriTabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "Notlar", ofType: ".sqlite")
        let hedef = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedef).appendingPathComponent("Notlar.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veri tabanı zaten var")
        }else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch {
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNotlar" {
            let kisi = sender as? Kisiler
            let gidilecekVC = segue.destination as! NotlarVC
            gidilecekVC.kisi = kisi
            gidilecekVC.userDefaulstNesnesi = self
        }
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        if let ue = tfEmail.text, let up = tfPassword.text {
            loginPresenterNesnesi?.login(email: ue)
            if kisi?.kisi_password == up {
                ud.set(true, forKey: "isLogin")
                ud.set(kisi?.kisi_email, forKey: "email")
                performSegue(withIdentifier: "toNotlar", sender: kisi)
                tfEmail.text = ""
                tfPassword.text = ""
            }else {
                print("Kullanıcı bulunamadı.")
            }
        }
    }
}

extension LoginVC : PresenterToViewLoginProtocol {
    func viewaVeriGonder(kisi: Kisiler) {
        self.kisi = kisi
    }
}

extension LoginVC : NotesToLoginProtocol {
    func userDefaultsDegistir() {
        ud.set(false, forKey: "isLogin")
        ud.set(nil, forKey: "email")
    }
}
