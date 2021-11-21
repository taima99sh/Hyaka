//
//  CategoriesTableViewCell.swift
//  Hyakah
//
//  Created by taima on 11/8/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit



class CategoriesTableViewCell: GeneralTableViewCell {
    @IBOutlet weak var imagView: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    override func configureCell() {
        if let obj = self.object?.object as? CategoriesModel {
            self.imageView?.image = "categoriesImage".image_
            self.lblName.text = obj.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let obj = self.object?.object as? CategoriesModel {
                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "CategoryListViewController") as! CategoryListViewController
                vc.categoryObj = obj
                AppDelegate.shared.rootNavigationViewController.pushViewController(vc, animated: true)
            }
        }
    }
