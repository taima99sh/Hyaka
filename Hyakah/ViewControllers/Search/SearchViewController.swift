//
//  SearchViewController.swift
//  Hyakah
//
//  Created by taima on 11/9/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var CollectionView: GeneralCollectionView!
    
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
    }
}
extension SearchViewController {
    func setupView(){
        CollectionView.register(UINib(nibName: "CategoriesListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesListCollectionViewCell")
    }
    func localized(){}
    func setupData(){
        CollectionView.EmptyDataImage = "EmptyIcon".image_
        CollectionView.EmptyDataTitle = "لم يتم العثور على نتائج لبحثك"
    }
    func fetchData(){}
}
