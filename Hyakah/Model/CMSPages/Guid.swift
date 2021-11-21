//
//  Guid.swift
//  Hyakah
//
//  Created by Mac on 11/18/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import Foundation
import ObjectMapper


class Guid : NSObject, NSCoding, Mappable{

    var rendered : String?


    class func newInstance(map: Map) -> Mappable?{
        return Guid()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        rendered <- map["rendered"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         rendered = aDecoder.decodeObject(forKey: "rendered") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if rendered != nil{
            aCoder.encode(rendered, forKey: "rendered")
        }

    }

}
