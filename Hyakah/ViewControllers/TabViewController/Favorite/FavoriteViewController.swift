//
//  FavoriteViewController.swift
//  Hyakah
//
//  Created by taima on 11/9/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    @IBOutlet weak var collectionView: GeneralCollectionView!
    
    @IBOutlet weak var loginRegisterStackView: UIStackView!
    
    var categoryListArr: [CategoryList] = [CategoryList(img: "cellImage", price: "449", currency: "ر.س"),
    CategoryList(img: "cellImage", price: "449", currency: "ر.س"),
    CategoryList(img: "cellImage", price: "449", currency: "ر.س"),
    CategoryList(img: "cellImage", price: "449", currency: "ر.س"),
    CategoryList(img: "cellImage", price: "449", currency: "ر.س"),
    CategoryList(img: "cellImage", price: "449", currency: "ر.س"),
    CategoryList(img: "cellImage", price: "449", currency: "ر.س"),
    CategoryList(img: "cellImage", price: "449", currency: "ر.س")
    ]
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
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.tabBarController?.navigationItem.title = "المفضلة"
        self.tabBarController?.navigationItem.rightBarButtonItem  = nil
        
    }
    
}
extension FavoriteViewController {
    func setupView(){
        collectionView.register(UINib(nibName: "HomeCategoriesListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCategoriesListCollectionViewCell")
        self.loginRegisterStackView.isHidden = true
    }
    func localized(){}
    func setupData(){
        let width1 = (collectionView.frame.size.width - (20 + 35)) / 2
        let hight = width1
        let categoryList: CategoryList = CategoryList(img: "cellImage", price: "449", currency: "ر.س")
//        guard !isFavArrayIsEmpty() else {return}
        isFavArrayIsEmpty()
        for obj in categoryListArr {
            collectionView.objects.append(GeneralCollectionViewData(identifier: "HomeCategoriesListCollectionViewCell", object: obj, cellSize: CGSize.init(width: width1, height: hight)))
        }
    }
    func fetchData(){}
}


extension FavoriteViewController {
    func isFavArrayIsEmpty() -> Bool {
        if categoryListArr.isEmpty {
            loginRegisterStackView.isHidden = UserProfile.shared.isUserLogin() ? true : false
            collectionView.EmptyDataTitle = "المفضلة فارغة"
            collectionView.EmptyDataImage = "surprisedIcon".image_
            return true
        } else  {
            return false
        }
    }
}
