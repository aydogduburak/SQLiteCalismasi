//
//  NotlarVC.swift
//  SQLiteCalismasi
//
//  Created by Burak Aydoğdu on 28.11.2021.
//

import UIKit

class NotlarVC: UIViewController {
    @IBOutlet weak var notlarTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var kisi : Kisiler?
    var notlar = [Notlar]()
    
    var notlarPresenterNesnesi : ViewToPresenterNotlarProtocol?
    var userDefaulstNesnesi : NotesToLoginProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotlarRouter.createModule(ref: self)
        
        
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
        NotlarRouter.createModule(ref: self)
        
        
        notlarTableView.delegate = self
        notlarTableView.dataSource = self
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        notlarPresenterNesnesi?.tumNotlariAl(tablo_adi: (kisi?.kisi_email)!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let my_sender = sender as? Array<Any>
            let kisi = my_sender![0] as? Kisiler
            let not = my_sender![1] as? Notlar
            let gidilecekVC = segue.destination as! DetayVC
            gidilecekVC.not = not
            gidilecekVC.kisi = kisi
        }
        
        if segue.identifier == "toAdd" {
            let kisi = sender as? Kisiler
            let gidilecekVC = segue.destination as! AddVC
            gidilecekVC.kisi = kisi
        }
    }
    
    @IBAction func buttonLogout(_ sender: Any) {
        userDefaulstNesnesi?.userDefaultsDegistir()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func buttonAdd(_ sender: Any) {
        performSegue(withIdentifier: "toAdd", sender: kisi)
    }
    
}

extension NotlarVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notlar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let not = notlar[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "notlarCell", for: indexPath) as! NotlarTableViewCell
        hucre.labelNot.text = not.not_ad
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetay", sender: [kisi!, notlar[indexPath.row]])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (contextualAction, view, bool) in
            let not = self.notlar[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(not.not_ad!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { action in
            }
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                self.notlarPresenterNesnesi?.notSil(not_id: not.not_id!, tablo_adi: (self.kisi?.kisi_email)!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }

}

extension NotlarVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        notlarPresenterNesnesi?.aramaYap(aramaKelimesi: searchText, tablo_adi: (kisi?.kisi_email)!)
    }
}

extension NotlarVC : PresenterToViewNotlarProtocol {
    func vieweVeriGonder(notlar: Array<Notlar>) {
        self.notlar = notlar
        notlarTableView.reloadData()
    }
}
