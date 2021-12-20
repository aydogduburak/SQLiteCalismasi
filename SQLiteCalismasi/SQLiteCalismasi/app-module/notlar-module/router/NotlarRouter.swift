//
//  NotlarRouter.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class NotlarRouter : PresenterToRouterNotlarProtocol {
    static func createModule(ref: NotlarVC) {
        let presenter : ViewToPresenterNotlarProtocol & InteractorToPresenterNotlarProtocol = NotlarPresenter()
        ref.notlarPresenterNesnesi = presenter
        ref.notlarPresenterNesnesi?.notlarView = ref
        ref.notlarPresenterNesnesi?.notlarInteractor = NotlarInteractor()
        ref.notlarPresenterNesnesi?.notlarInteractor?.notlarPresenter = presenter
    }
}
