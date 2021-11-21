//
//  Constant.swift
//  Hyakah
//
//  Created by taima on 11/6/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class Constant: WebServiceManager {
    static let shared = Constant()
    var ProjectFont = "Janna LT"
    var Currency: String = ""
    
    public func getCurrentCurrency(){
        self.internetConnectionChecker { (status) in
            if status{

                let BaseURL = "https://hyakah.com/wp-json/wc/v3/data/currencies/current?consumer_key=ck_1d23e2dd9b999b50dd95928f25da3ddf2c7456ef&consumer_secret=cs_06b3f27c29c5177c2c00d5e58ef7c8ecc32ba370"
                guard let url = URL.init(string: BaseURL) else { return }
                
                Alamofire.request(url, method: .get , encoding: URLEncoding.default).responseObject { (response: DataResponse<currencyModel>) in
                    if let currency = response.value {
                        Constant.shared.Currency = currency.code ?? ""
                    }
                    
                }
            }
        }
    }
}
