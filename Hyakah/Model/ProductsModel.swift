//
//  ProductsModel.swift
//  
//
//  Created by taima on 11/21/20.
//

import Foundation
import ObjectMapper


class ProductsModel : NSObject, NSCoding, Mappable{

    var links : AnyObject?
    var attributes : [Attribute]?
    var averageRating : String?
    var backordered : Bool?
    var backorders : String?
    var backordersAllowed : Bool?
    var buttonText : String?
    var catalogVisibility : String?
    var categories : [Category]?
    var crossSellIds : [AnyObject]?
    var dateCreated : String?
    var dateCreatedGmt : String?
    var dateModified : String?
    var dateModifiedGmt : String?
    var dateOnSaleFrom : AnyObject?
    var dateOnSaleFromGmt : AnyObject?
    var dateOnSaleTo : AnyObject?
    var dateOnSaleToGmt : AnyObject?
    var defaultAttributes : [AnyObject]?
    var descriptionField : String?
    var dimensions : Dimension?
    var downloadExpiry : Int?
    var downloadLimit : Int?
    var downloadable : Bool?
    var downloads : [AnyObject]?
    var externalUrl : String?
    var featured : Bool?
    var groupedProducts : [AnyObject]?
    var id : Int?
    var images : [Image]?
    var manageStock : Bool?
    var menuOrder : Int?
    var metaData : AnyObject?
    var name : String?
    var onSale : Bool?
    var parentId : Int?
    var permalink : String?
    var price : String?
    var priceHtml : String?
    var purchasable : Bool?
    var purchaseNote : String?
    var ratingCount : Int?
    var regularPrice : String?
    var relatedIds : [Int]?
    var reviewsAllowed : Bool?
    var salePrice : String?
    var shippingClass : String?
    var shippingClassId : Int?
    var shippingRequired : Bool?
    var shippingTaxable : Bool?
    var shortDescription : String?
    var sku : String?
    var slug : String?
    var soldIndividually : AnyObject?
    var status : String?
    var stockQuantity : AnyObject?
    var stockStatus : String?
    var tags : [AnyObject]?
    var taxClass : String?
    var taxStatus : String?
    var totalSales : Int?
    var type : String?
    var upsellIds : [AnyObject]?
    var variations : [Int]?
    var virtual : Bool?
    var weight : String?


