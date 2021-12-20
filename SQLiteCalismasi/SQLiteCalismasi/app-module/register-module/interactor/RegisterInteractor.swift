//
//  RegisterInteractor.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class RegisterInteractor : PresenterToInteractorRegisterProtocol {
    
    //Veri Tabanı
    let db : FMDatabase?
    init() {
        let hedef = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veriTabaniURL = URL(fileURLWithPath: hedef).appendingPathComponent("Notlar.sqlite")
        db = FMDatabase(path: veriTabaniURL.path)
    }
    
    func kayit(name: String, email: String, password: String) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO kisiler (user_name, user_email, user_password) VALUES (?, ?, ?)", values: [name, email, password])
            try db!.executeUpdate("CREATE TABLE IF NOT EXISTS '\(email)' ('not_id' INTEGER, 'not_ad' TEXT, PRIMARY KEY('not_id' AUTOINCREMENT))", values: nil)
            print("Başarıyla kayıt olundu")
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
