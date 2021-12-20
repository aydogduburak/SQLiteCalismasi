//
//  DetayVC.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import UIKit

class DetayVC: UIViewController {
    @IBOutlet weak var tvNote: UITextView!
    
    var not : Notlar?
    var kisi : Kisiler?
    
    var detayPresenterNesnesi : ViewToPresenterDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DetayRouter.createModule(ref: self)
        tvNote.text = not?.not_ad
    }

    @IBAction func buttonDone(_ sender: Any) {
        if let n = tvNote.text {
            detayPresenterNesnesi?.notGuncelle(note_id: (not?.not_id)!, note_ad: n, tablo_adi: (kisi?.kisi_email)!)
        }
        navigationController?.popViewController(animated: true)
    }
}
