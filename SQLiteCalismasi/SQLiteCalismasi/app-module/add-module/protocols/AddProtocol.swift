//
//  AddProtocol.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

protocol ViewToPresenterAddProtocol{
    var addInteractor: PresenterToInteractorAddProtocol? {get set}
    func addNote(note: String, tablo_adi: String)
}

protocol PresenterToInteractorAddProtocol{
    func add(note: String, tablo_adi: String)
}

protocol PresenterToRouterAddProtocol{
    static func createModule(ref: AddVC)
}