    class func newInstance(map: Map) -> Mappable?{
        return ProductsModel()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        links <- map["_links"]
        attributes <- map["attributes"]
        averageRating <- map["average_rating"]
        backordered <- map["backordered"]
        backorders <- map["backorders"]
        backordersAllowed <- map["backorders_allowed"]
        buttonText <- map["button_text"]
        catalogVisibility <- map["catalog_visibility"]
        categories <- map["categories"]
        crossSellIds <- map["cross_sell_ids"]
        dateCreated <- map["date_created"]
        dateCreatedGmt <- map["date_created_gmt"]
        dateModified <- map["date_modified"]
        dateModifiedGmt <- map["date_modified_gmt"]
        dateOnSaleFrom <- map["date_on_sale_from"]
        dateOnSaleFromGmt <- map["date_on_sale_from_gmt"]
        dateOnSaleTo <- map["date_on_sale_to"]
        dateOnSaleToGmt <- map["date_on_sale_to_gmt"]
        defaultAttributes <- map["default_attributes"]
        descriptionField <- map["description"]
        dimensions <- map["dimensions"]
        downloadExpiry <- map["download_expiry"]
        downloadLimit <- map["download_limit"]
        downloadable <- map["downloadable"]
        downloads <- map["downloads"]
        externalUrl <- map["external_url"]
        featured <- map["featured"]
        groupedProducts <- map["grouped_products"]
        id <- map["id"]
        images <- map["images"]
        manageStock <- map["manage_stock"]
        menuOrder <- map["menu_order"]
        metaData <- map["meta_data"]
        name <- map["name"]
        onSale <- map["on_sale"]
        parentId <- map["parent_id"]
        permalink <- map["permalink"]
        price <- map["price"]
        priceHtml <- map["price_html"]
        purchasable <- map["purchasable"]
        purchaseNote <- map["purchase_note"]
        ratingCount <- map["rating_count"]
        regularPrice <- map["regular_price"]
        relatedIds <- map["related_ids"]
        reviewsAllowed <- map["reviews_allowed"]
        salePrice <- map["sale_price"]
        shippingClass <- map["shipping_class"]
        shippingClassId <- map["shipping_class_id"]
        shippingRequired <- map["shipping_required"]
        shippingTaxable <- map["shipping_taxable"]
        shortDescription <- map["short_description"]
        sku <- map["sku"]
        slug <- map["slug"]
        soldIndividually <- map["sold_individually"]
        status <- map["status"]
        stockQuantity <- map["stock_quantity"]
        stockStatus <- map["stock_status"]
        tags <- map["tags"]
        taxClass <- map["tax_class"]
        taxStatus <- map["tax_status"]
        totalSales <- map["total_sales"]
        type <- map["type"]
        upsellIds <- map["upsell_ids"]
        variations <- map["variations"]
        virtual <- map["virtual"]
        weight <- map["weight"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         links = aDecoder.decodeObject(forKey: "_links") as? AnyObject
         attributes = aDecoder.decodeObject(forKey: "attributes") as? [Attribute]
         averageRating = aDecoder.decodeObject(forKey: "average_rating") as? String
         backordered = aDecoder.decodeObject(forKey: "backordered") as? Bool
         backorders = aDecoder.decodeObject(forKey: "backorders") as? String
         backordersAllowed = aDecoder.decodeObject(forKey: "backorders_allowed") as? Bool
         buttonText = aDecoder.decodeObject(forKey: "button_text") as? String
         catalogVisibility = aDecoder.decodeObject(forKey: "catalog_visibility") as? String
         categories = aDecoder.decodeObject(forKey: "categories") as? [Category]
         crossSellIds = aDecoder.decodeObject(forKey: "cross_sell_ids") as? [AnyObject]
         dateCreated = aDecoder.decodeObject(forKey: "date_created") as? String
         dateCreatedGmt = aDecoder.decodeObject(forKey: "date_created_gmt") as? String
         dateModified = aDecoder.decodeObject(forKey: "date_modified") as? String
         dateModifiedGmt = aDecoder.decodeObject(forKey: "date_modified_gmt") as? String
         dateOnSaleFrom = aDecoder.decodeObject(forKey: "date_on_sale_from") as? AnyObject
         dateOnSaleFromGmt = aDecoder.decodeObject(forKey: "date_on_sale_from_gmt") as? AnyObject
         dateOnSaleTo = aDecoder.decodeObject(forKey: "date_on_sale_to") as? AnyObject
         dateOnSaleToGmt = aDecoder.decodeObject(forKey: "date_on_sale_to_gmt") as? AnyObject
         defaultAttributes = aDecoder.decodeObject(forKey: "default_attributes") as? [AnyObject]
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         dimensions = aDecoder.decodeObject(forKey: "dimensions") as? Dimension
         downloadExpiry = aDecoder.decodeObject(forKey: "download_expiry") as? Int
         downloadLimit = aDecoder.decodeObject(forKey: "download_limit") as? Int
         downloadable = aDecoder.decodeObject(forKey: "downloadable") as? Bool
         downloads = aDecoder.decodeObject(forKey: "downloads") as? [AnyObject]
         externalUrl = aDecoder.decodeObject(forKey: "external_url") as? String
         featured = aDecoder.decodeObject(forKey: "featured") as? Bool
         groupedProducts = aDecoder.decodeObject(forKey: "grouped_products") as? [AnyObject]
         id = aDecoder.decodeObject(forKey: "id") as? Int
         images = aDecoder.decodeObject(forKey: "images") as? [Image]
         manageStock = aDecoder.decodeObject(forKey: "manage_stock") as? Bool
         menuOrder = aDecoder.decodeObject(forKey: "menu_order") as? Int
         metaData = aDecoder.decodeObject(forKey: "meta_data") as? AnyObject
         name = aDecoder.decodeObject(forKey: "name") as? String
         onSale = aDecoder.decodeObject(forKey: "on_sale") as? Bool
         parentId = aDecoder.decodeObject(forKey: "parent_id") as? Int
         permalink = aDecoder.decodeObject(forKey: "permalink") as? String
         price = aDecoder.decodeObject(forKey: "price") as? String
         priceHtml = aDecoder.decodeObject(forKey: "price_html") as? String
         purchasable = aDecoder.decodeObject(forKey: "purchasable") as? Bool
         purchaseNote = aDecoder.decodeObject(forKey: "purchase_note") as? String
         ratingCount = aDecoder.decodeObject(forKey: "rating_count") as? Int
         regularPrice = aDecoder.decodeObject(forKey: "regular_price") as? String
         relatedIds = aDecoder.decodeObject(forKey: "related_ids") as? [Int]
         reviewsAllowed = aDecoder.decodeObject(forKey: "reviews_allowed") as? Bool
         salePrice = aDecoder.decodeObject(forKey: "sale_price") as? String
         shippingClass = aDecoder.decodeObject(forKey: "shipping_class") as? String
         shippingClassId = aDecoder.decodeObject(forKey: "shipping_class_id") as? Int
         shippingRequired = aDecoder.decodeObject(forKey: "shipping_required") as? Bool
         shippingTaxable = aDecoder.decodeObject(forKey: "shipping_taxable") as? Bool
         shortDescription = aDecoder.decodeObject(forKey: "short_description") as? String
         sku = aDecoder.decodeObject(forKey: "sku") as? String
         slug = aDecoder.decodeObject(forKey: "slug") as? String
         soldIndividually = aDecoder.decodeObject(forKey: "sold_individually") as? AnyObject
         status = aDecoder.decodeObject(forKey: "status") as? String
         stockQuantity = aDecoder.decodeObject(forKey: "stock_quantity") as? AnyObject
         stockStatus = aDecoder.decodeObject(forKey: "stock_status") as? String
         tags = aDecoder.decodeObject(forKey: "tags") as? [AnyObject]
         taxClass = aDecoder.decodeObject(forKey: "tax_class") as? String
         taxStatus = aDecoder.decodeObject(forKey: "tax_status") as? String
         totalSales = aDecoder.decodeObject(forKey: "total_sales") as? Int
         type = aDecoder.decodeObject(forKey: "type") as? String
         upsellIds = aDecoder.decodeObject(forKey: "upsell_ids") as? [AnyObject]
         variations = aDecoder.decodeObject(forKey: "variations") as? [Int]
         virtual = aDecoder.decodeObject(forKey: "virtual") as? Bool
         weight = aDecoder.decodeObject(forKey: "weight") as? String

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
        if attributes != nil{
            aCoder.encode(attributes, forKey: "attributes")
        }
        if averageRating != nil{
            aCoder.encode(averageRating, forKey: "average_rating")
        }
        if backordered != nil{
            aCoder.encode(backordered, forKey: "backordered")
        }
        if backorders != nil{
            aCoder.encode(backorders, forKey: "backorders")
        }
        if backordersAllowed != nil{
            aCoder.encode(backordersAllowed, forKey: "backorders_allowed")
        }
        if buttonText != nil{
            aCoder.encode(buttonText, forKey: "button_text")
        }
        if catalogVisibility != nil{
            aCoder.encode(catalogVisibility, forKey: "catalog_visibility")
        }
        if categories != nil{
            aCoder.encode(categories, forKey: "categories")
        }
        if crossSellIds != nil{
            aCoder.encode(crossSellIds, forKey: "cross_sell_ids")
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
        if dateOnSaleFrom != nil{
            aCoder.encode(dateOnSaleFrom, forKey: "date_on_sale_from")
        }
        if dateOnSaleFromGmt != nil{
            aCoder.encode(dateOnSaleFromGmt, forKey: "date_on_sale_from_gmt")
        }
        if dateOnSaleTo != nil{
            aCoder.encode(dateOnSaleTo, forKey: "date_on_sale_to")
        }
        if dateOnSaleToGmt != nil{
            aCoder.encode(dateOnSaleToGmt, forKey: "date_on_sale_to_gmt")
        }
        if defaultAttributes != nil{
            aCoder.encode(defaultAttributes, forKey: "default_attributes")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if dimensions != nil{
            aCoder.encode(dimensions, forKey: "dimensions")
        }
        if downloadExpiry != nil{
            aCoder.encode(downloadExpiry, forKey: "download_expiry")
        }
        if downloadLimit != nil{
            aCoder.encode(downloadLimit, forKey: "download_limit")
        }
        if downloadable != nil{
            aCoder.encode(downloadable, forKey: "downloadable")
        }
        if downloads != nil{
            aCoder.encode(downloads, forKey: "downloads")
        }
        if externalUrl != nil{
            aCoder.encode(externalUrl, forKey: "external_url")
        }
        if featured != nil{
            aCoder.encode(featured, forKey: "featured")
        }
        if groupedProducts != nil{
            aCoder.encode(groupedProducts, forKey: "grouped_products")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if images != nil{
            aCoder.encode(images, forKey: "images")
        }
        if manageStock != nil{
            aCoder.encode(manageStock, forKey: "manage_stock")
        }
        if menuOrder != nil{
            aCoder.encode(menuOrder, forKey: "menu_order")
        }
        if metaData != nil{
            aCoder.encode(metaData, forKey: "meta_data")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if onSale != nil{
            aCoder.encode(onSale, forKey: "on_sale")
        }
        if parentId != nil{
            aCoder.encode(parentId, forKey: "parent_id")
        }
        if permalink != nil{
            aCoder.encode(permalink, forKey: "permalink")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if priceHtml != nil{
            aCoder.encode(priceHtml, forKey: "price_html")
        }
        if purchasable != nil{
            aCoder.encode(purchasable, forKey: "purchasable")
        }
        if purchaseNote != nil{
            aCoder.encode(purchaseNote, forKey: "purchase_note")
        }
        if ratingCount != nil{
            aCoder.encode(ratingCount, forKey: "rating_count")
        }
        if regularPrice != nil{
            aCoder.encode(regularPrice, forKey: "regular_price")
        }
        if relatedIds != nil{
            aCoder.encode(relatedIds, forKey: "related_ids")
        }
        if reviewsAllowed != nil{
            aCoder.encode(reviewsAllowed, forKey: "reviews_allowed")
        }
        if salePrice != nil{
            aCoder.encode(salePrice, forKey: "sale_price")
        }
        if shippingClass != nil{
            aCoder.encode(shippingClass, forKey: "shipping_class")
        }
        if shippingClassId != nil{
            aCoder.encode(shippingClassId, forKey: "shipping_class_id")
        }
        if shippingRequired != nil{
            aCoder.encode(shippingRequired, forKey: "shipping_required")
        }
        if shippingTaxable != nil{
            aCoder.encode(shippingTaxable, forKey: "shipping_taxable")
        }
        if shortDescription != nil{
            aCoder.encode(shortDescription, forKey: "short_description")
        }
        if sku != nil{
            aCoder.encode(sku, forKey: "sku")
        }
        if slug != nil{
            aCoder.encode(slug, forKey: "slug")
        }
        if soldIndividually != nil{
            aCoder.encode(soldIndividually, forKey: "sold_individually")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if stockQuantity != nil{
            aCoder.encode(stockQuantity, forKey: "stock_quantity")
        }
        if stockStatus != nil{
            aCoder.encode(stockStatus, forKey: "stock_status")
        }
        if tags != nil{
            aCoder.encode(tags, forKey: "tags")
        }
        if taxClass != nil{
            aCoder.encode(taxClass, forKey: "tax_class")
        }
        if taxStatus != nil{
            aCoder.encode(taxStatus, forKey: "tax_status")
        }
        if totalSales != nil{
            aCoder.encode(totalSales, forKey: "total_sales")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if upsellIds != nil{
            aCoder.encode(upsellIds, forKey: "upsell_ids")
        }
        if variations != nil{
            aCoder.encode(variations, forKey: "variations")
        }
        if virtual != nil{
            aCoder.encode(virtual, forKey: "virtual")
        }
        if weight != nil{
            aCoder.encode(weight, forKey: "weight")
        }

    }

}


class Attribute : NSObject, NSCoding, Mappable{

    var id : Int?
    var name : String?
    var options : [String]?
    var position : Int?
    var variation : Bool?
    var visible : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return Attribute()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        id <- map["id"]
        name <- map["name"]
        options <- map["options"]
        position <- map["position"]
        variation <- map["variation"]
        visible <- map["visible"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         options = aDecoder.decodeObject(forKey: "options") as? [String]
         position = aDecoder.decodeObject(forKey: "position") as? Int
         variation = aDecoder.decodeObject(forKey: "variation") as? Bool
         visible = aDecoder.decodeObject(forKey: "visible") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if options != nil{
            aCoder.encode(options, forKey: "options")
        }
        if position != nil{
            aCoder.encode(position, forKey: "position")
        }
        if variation != nil{
            aCoder.encode(variation, forKey: "variation")
        }
        if visible != nil{
            aCoder.encode(visible, forKey: "visible")
        }

    }

}


class Category : NSObject, NSCoding, Mappable{

var id : Int?
var name : String?
var slug : String?


class func newInstance(map: Map) -> Mappable?{
    return Category()
}
required init?(map: Map){}
private override init(){}

func mapping(map: Map)
{
    id <- map["id"]
    name <- map["name"]
    slug <- map["slug"]
    
}

/**
* NSCoding required initializer.
* Fills the data from the passed decoder
*/
@objc required init(coder aDecoder: NSCoder)
{
     id = aDecoder.decodeObject(forKey: "id") as? Int
     name = aDecoder.decodeObject(forKey: "name") as? String
     slug = aDecoder.decodeObject(forKey: "slug") as? String

}

/**
* NSCoding required method.
* Encodes mode properties into the decoder
*/
@objc func encode(with aCoder: NSCoder)
{
    if id != nil{
        aCoder.encode(id, forKey: "id")
    }
    if name != nil{
        aCoder.encode(name, forKey: "name")
    }
    if slug != nil{
        aCoder.encode(slug, forKey: "slug")
    }
    
    }

}
