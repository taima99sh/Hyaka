//
//  ReviewTableViewCell.swift
//  Hyakah
//
//  Created by taima on 11/10/20.
//  Copyright © 2020 mac air. All rights reserved.
//
struct Review {
    var name = ""
    var text = ""
    var image = ""
    var id = 0
    var rating = 1
}
import UIKit
import Cosmos

class ReviewTableViewCell: GeneralTableViewCell {
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblReview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ratingView.settings.updateOnTouch = false
        // Initialization code
    }
    
    override func configureCell() {
        if let obj = self.object?.object as? ReviewModel {
            self.lblName.text = obj.reviewer
            if obj.reviewerAvatarUrls?.URL96 != nil {
                self.imgProfile.LoadImageFromUrl(url: obj.reviewerAvatarUrls?.URL96)
            } else {
                imgProfile.setImage(string: obj.reviewer, color: "secondaryColor".myColor, circular: false, stroke: false)
            }
            self.lblReview.text = obj.review?.html2Attributed?.string
            self.ratingView.rating = Double(obj.rating ?? 5)
        }
    }
    
}
