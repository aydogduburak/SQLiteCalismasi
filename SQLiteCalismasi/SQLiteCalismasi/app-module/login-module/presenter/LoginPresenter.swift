//
//  LoginPresenter.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class LoginPresenter : ViewToPresenterLoginProtocol {
    var loginInteractor: PresenterToInteractorLoginProtocol?
    var loginView: PresenterToViewLoginProtocol?
    
    func login(email: String) {
        loginInteractor?.loginKontrol(email: email)
    }
}

extension LoginPresenter : InteractorToPresenterLoginProtocol {
    func presenteraVeriGonder(kisi: Kisiler) {
        loginView?.viewaVeriGonder(kisi: kisi)
    }
}
