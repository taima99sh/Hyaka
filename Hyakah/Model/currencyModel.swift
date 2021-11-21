//
//  currencyModel.swift
//  Hyakah
//
//  Created by taima on 11/22/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import Foundation
import ObjectMapper


class currencyModel : NSObject, NSCoding, Mappable{

    var links : AnyObject?
    var code : String?
    var name : String?
    var symbol : String?


    class func newInstance(map: Map) -> Mappable?{
        return currencyModel()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        links <- map["_links"]
        code <- map["code"]
        name <- map["name"]
        symbol <- map["symbol"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         links = aDecoder.decodeObject(forKey: "_links") as? AnyObject
         code = aDecoder.decodeObject(forKey: "code") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         symbol = aDecoder.decodeObject(forKey: "symbol") as? String

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
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if symbol != nil{
            aCoder.encode(symbol, forKey: "symbol")
        }

    }

}
