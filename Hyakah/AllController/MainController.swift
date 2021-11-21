//
//  MainController.swift
//  Hyakah
//
//  Created by Mac on 11/24/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit
import SCLAlertView

import Foundation
import SystemConfiguration
import SwiftMessages
import Alamofire

class MainController {
    
    static func getDeviceLocale() -> String {
        let currentLocale = NSLocale.current.languageCode!
        print(currentLocale)
        return currentLocale
    }
    func getHeader() -> Dictionary<String,String>{
        
        let header: Dictionary<String,String> = [
            "Content-Type": "application/json",
            "Authorization":"Bearer voahu24gp00ztk4tjr8fgczons2bfb58"
        ]
        
        
        return header
        
    }
    
    public static func isValidEmail(emailAddress:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailAddress)
    }
    
    public static func isEmpty(text: String) -> Bool {
        if text.isEmpty {
            return true
        }
        if text == "" {
            return true
        }
        return false
    }
    
    public static func isConnectedToInternet() -> Bool{
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    public  func ErrorMessage(title:String? , errorbody:String?){
        let Errorview = MessageView.viewFromNib(layout: .cardView)
        Errorview.configureTheme(.error)
        Errorview.configureContent(title: title, body: errorbody, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: NSLocalizedString("Hide", comment: ""), buttonTapHandler: { _ in SwiftMessages.hide() })
        SwiftMessages.show(view: Errorview)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            SwiftMessages.hideAll()
        }
    }
    
    public  func SuccessMessage(title:String? , successbody:String?){
        let Successview = MessageView.viewFromNib(layout: .messageView)
        Successview.configureTheme(.success)
        Successview.configureContent(title: title!, body: successbody!)
        Successview.button?.isHidden = true
        SwiftMessages.show(view: Successview)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            SwiftMessages.hideAll()
        }
    }
    
    
    
    public  func NoticMessage(title:String? , noticbody:String?){
        let Noticview = MessageView.viewFromNib(layout: .centeredView)
        Noticview.configureTheme(.warning)
        Noticview.configureContent(title: title, body: noticbody, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: NSLocalizedString("Hide", comment: ""), buttonTapHandler: { _ in SwiftMessages.hide() })
        SwiftMessages.show(view: Noticview)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            SwiftMessages.hideAll()
        }
    }
    
    public static func viewAlertDialog(vc:UIViewController, title: String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    public static func getString(key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
    public static func setNavBarTransparent(viewController: UIViewController){
        viewController.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        viewController.navigationController?.navigationBar.shadowImage = UIImage()
        viewController.navigationController?.navigationBar.isTranslucent = true
        viewController.navigationController?.view.backgroundColor = .clear
        viewController.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    
    public static func showSignInAlert(navigationController: UINavigationController){
//        let appearance = SCLAlertView.SCLAppearance(
//            showCloseButton: false,
//            shouldAutoDismiss: false
//        )
//        
//        let alertView = SCLAlertView(appearance: appearance)
//        alertView.addButton(NSLocalizedString(NSLocalizedString("Sign in", comment: ""), comment: "")) {
//            let vc : ViewController = AppDelegate.storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//            navigationController.pushViewController(vc, animated: true)
//            alertView.hideView()
//        }
//        alertView.showError(NSLocalizedString("Alert", comment: ""), subTitle: NSLocalizedString("user message", comment: ""))
    }
    
//    public static func controlBackItem(backItem: UIBarButtonItem){
//        if L102Language.currentAppleLanguage().elementsEqual("ar"){
//            if let _img = backItem.image {
//                backItem.image =  UIImage(cgImage: _img.cgImage!, scale:_img.scale , orientation: UIImage.Orientation.upMirrored)
//            }
//        }
//    }
//    
//    public static func controlMenuItem(menuItem: UIBarButtonItem){
//        if L102Language.currentAppleLanguage().elementsEqual("en"){
//            if let _img = menuItem.image {
//                menuItem.image =  UIImage(cgImage: _img.cgImage!, scale:_img.scale , orientation: UIImage.Orientation.upMirrored)
//            }
//        }
//    }
//    
    public static func share(viewController:UIViewController, url: String){
        // let someText:String = "Hello want to share text also"
        let objectsToShare:URL = URL(string: url)!
        // let sharedObjects:[AnyObject] = [objectsToShare as AnyObject,someText as AnyObject]
        let sharedObjects:[AnyObject] = [objectsToShare as AnyObject]
        let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = viewController.view
        
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.mail]
        
        viewController.present(activityViewController, animated: true, completion: nil)
    }
}
