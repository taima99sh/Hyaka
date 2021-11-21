//
//  CategoriesListCollectionViewCell.swift
//  Hyakah
//
//  Created by taima on 11/24/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class CategoriesListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var btnFav: UIButton!
    
    var object: ProductsModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell() {
        if let obj = self.object {
            self.imgView.LoadImageFromUrl(url: obj.images?.isEmpty ?? true ? "" : obj.images?[0].src)
            let currency = Constant.shared.Currency == "SAR" ? "ر.س" : Constant.shared.Currency
            self.lblPrice.text = "\(obj.price ?? "0") \(currency)"
        }
    }

}
