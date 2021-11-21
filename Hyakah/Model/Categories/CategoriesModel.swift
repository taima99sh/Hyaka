

import Foundation
import ObjectMapper


class CategoriesModel : NSObject, NSCoding, Mappable{

    var links : AnyObject?
    var count : Int?
    var descriptionField : String?
    var display : String?
    var id : Int?
    var image : Image?
    var menuOrder : Int?
    var name : String?
    var parent : Int?
    var slug : String?


    class func newInstance(map: Map) -> Mappable?{
        return CategoriesModel()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        links <- map["_links"]
        count <- map["count"]
        descriptionField <- map["description"]
        display <- map["display"]
        id <- map["id"]
        image <- map["image"]
        menuOrder <- map["menu_order"]
        name <- map["name"]
        parent <- map["parent"]
        slug <- map["slug"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         links = aDecoder.decodeObject(forKey: "_links") as? AnyObject
         count = aDecoder.decodeObject(forKey: "count") as? Int
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         display = aDecoder.decodeObject(forKey: "display") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         image = aDecoder.decodeObject(forKey: "image") as? Image
         menuOrder = aDecoder.decodeObject(forKey: "menu_order") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         parent = aDecoder.decodeObject(forKey: "parent") as? Int
         slug = aDecoder.decodeObject(forKey: "slug") as? String

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
        if count != nil{
            aCoder.encode(count, forKey: "count")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if display != nil{
            aCoder.encode(display, forKey: "display")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if menuOrder != nil{
            aCoder.encode(menuOrder, forKey: "menu_order")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if parent != nil{
            aCoder.encode(parent, forKey: "parent")
        }
        if slug != nil{
            aCoder.encode(slug, forKey: "slug")
        }

    }

}

class Image : NSObject, NSCoding, Mappable{

    var alt : String?
    var dateCreated : String?
    var dateCreatedGmt : String?
    var dateModified : String?
    var dateModifiedGmt : String?
    var id : Int?
    var name : String?
    var src : String?


    class func newInstance(map: Map) -> Mappable?{
        return Image()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        alt <- map["alt"]
        dateCreated <- map["date_created"]
        dateCreatedGmt <- map["date_created_gmt"]
        dateModified <- map["date_modified"]
        dateModifiedGmt <- map["date_modified_gmt"]
        id <- map["id"]
        name <- map["name"]
        src <- map["src"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         alt = aDecoder.decodeObject(forKey: "alt") as? String
         dateCreated = aDecoder.decodeObject(forKey: "date_created") as? String
         dateCreatedGmt = aDecoder.decodeObject(forKey: "date_created_gmt") as? String
         dateModified = aDecoder.decodeObject(forKey: "date_modified") as? String
         dateModifiedGmt = aDecoder.decodeObject(forKey: "date_modified_gmt") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         src = aDecoder.decodeObject(forKey: "src") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if alt != nil{
            aCoder.encode(alt, forKey: "alt")
        }
        if dateCreated != nil{
            aCoder.encode(dateCreated, forKey: "date_created")
        }
        if dateCreatedGmt != nil{
            aCoder.encode(dateCreatedGmt, forKey: "date_created_gmt")
        }
        if dateModified != nil{
            aCoder.encode(dateModified, forKey: "date_modified")
        }
        if dateModifiedGmt != nil{
            aCoder.encode(dateModifiedGmt, forKey: "date_modified_gmt")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if src != nil{
            aCoder.encode(src, forKey: "src")
        }

    }

}


