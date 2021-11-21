//
//  Content.swift
//  Hyakah
//
//  Created by Mac on 11/18/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import Foundation
import ObjectMapper


class Content : NSObject, NSCoding, Mappable{

    var protectedField : Bool?
    var rendered : String?


    class func newInstance(map: Map) -> Mappable?{
        return Content()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        protectedField <- map["protected"]
        rendered <- map["rendered"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         protectedField = aDecoder.decodeObject(forKey: "protected") as? Bool
         rendered = aDecoder.decodeObject(forKey: "rendered") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if protectedField != nil{
            aCoder.encode(protectedField, forKey: "protected")
        }
        if rendered != nil{
            aCoder.encode(rendered, forKey: "rendered")
        }

    }

}
