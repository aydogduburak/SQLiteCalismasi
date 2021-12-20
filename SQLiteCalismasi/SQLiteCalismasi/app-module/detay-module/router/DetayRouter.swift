//
//  DetayRouter.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class DetayRouter : PresenterToRouterDetayProtocol {
    static func createModule(ref: DetayVC) {
        ref.detayPresenterNesnesi = DetayPresenter()
        ref.detayPresenterNesnesi?.detayInteractor = DetayInteractor()
    }
}
