//
//  CofigrationController.swift
//  Hyakah
//
//  Created by Mac on 1/13/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class CofigrationController: WebServiceManager {
    
    let maincontroller = MainController()
    
    public static func shared(viewController: UIViewController) -> CofigrationController{
        return CofigrationController(viewController: viewController)
    }
    
    override init(viewController: UIViewController) {
        super.init(viewController: viewController)
        self.TAG = "CofigrationController";
    }
    public func getCMS(id: Int = 11713,callback: @escaping RequestHandlerCMSPages){
        self.internetConnectionChecker { (status) in
            if status{

                let AboutApi = CMSApi + "\(id)"
                Alamofire.request(AboutApi,method: .get , encoding: URLEncoding.queryString).responseObject {  (response: DataResponse<MainPagesModels>) in
                    let Databack = String(decoding: response.data!, as: UTF8.self)
                    print("### About Us", Databack)
                    callback(response.value)
                }
            }
        }
    }
    
}

