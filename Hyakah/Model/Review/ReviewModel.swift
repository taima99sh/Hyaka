//
//  ReviewModel.swift
//  Hyakah
//
//  Created by taima on 11/25/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import Foundation
import ObjectMapper


class ReviewModel : NSObject, NSCoding, Mappable{

    var links : AnyObject?
    var dateCreated : String?
    var dateCreatedGmt : String?
    var id : Int?
    var productId : Int?
    var rating : Int?
    var review : String?
    var reviewer : String?
    var reviewerAvatarUrls : ReviewerAvatarUrl?
    var reviewerEmail : String?
    var status : String?
    var verified : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return ReviewModel()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        links <- map["_links"]
        dateCreated <- map["date_created"]
        dateCreatedGmt <- map["date_created_gmt"]
        id <- map["id"]
        productId <- map["product_id"]
        rating <- map["rating"]
        review <- map["review"]
        reviewer <- map["reviewer"]
        reviewerAvatarUrls <- map["reviewer_avatar_urls"]
        reviewerEmail <- map["reviewer_email"]
        status <- map["status"]
        verified <- map["verified"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         links = aDecoder.decodeObject(forKey: "_links") as? AnyObject
         dateCreated = aDecoder.decodeObject(forKey: "date_created") as? String
         dateCreatedGmt = aDecoder.decodeObject(forKey: "date_created_gmt") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         productId = aDecoder.decodeObject(forKey: "product_id") as? Int
         rating = aDecoder.decodeObject(forKey: "rating") as? Int
         review = aDecoder.decodeObject(forKey: "review") as? String
         reviewer = aDecoder.decodeObject(forKey: "reviewer") as? String
         reviewerAvatarUrls = aDecoder.decodeObject(forKey: "reviewer_avatar_urls") as? ReviewerAvatarUrl
         reviewerEmail = aDecoder.decodeObject(forKey: "reviewer_email") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String
         verified = aDecoder.decodeObject(forKey: "verified") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if links != nil{
            aCoder.encode(links, forKey: "_links")
        }
        if dateCreated != nil{
            aCoder.encode(dateCreated, forKey: "date_created")
        }
        if dateCreatedGmt != nil{
            aCoder.encode(dateCreatedGmt, forKey: "date_created_gmt")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if productId != nil{
            aCoder.encode(productId, forKey: "product_id")
        }
        if rating != nil{
            aCoder.encode(rating, forKey: "rating")
        }
        if review != nil{
            aCoder.encode(review, forKey: "review")
        }
        if reviewer != nil{
            aCoder.encode(reviewer, forKey: "reviewer")
        }
        if reviewerAvatarUrls != nil{
            aCoder.encode(reviewerAvatarUrls, forKey: "reviewer_avatar_urls")
        }
        if reviewerEmail != nil{
            aCoder.encode(reviewerEmail, forKey: "reviewer_email")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if verified != nil{
            aCoder.encode(verified, forKey: "verified")
        }

    }

}


class ReviewerAvatarUrl : NSObject, NSCoding, Mappable{

    var URL24 : String?
    var URL48 : String?
    var URL96 : String?


    class func newInstance(map: Map) -> Mappable?{
        return ReviewerAvatarUrl()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        URL24 <- map["24"]
        URL48 <- map["48"]
        URL96 <- map["96"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         URL24 = aDecoder.decodeObject(forKey: "24") as? String
         URL48 = aDecoder.decodeObject(forKey: "48") as? String
         URL96 = aDecoder.decodeObject(forKey: "96") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if URL24 != nil{
            aCoder.encode(URL24, forKey: "24")
        }
        if URL48 != nil{
            aCoder.encode(URL48, forKey: "48")
        }
        if URL96 != nil{
            aCoder.encode(URL96, forKey: "96")
        }

    }

}
