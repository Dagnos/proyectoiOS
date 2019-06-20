//
//  selectPostViewController.swift
//  YaraCan
//
//  Created by MAC17 on 19/06/19.
//  Copyright © 2019 Fernando Huarcaya Torres. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class selectPostViewController: UIViewController {
var user:[User] = []
    var snap = Publicaciones()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblpetname: UILabel!
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var lblraza: UILabel!
    @IBOutlet weak var lblsex: UILabel!
    @IBOutlet weak var lblusername: UILabel!
    
    var publicaciones:[Publicaciones] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.sd_setImage(with: URL(string: snap.urlImagen), completed: nil)
        
        self.lblDescripcion.text = snap.petname
        self.lblpetname.text = snap.petname
        self.lblraza.text = snap.raza
        self.lblsex.text = snap.sexo
Database.database().reference().child("usuarios").observe(DataEventType.childAdded, with: {(snapshot) in
            let snap2 = User()
            snap2.emal = (snapshot.value as! NSDictionary)["email"] as! String
            snap2.nameFull = (snapshot.value as! NSDictionary)["nameFull"] as! String
    snap2.id = snapshot.key
    print("<<<<<<<<<<<<<<\(snap2.id)")
    if(snap2.id == self.snap.userID){
        self.lblusername.text = snap2.nameFull
        print(snap2.nameFull)
        return
    }
        })
//        imageView.sd_setImage(with: URL(string: ), completed: nil)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
