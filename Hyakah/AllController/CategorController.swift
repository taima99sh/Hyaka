//
//  CategorController.swift
//  Hyakah
//
//  Created by Mac on 9/16/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper
//import MBProgressHUD
class CategorController: WebServiceManager {
    

    
    let maincontroller = MainController()
    
    public static func shared(viewController: UIViewController) -> CategorController{
        return CategorController(viewController: viewController)
    }
    
    override init(viewController: UIViewController) {
        super.init(viewController: viewController)
        self.TAG = "CategorController";
    }
    
    override init() {
        super.init()
    }
    //Get Categor
    public func getCategor(callback: @escaping CategorRequestHandler){
        self.internetConnectionChecker { (status) in
            if status{

                let configApi = categoriesApi
                
                Alamofire.request(configApi, method: .get, encoding: URLEncoding.default).responseArray {  (response: DataResponse<[CategoriesModel]>) in
                    let dataBack = String(decoding: response.data!, as: UTF8.self)
                    print("### Categor", dataBack)

                    callback(response.value)
                }
            }
        }
    }
    // Taima
    public func getProducts(id: Int = 15, numOfPages: Int = 10, callback: @escaping ProductsRequestHandler){
        self.internetConnectionChecker { (status) in
            if status{
                
                let BaseURL = "https://hyakah.com/wp-json/wc/v3/products?consumer_key=ck_1d23e2dd9b999b50dd95928f25da3ddf2c7456ef&consumer_secret=cs_06b3f27c29c5177c2c00d5e58ef7c8ecc32ba370"
                let parameters: Parameters = [
                    "categories": "\(id)",
                    "per_page": "\(numOfPages)"
                ]
                guard let url = URL.init(string: BaseURL) else { return }

                Alamofire.request(url, method: .get,parameters: parameters, encoding: URLEncoding.default).responseArray {  (response: DataResponse<[ProductsModel]>) in
                    let dataBack = String(decoding: response.data!, as: UTF8.self)
                    print("### products", dataBack)

                    callback(response.value)
                }
            }
        }
    }
    
    
    public func getReviews(id: Int = 16279, callback: @escaping ReviewsRequestHandler){
        self.internetConnectionChecker { (status) in
            if status{
                
                let BaseURL = "https://hyakah.com/wp-json/wc/v3/products/reviews?product=\(id)&consumer_key=ck_1d23e2dd9b999b50dd95928f25da3ddf2c7456ef&consumer_secret=cs_06b3f27c29c5177c2c00d5e58ef7c8ecc32ba370&fbclid=IwAR1IYUNFJH2VwzMORKiOehMqHTZ4jV-yLHOEEb2STgzT1TY-Cpd6IYoLdE4"
                let parameters: Parameters = [
                    "product": "16279"
                ]
                guard let url = URL.init(string: BaseURL) else { return }

                Alamofire.request(url, method: .get, encoding: URLEncoding.default).responseArray {  (response: DataResponse<[ReviewModel]>) in
                    let dataBack = String(decoding: response.data!, as: UTF8.self)
                    print("### products", dataBack)
                    callback(response.value)
                }
            }
        }
    }
    //Taima
    public func getProduct(id: Int = 16279, callback: @escaping ProductRequestHandler){
        self.internetConnectionChecker { (status) in
            if status{
                
                let BaseURL = "https://hyakah.com/wp-json/wc/v3/products/\(id)?consumer_key=ck_1d23e2dd9b999b50dd95928f25da3ddf2c7456ef&consumer_secret=cs_06b3f27c29c5177c2c00d5e58ef7c8ecc32ba370"
               
                guard let url = URL.init(string: BaseURL) else { return }
                
                Alamofire.request(url, method: .get , encoding: URLEncoding.default).responseObject { (response: DataResponse<ProductsModel>) in
                    let dataBack = String(decoding: response.data!, as: UTF8.self)
                    print("### products", dataBack)
                    callback(response.value)
                }

            }
        }
        
    }
}

    //print(response.data)
    //print(response.request?.url)
    //print(response.request?.allHTTPHeaderFields)
    //let json = try! JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableContainers)
    //print(json)

