//
//  AddPresenter.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class AddPresenter : ViewToPresenterAddProtocol {
    var addInteractor: PresenterToInteractorAddProtocol?
    
    func addNote(note: String, tablo_adi: String) {
        addInteractor?.add(note: note, tablo_adi: tablo_adi)
    }
}
