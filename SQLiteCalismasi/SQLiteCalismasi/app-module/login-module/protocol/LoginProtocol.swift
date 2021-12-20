//
//  LoginProtocol.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

protocol ViewToPresenterLoginProtocol {
    var loginInteractor : PresenterToInteractorLoginProtocol? {get set}
    var loginView : PresenterToViewLoginProtocol? {get set}
    func login(email : String)
}

protocol PresenterToInteractorLoginProtocol {
    var loginPresenter : InteractorToPresenterLoginProtocol? {get set}
    func loginKontrol(email : String)
}

protocol InteractorToPresenterLoginProtocol {
    func presenteraVeriGonder(kisi : Kisiler)
}

protocol PresenterToViewLoginProtocol {
    func viewaVeriGonder(kisi : Kisiler)
}

protocol PresenterToRouterLoginProtocol {
    static func createModule(ref : LoginVC)
}
