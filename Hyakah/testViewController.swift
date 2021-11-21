//
//  testViewController.swift
//  Hyakah
//
//  Created by taima on 11/10/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit
import Cosmos

class testViewController: UIViewController {

    @IBOutlet weak var ratingView: CosmosView!
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
    }
    
    
}
extension testViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}
