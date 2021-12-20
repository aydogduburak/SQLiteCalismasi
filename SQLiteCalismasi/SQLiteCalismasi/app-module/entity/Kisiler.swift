//
//  Kisiler.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import Foundation

class Kisiler {
    var kisi_id : Int?
    var kisi_ad : String?
    var kisi_email : String?
    var kisi_password : String?
    
    init() {
        
    }
    
    init(kisi_id : Int, kisi_ad : String, kisi_email : String, kisi_password : String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_email = kisi_email
        self.kisi_password = kisi_password
    }
}
