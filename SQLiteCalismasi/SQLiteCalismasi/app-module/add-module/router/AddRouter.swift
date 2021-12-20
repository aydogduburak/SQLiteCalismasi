//
//  AddRouter.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class AddRouter : PresenterToRouterAddProtocol {
    static func createModule(ref: AddVC) {
        ref.addPresenterNesnesi = AddPresenter()
        ref.addPresenterNesnesi?.addInteractor = AddInteractor()
    }
}
