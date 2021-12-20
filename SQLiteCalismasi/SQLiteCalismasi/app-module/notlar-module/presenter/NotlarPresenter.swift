//
//  NotlarPresenter.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class NotlarPresenter : ViewToPresenterNotlarProtocol {
    var notlarInteractor: PresenterToInteractorNotlarProtocol?
    var notlarView: PresenterToViewNotlarProtocol?
    
    func tumNotlariAl(tablo_adi: String) {
        notlarInteractor?.notlariAl(tablo_adi: tablo_adi)
    }
    
    func aramaYap(aramaKelimesi: String, tablo_adi: String) {
        notlarInteractor?.arama(aramaKelimesi: aramaKelimesi, tablo_adi: tablo_adi)
    }
    
    func notSil(not_id: Int, tablo_adi: String) {
        notlarInteractor?.sil(not_id: not_id, tablo_adi: tablo_adi)
    }
}

extension NotlarPresenter : InteractorToPresenterNotlarProtocol {
    func presenteraVeriGonder(notlar: Array<Notlar>) {
        notlarView?.vieweVeriGonder(notlar: notlar)
    }
}
