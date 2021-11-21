//
//  UITextFieldExtension.swift
//  E-commerce App
//
//  Created by taima on 9/28/19.
//  Copyright © 2019 mac air. All rights reserved.
//

import Foundation
import UIKit
private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var placeHolderColor: UIColor {
        set {
            self.attributedPlaceholder = NSAttributedString.init(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : newValue])
        }
        get {
            return self.placeHolderColor
        }
    }
    
    
    @IBInspectable var isRequired: Bool {
        set {
            let asterix = NSAttributedString(string: "  *", attributes: [.foregroundColor: UIColor.red])
            
            var firstText = NSMutableAttributedString(string: self.placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: "GrayTectColor".myColor])
            firstText.append(asterix)
            
            self.attributedPlaceholder = firstText
        }
        get {
            return false
        }
    }
    
    var isValidValue: Bool {
        return !(text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty ?? false)
    }
    
//    @IBInspectable var maxLength: Int {
//        get {
//            guard let l = __maxLengths[self] else {
//               return 150 // (global default-limit. or just, Int.max)
//            }
//            return l
//        }
//        set {
//            __maxLengths[self] = newValue
//            addTarget(self, action: #selector(fix), for: .editingChanged)
//        }
//    }
//    @objc func fix(textField: UITextField) {
////        if textField.text?.count ?? 0 < maxLength {
////            return
////        }
//        let t = textField.text
//        let a = t?.prefix(maxLength) as? String
//        textField.text = a
//        print(a)
//        print(textField.text)
//        print(t?.prefix(maxLength))
//        
//    }
//
//    @IBInspectable var bordertaimaColor: UIColor {
//        set {
//             func textFieldDidBeginEditing(textField: UITextField) {
//                self.layer.borderColor = newValue.cgColor                //uitextfieldAmount.layer.borderColor = colorBorder.CGColor
//                //uitextfieldNote.layer.borderColor = colorBorder.CGColor
//            }
//
//        }
//        get {
//            return UIColor.init(cgColor: self.layer.borderColor ?? UIColor.white.cgColor)
//        }
//    }
    
    
    @IBInspectable var fontType: String {
        set {
            switch newValue {
            case "body":
                self.font = Constant.shared.ProjectFont.toFont(size: 16) ?? UIFont(name: "Arial", size: 14)
            case "h1":
                self.font = Constant.shared.ProjectFont.toFont(size: 22) ?? UIFont(name: "Arial", size: 14)
            case "h2":
                self.font = Constant.shared.ProjectFont.toFont(size: 16) ?? UIFont(name: "Arial", size: 14)
            default:
                self.font = Constant.shared.ProjectFont.toFont(size: 16) ??  UIFont(name: "Arial", size: 14)
            }
        }
        get {
            return self.fontType
        }
    }
    
}
