//
//  ViewController.swift
//  Hyakah
//
//  Created by taima on 11/6/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class HomeViewController: UIViewController {
    
    @IBOutlet weak var bestCollectionView: GeneralCollectionView!
    
    @IBOutlet weak var specialOffersCollectionView: GeneralCollectionView!
    
    @IBOutlet weak var newCollectionView: GeneralCollectionView!
    
    @IBOutlet weak var bestReviwCollectionView: GeneralCollectionView!
    
    @IBOutlet weak var categoriesCollectionView: GeneralCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
        fetchData(id: 209, collectionView: bestCollectionView)
        fetchData(id: 207, collectionView: bestReviwCollectionView)
        fetchData(id: 211, collectionView: specialOffersCollectionView)
        fetchData(id: 206, collectionView: newCollectionView)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(true, animated: false)
            self.navigationItem.imageTitle = UIImage()
            self.tabBarController?.navigationItem.rightBarButtonItem  = nil
        }
    
    @IBAction func btnToInstagram(_ sender: Any) {
        if let url = URL(string: "https://www.instagram.com/hyakah_com/?fbclid=IwAR00KKDQiD3zY-zhH8INDS7abMHco-k_cBpNYItiIsvnaFXaTza8YwENwFY") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func btnToTwitter(_ sender: Any) {
        if let url = URL(string: "https://twitter.com/hyakah_com?fbclid=IwAR0O_O6xx1872IRX6NbftGoM4yuWY8QSzt02bpbfPrcENMPveNgMJiT4U7w") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func btnToFacebook(_ sender: Any) {
        if let url = URL(string: "https://www.facebook.com/hyakah") {
            UIApplication.shared.open(url)
        }
    }
    
    }

    extension HomeViewController {
        func setupView(){
            self.showIndicator(withTitle: nil, and: nil)
            bestCollectionView.register(UINib(nibName: "HomeCategoriesListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCategoriesListCollectionViewCell")
            
            bestReviwCollectionView.register(UINib(nibName: "HomeCategoriesListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCategoriesListCollectionViewCell")
            
            specialOffersCollectionView.register(UINib(nibName: "HomeCategoriesListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCategoriesListCollectionViewCell")
            
            newCollectionView.register(UINib(nibName: "HomeCategoriesListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCategoriesListCollectionViewCell")
            
            categoriesCollectionView.register(UINib(nibName: "HomeCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCategoriesCollectionViewCell")
        }
        func localized(){}
        func setupData(){}
        func fetchData(){
            let width2 = categoriesCollectionView.frame.height
            CategorController.shared(viewController: self).getCategor { (categories) in
                if let categories = categories {
                    for category in categories {
                        if category.id == 209 || category.id == 208 || category.id == 206 || category.id == 211 || category.id == 207 {
                            self.categoriesCollectionView.objects.append(GeneralCollectionViewData(identifier: "HomeCategoriesCollectionViewCell", object: category, cellSize: CGSize.init(width: width2, height: width2)))
                        }
                    }
                    self.categoriesCollectionView.reloadData()
                    
                }
            }
            
            //CategorController.shared(viewController: self).getCurrentCurrency()
        }
        
        func fetchData(id: Int = 207, collectionView: GeneralCollectionView) {
            let width = (bestCollectionView.frame.size.height - 20) / 2
            CategorController.shared(viewController: self).getProducts(id: id, numOfPages: 10) { (products) in
                if let products = products {
                    for product in products {
                        collectionView.objects.append(GeneralCollectionViewData(identifier: "HomeCategoriesListCollectionViewCell", object: product, cellSize: CGSize.init(width: width, height: width)))
                    }
                    self.hideIndicator()
                    collectionView.reloadData()
                }
            }

        }
        
        
        
    }



