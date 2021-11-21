//
//  CategoriesListCollectionViewCell.swift
//  Hyakah
//
//  Created by taima on 11/8/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit
struct CategoryList {
    var img: String = ""
    var price: String = ""
    var currency: String = ""
}

class HomeCategoriesListCollectionViewCell: GeneralCollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var btnFav: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func configureCell() {
        if let parentVc = self.parentVC {
            self.btnFav.isHidden = (parentVc.restorationIdentifier == "FavoriteViewController") ? false : true
        }
        if let obj = self.object?.object as? ProductsModel {
            self.imgView.LoadImageFromUrl(url: obj.images?.isEmpty ?? true ? "" : obj.images?[0].src)
            let currency = Constant.shared.Currency == "SAR" ? "ر.س" : Constant.shared.Currency
            self.lblPrice.text = "\(obj.price ?? "0") \(currency)"
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ItemViewControllers") as! ItemViewControllers
        if let obj = self.object?.object as? ProductsModel {
            vc.productObj = obj
        }
        AppDelegate.shared.rootNavigationViewController.pushViewController(vc, animated: false)
    }
}
