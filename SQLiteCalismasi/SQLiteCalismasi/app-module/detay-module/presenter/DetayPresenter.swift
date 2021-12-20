//
//  DetayPresenter.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class DetayPresenter : ViewToPresenterDetayProtocol {
    var detayInteractor: PresenterToInteractorDetayProtocol?
    
    func notGuncelle(note_id: Int, note_ad: String, tablo_adi: String) {
        detayInteractor?.guncelle(note_id: note_id, note_ad: note_ad, tablo_adi: tablo_adi)
    }
}
