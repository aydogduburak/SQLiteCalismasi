//
//  RegisterProtocol.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

protocol ViewToPresenterRegisterProtocol {
    var registerInteractor : PresenterToInteractorRegisterProtocol? {get set}
    func kisiKayit(name : String, email: String, password : String)
}

protocol PresenterToInteractorRegisterProtocol {
    func kayit(name : String, email: String, password : String)
}

protocol PresenterToRouterRegisterProtocol {
    static func createModule(ref : RegisterVC)
}
