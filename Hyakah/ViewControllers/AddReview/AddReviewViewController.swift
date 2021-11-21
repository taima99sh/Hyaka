//
//  AddReviewViewController.swift
//  Hyakah
//
//  Created by taima on 11/14/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit
import Cosmos

class AddReviewViewController: UIViewController {
    var img: String = ""
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtComment: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    
    @IBOutlet weak var reviewView: CosmosView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)    }
    
    @IBAction func btnSend(_ sender: Any) {
    }
}
extension AddReviewViewController {
    func setupView(){
        if self.profileImageView.image == nil {
            profileImageView.setImage(string:"Layla Khalefa", color: "secondaryColor".myColor, circular: false, stroke: false)
        }
        
        self.imgView.LoadImageFromUrl(url: img)
        
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}
}
