//
//  WebServiceManager.swift
//  Hyakah
//
//  Created by Mac on 11/21/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import SCLAlertView
import Alamofire

class WebServiceManager {
    
    public var TAG: String = "";
    private var viewController: UIViewController!
    private var appDelegate: AppDelegate!
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }
    
    init() {
    }
    
    public func noInternetErrorMessage(callback: @escaping InternetConnectionChecker){
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false,
            shouldAutoDismiss: false
        )
        
        let alertView = SCLAlertView(appearance: appearance)
        

        alertView.addButton(NSLocalizedString("TryAgain", comment: "")) {
            if MainController.isConnectedToInternet(){
                alertView.hideView()
                callback(true)
            }else{
                callback(false)
            }
        }
        alertView.showError(NSLocalizedString("InterntConnection", comment: ""), subTitle: NSLocalizedString("CheckInternetConnection", comment: ""))
    }
    
    public func internetConnectionChecker(callback: @escaping InternetConnectionChecker){
        if MainController.isConnectedToInternet() {
            callback(true)
        }else{
            noInternetErrorMessage(callback: callback)
        }
    }
}
