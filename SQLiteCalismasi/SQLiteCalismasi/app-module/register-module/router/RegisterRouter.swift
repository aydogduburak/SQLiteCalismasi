//
//  RegisterRouter.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class RegisterRouter : PresenterToRouterRegisterProtocol {
    static func createModule(ref: RegisterVC) {
        ref.registerPresenterNesnesi = RegisterPresenter()
        ref.registerPresenterNesnesi?.registerInteractor = RegisterInteractor()
    }
}
