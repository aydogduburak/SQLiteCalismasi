//
//  NotlarInteractor.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class NotlarInteractor: PresenterToInteractorNotlarProtocol {
    var notlarPresenter: InteractorToPresenterNotlarProtocol?
    
    //Veri Tabanı
    let db : FMDatabase?
    init() {
        let hedef = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veriTabaniURL = URL(fileURLWithPath: hedef).appendingPathComponent("Notlar.sqlite")
        db = FMDatabase(path: veriTabaniURL.path)
    }
    
    func notlariAl(tablo_adi : String) {
        var notListesi = [Notlar]()
        db?.open()
        do {
            let satirlar = try db!.executeQuery("SELECT * FROM '\(tablo_adi)'", values: nil)
            while satirlar.next() {
                let not = Notlar(not_id: Int(satirlar.string(forColumn: "not_id"))!, not_ad: satirlar.string(forColumn: "not_ad"))
                notListesi.append(not)
            }
            notlarPresenter?.presenteraVeriGonder(notlar: notListesi)
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func arama(aramaKelimesi: String, tablo_adi : String) {
        var notListesi = [Notlar]()
        db?.open()
        do {
            let satirlar = try db!.executeQuery("SELECT * FROM '\(tablo_adi)' WHERE not_ad like '%\(aramaKelimesi)%'", values: nil)
            while satirlar.next() {
                let not = Notlar(not_id: Int(satirlar.string(forColumn: "not_id"))!, not_ad: satirlar.string(forColumn: "not_ad"))
                notListesi.append(not)
            }
            notlarPresenter?.presenteraVeriGonder(notlar: notListesi)
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func sil(not_id: Int, tablo_adi : String) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM '\(tablo_adi)' WHERE not_id = ?", values: [not_id])
            notlariAl(tablo_adi: tablo_adi)
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}
