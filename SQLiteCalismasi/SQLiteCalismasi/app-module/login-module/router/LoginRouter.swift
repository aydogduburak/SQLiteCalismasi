//
//  LoginRouter.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class LoginRouter : PresenterToRouterLoginProtocol {
    static func createModule(ref: LoginVC) {
        let presenter : ViewToPresenterLoginProtocol & InteractorToPresenterLoginProtocol = LoginPresenter()
        
        ref.loginPresenterNesnesi = presenter
        
        ref.loginPresenterNesnesi?.loginInteractor = LoginInteractor()
        ref.loginPresenterNesnesi?.loginView = ref
        
        ref.loginPresenterNesnesi?.loginInteractor?.loginPresenter = presenter
    }
}
