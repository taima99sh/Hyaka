//
//  CategoryListViewController.swift
//  Hyakah
//
//  Created by taima on 11/8/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit
import MBProgressHUD

class CategoryListViewController: UIViewController {
    
    var categoryObj: CategoriesModel?
    var products: [ProductsModel] = []
    
    var numberPag = 10 {
        didSet {
            MBProgressHUD.showAdded(to: self.view, animated: true)
            self.fetchData()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
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
        let refreshControl = UIRefreshControl()
    refreshControl.tintColor = "lineColor".myColor
        refreshControl.addTarget(self, action:  #selector(fetchData), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }
}
extension CategoryListViewController {
    func setupView(){
        collectionView.register(UINib(nibName: "CategoriesListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesListCollectionViewCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    func localized(){
        self.navigationItem.title = self.categoryObj?.name
    }
    func setupData(){}
    @objc func fetchData(){
        
        self.products = []
        CategorController.shared(viewController: self).getProducts(id: self.categoryObj?.id ?? 0, numOfPages: self.numberPag) { (products) in
            if let products = products {
                self.products = products
                self.collectionView.refreshControl?.endRefreshing()
                MBProgressHUD.hide(for: self.view, animated: true)
                self.collectionView.reloadData()
            }
        }
        
    }
    
    
}

extension CategoryListViewController: UICollectionViewDelegate {
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ItemViewControllers") as! ItemViewControllers
        vc.productObj = self.products[indexPath.row]
        AppDelegate.shared.rootNavigationViewController.pushViewController(vc, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == numberPag - 1 {  //numberofitem count
            self.numberPag += 10
        }

        
    }
    
}

extension CategoryListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesListCollectionViewCell", for: indexPath) as! CategoriesListCollectionViewCell
        if !self.products.isEmpty {
            cell.object = self.products[indexPath.row]
        }
        cell.btnFav.isHidden = true
        cell.configureCell()
        return cell
    }
    
    
}


extension CategoryListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (UIScreen.main.bounds.width - (20 + 35)) / 2
        return CGSize(width: width, height: width)
        

    }
}

