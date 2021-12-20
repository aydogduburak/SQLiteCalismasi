//
//  AddVC.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import UIKit

class AddVC: UIViewController {
    @IBOutlet weak var addTextView: UITextView!
    
    var kisi : Kisiler?
    var addPresenterNesnesi : ViewToPresenterAddProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AddRouter.createModule(ref: self)
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        if let n = addTextView.text {
            addPresenterNesnesi?.addNote(note: n, tablo_adi: (kisi?.kisi_email)!)
            navigationController?.popViewController(animated: true)
        }
    }
}
