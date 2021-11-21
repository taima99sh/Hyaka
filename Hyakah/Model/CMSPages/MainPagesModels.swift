//
//  MainPagesModels.swift
//  Hyakah
//
//  Created by Mac on 11/18/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import Foundation
import ObjectMapper


class MainPagesModels : NSObject, NSCoding, Mappable{

    var links : AnyObject?
    var author : Int?
    var commentStatus : String?
    var content : Content?
    var date : String?
    var dateGmt : String?
    var excerpt : Content?
    var featuredMedia : Int?
    var guid : Guid?
    var id : Int?
    var link : String?
    var menuOrder : Int?
    var meta : [AnyObject]?
    var modified : String?
    var modifiedGmt : String?
    var parent : Int?
    var pingStatus : String?
    var slug : String?
    var status : String?
    var template : String?
    var title : Guid?
    var type : String?


    class func newInstance(map: Map) -> Mappable?{
        return MainPagesModels()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        links <- map["_links"]
        author <- map["author"]
        commentStatus <- map["comment_status"]
        content <- map["content"]
        date <- map["date"]
        dateGmt <- map["date_gmt"]
        excerpt <- map["excerpt"]
        featuredMedia <- map["featured_media"]
        guid <- map["guid"]
        id <- map["id"]
        link <- map["link"]
        menuOrder <- map["menu_order"]
        meta <- map["meta"]
        modified <- map["modified"]
        modifiedGmt <- map["modified_gmt"]
        parent <- map["parent"]
        pingStatus <- map["ping_status"]
        slug <- map["slug"]
        status <- map["status"]
        template <- map["template"]
        title <- map["title"]
        type <- map["type"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         links = aDecoder.decodeObject(forKey: "_links") as? AnyObject
         author = aDecoder.decodeObject(forKey: "author") as? Int
         commentStatus = aDecoder.decodeObject(forKey: "comment_status") as? String
         content = aDecoder.decodeObject(forKey: "content") as? Content
         date = aDecoder.decodeObject(forKey: "date") as? String
         dateGmt = aDecoder.decodeObject(forKey: "date_gmt") as? String
         excerpt = aDecoder.decodeObject(forKey: "excerpt") as? Content
         featuredMedia = aDecoder.decodeObject(forKey: "featured_media") as? Int
         guid = aDecoder.decodeObject(forKey: "guid") as? Guid
         id = aDecoder.decodeObject(forKey: "id") as? Int
         link = aDecoder.decodeObject(forKey: "link") as? String
         menuOrder = aDecoder.decodeObject(forKey: "menu_order") as? Int
         meta = aDecoder.decodeObject(forKey: "meta") as? [AnyObject]
         modified = aDecoder.decodeObject(forKey: "modified") as? String
         modifiedGmt = aDecoder.decodeObject(forKey: "modified_gmt") as? String
         parent = aDecoder.decodeObject(forKey: "parent") as? Int
         pingStatus = aDecoder.decodeObject(forKey: "ping_status") as? String
         slug = aDecoder.decodeObject(forKey: "slug") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String
         template = aDecoder.decodeObject(forKey: "template") as? String
         title = aDecoder.decodeObject(forKey: "title") as? Guid
         type = aDecoder.decodeObject(forKey: "type") as? String

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
        if author != nil{
            aCoder.encode(author, forKey: "author")
        }
        if commentStatus != nil{
            aCoder.encode(commentStatus, forKey: "comment_status")
        }
        if content != nil{
            aCoder.encode(content, forKey: "content")
        }
        if date != nil{
            aCoder.encode(date, forKey: "date")
        }
        if dateGmt != nil{
            aCoder.encode(dateGmt, forKey: "date_gmt")
        }
        if excerpt != nil{
            aCoder.encode(excerpt, forKey: "excerpt")
        }
        if featuredMedia != nil{
            aCoder.encode(featuredMedia, forKey: "featured_media")
        }
        if guid != nil{
            aCoder.encode(guid, forKey: "guid")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if link != nil{
            aCoder.encode(link, forKey: "link")
        }
        if menuOrder != nil{
            aCoder.encode(menuOrder, forKey: "menu_order")
        }
        if meta != nil{
            aCoder.encode(meta, forKey: "meta")
        }
        if modified != nil{
            aCoder.encode(modified, forKey: "modified")
        }
        if modifiedGmt != nil{
            aCoder.encode(modifiedGmt, forKey: "modified_gmt")
        }
        if parent != nil{
            aCoder.encode(parent, forKey: "parent")
        }
        if pingStatus != nil{
            aCoder.encode(pingStatus, forKey: "ping_status")
        }
        if slug != nil{
            aCoder.encode(slug, forKey: "slug")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if template != nil{
            aCoder.encode(template, forKey: "template")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }

    }

}
