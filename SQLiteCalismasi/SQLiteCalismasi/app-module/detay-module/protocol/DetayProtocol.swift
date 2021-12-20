//
//  DetayProtocol.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

protocol ViewToPresenterDetayProtocol {
    var detayInteractor : PresenterToInteractorDetayProtocol? {get set}
    func notGuncelle(note_id : Int, note_ad : String, tablo_adi : String)
}

protocol PresenterToInteractorDetayProtocol {
    func guncelle(note_id : Int, note_ad : String, tablo_adi : String)

}

protocol PresenterToRouterDetayProtocol {
    static func createModule(ref : DetayVC)
}
