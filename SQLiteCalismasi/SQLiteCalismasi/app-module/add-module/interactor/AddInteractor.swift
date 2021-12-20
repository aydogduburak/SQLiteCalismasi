//
//  AddInteractor.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class AddInteractor : PresenterToInteractorAddProtocol {
    //Veri Tabanı
    let db : FMDatabase?
    init() {
        let hedef = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veriTabaniURL = URL(fileURLWithPath: hedef).appendingPathComponent("Notlar.sqlite")
        db = FMDatabase(path: veriTabaniURL.path)
    }
    
    func add(note: String, tablo_adi: String) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO '\(tablo_adi)' (not_ad) VALUES (?)", values: [note])
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}
