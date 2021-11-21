//
//  CMSViewController.swift
//  Hyakah
//
//  Created by Mac on 11/18/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class CMSViewController: UIViewController {
    
    @IBOutlet weak var lblText: UITextView!
    var id: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        getCMSPAGES()
        // Do any additional setup after loading the view.
    }
    
    func getCMSPAGES(){
        self.showIndicator(withTitle: nil, and: nil)
        CofigrationController.shared(viewController: self).getCMS(id: self.id) { (result)  in
            let data = result?.content?.rendered?.html2Attributed?.string
            self.hideIndicator()
            self.lblText.text = data
            self.navigationItem.title = result?.title?.rendered
            print(data as Any)

        }
    }

}
//extension Data {
//    var html2AttributedString: NSAttributedString? {
//        do {
//            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
//        } catch {
//            print("error:", error)
//            return  nil
//        }
//    }
//    var html2String: String {
//        return html2AttributedString?.string ?? ""
//    }
//}
//
//extension String {
//    var html2AttributedString: NSAttributedString? {
//        return Data(utf8).html2AttributedString
//    }
//    var html2String: String {
//        return html2AttributedString?.string ?? ""
//    }
//        func strikeThrough() -> NSAttributedString {
//            let attributeString =  NSMutableAttributedString(string: self)
//            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
//            return attributeString
//        }
//
//}
