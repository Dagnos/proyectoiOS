//
//  publicViewCell.swift
//  YaraCan
//
//  Created by MAC13 on 19/06/19.
//  Copyright © 2019 Fernando Huarcaya Torres. All rights reserved.
//

import UIKit

class publicViewCell: UITableViewCell {

    
    @IBOutlet weak var imagenPet: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descripcion: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imagenPet.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
