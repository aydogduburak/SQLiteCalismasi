//
//  NotlarProtocol.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

protocol ViewToPresenterNotlarProtocol{
    var notlarInteractor: PresenterToInteractorNotlarProtocol? {get set}
    var notlarView: PresenterToViewNotlarProtocol? {get set}
    
    func tumNotlariAl(tablo_adi: String)
    func aramaYap(aramaKelimesi: String, tablo_adi: String)
    func notSil(not_id: Int, tablo_adi: String)
}

protocol PresenterToInteractorNotlarProtocol{
    var notlarPresenter: InteractorToPresenterNotlarProtocol? {get set}
    
    func notlariAl(tablo_adi: String)
    func arama(aramaKelimesi: String, tablo_adi: String)
    func sil(not_id: Int, tablo_adi: String)
}

protocol InteractorToPresenterNotlarProtocol{
    func presenteraVeriGonder(notlar: Array<Notlar>)
}

protocol PresenterToViewNotlarProtocol{
    func vieweVeriGonder(notlar: Array<Notlar>)
}

protocol PresenterToRouterNotlarProtocol{
    static func createModule(ref: NotlarVC)
}

protocol NotesToLoginProtocol{
    func userDefaultsDegistir()
}
