//
//  RegisterPresenter.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class RegisterPresenter : ViewToPresenterRegisterProtocol {
    var registerInteractor: PresenterToInteractorRegisterProtocol?
    
    func kisiKayit(name: String, email: String, password: String) {
        registerInteractor?.kayit(name: name, email: email, password: password)
    }
}
