//
//  DetayInteractor.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class DetayInteractor : PresenterToInteractorDetayProtocol {
    
    //Veri Tabanı
    let db : FMDatabase?
    init() {
        let hedef = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veriTabaniURL = URL(fileURLWithPath: hedef).appendingPathComponent("Notlar.sqlite")
        db = FMDatabase(path: veriTabaniURL.path)
    }
    
    func guncelle(note_id : Int, note_ad : String, tablo_adi : String) {
        db?.open()
        do {
            try db!.executeUpdate("UPDATE '\(tablo_adi)' SET not_ad = ? WHERE not_id = ?", values: [note_ad, note_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}
