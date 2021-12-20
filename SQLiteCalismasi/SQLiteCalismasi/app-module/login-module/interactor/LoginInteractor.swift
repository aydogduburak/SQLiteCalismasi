//
//  LoginInteractor.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class LoginInteractor : PresenterToInteractorLoginProtocol {
    var loginPresenter: InteractorToPresenterLoginProtocol?
    
    //Veri Tabanı
    let db : FMDatabase?
    init() {
        let hedef = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veriTabaniURL = URL(fileURLWithPath: hedef).appendingPathComponent("Notlar.sqlite")
        db = FMDatabase(path: veriTabaniURL.path)
    }
    
    func loginKontrol(email: String) {
        db?.open()
        do {
            let satir = try db!.executeQuery("SELECT * FROM kisiler WHERE user_email = ?", values: [email])
            while satir.next() {
                let kisi = Kisiler(kisi_id: Int(satir.string(forColumn: "user_id"))!, kisi_ad: satir.string(forColumn: "user_name"), kisi_email: satir.string(forColumn: "user_email"), kisi_password: satir.string(forColumn: "user_password"))
                loginPresenter?.presenteraVeriGonder(kisi: kisi)
                break
            }
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}
