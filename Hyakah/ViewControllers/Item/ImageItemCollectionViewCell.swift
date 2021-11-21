//
//  ImageItemCollectionViewCell.swift
//  Hyakah
//
//  Created by taima on 11/25/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class ImageItemCollectionViewCell: GeneralCollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func configureCell() {
        if let obj = self.object?.object as? Image {
            self.imgView.LoadImageFromUrl(url: obj.src)
        }
    }
    
}
