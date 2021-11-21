//
//  HomeCategoriesCollectionViewCell.swift
//  Hyakah
//
//  Created by taima on 11/8/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class HomeCategoriesCollectionViewCell: GeneralCollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func configureCell() {
        if let obj = self.object?.object as? CategoriesModel {
            switch obj.id {
            case 209:
                self.imgView.image = "عبايات السفر".image_
            case 208:
                self.imgView.image = "عبايات الفخامة".image_
            case 211:
                self.imgView.image = "عبايات النواعم".image_
            case 207:
                 self.imgView.image = "عبايات عصرية".image_
            case 206:
                 self.imgView.image = "عبايات ملونة".image_
            default:
                self.imgView.image = "epmtyImage".image_
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let obj = self.object?.object as? CategoriesModel {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "CategoryListViewController") as! CategoryListViewController
            vc.categoryObj = obj
            AppDelegate.shared.rootNavigationViewController.pushViewController(vc, animated: true)
        }
    }
    

}
