//
//  ItemViewControllers.swift
//  Hyakah
//
//  Created by taima on 11/9/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class ItemViewControllers: UIViewController {
    
    var productObj: ProductsModel?
    var relatedProducts: [ProductsModel?] = []
    var sizes: [String] = []
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var lblProductCode: UILabel!
    
    @IBOutlet weak var btnSizes: UIButton!
    
    @IBOutlet weak var btnViewMoreReviews: UIButton!
    
    @IBOutlet weak var relatedProductsCollectionView: GeneralCollectionView!
    @IBOutlet weak var imagesCollectionView: GeneralCollectionView!
    @IBOutlet weak var reviewaTableView: GeneralTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        getRelatedProducts()
        fetchReviews()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    @IBAction func btnAddToFav(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "AddReviewViewController") as! AddReviewViewController
        self.navigationController?.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func btnShare(_ sender: Any) {
    }
    
    @IBAction func btnAddToCart(_ sender: Any) {
    }
    
    @IBAction func btnAddRating(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "AddReviewViewController") as! AddReviewViewController
        if let obj = productObj {
            vc.img = obj.images?[0].src ?? ""
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnViewMoreReviews(_ sender: Any) {
    }
    
    @IBAction func btnSizes(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "SizesPickerViewViewController") as! SizesPickerViewViewController
        vc.arr = self.sizes
        self.navigationController?.present(vc, animated: true, completion: nil)
        
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
extension ItemViewControllers {
    func setupView(){
        reviewaTableView.register(UINib.init(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
        reviewaTableView.isSelfSize = true
        
        relatedProductsCollectionView.register(UINib(nibName: "HomeCategoriesListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCategoriesListCollectionViewCell")
         self.btnViewMoreReviews.isHidden = true
        
    }
    func setupData(){
        fillSizes()
        reviewaTableView.EmptyDataTitle = "لاتوجد تقييمات"
        
        //imagesCollection
        let width = (UIScreen.main.bounds.width - 60) / 3
        if let images = self.productObj?.images {
            for image in images {
                imagesCollectionView.objects.append(GeneralCollectionViewData(identifier: "ImageItemCollectionViewCell", object: image, cellSize: CGSize.init(width: width, height: 143)))
            }
        }
        
        //after editing
        let currency = Constant.shared.Currency == "SAR" ? "ر.س" : Constant.shared.Currency
        if let obj = productObj {
            
           self.imgView.LoadImageFromUrl(url: obj.images?.isEmpty ?? true ? "" : obj.images?[0].src)
            self.lblPrice.text = "\(obj.price ?? "0") \(currency) "
            self.lblTitle.text = obj.name
            let desc = obj.descriptionField?.html2Attributed?.string
            self.lblDescription.text = desc
        }
                
    }
    
    func fillSizes() {
        //fill sizes
        if let obj = productObj {
            guard let attributes = obj.attributes else {return}
            if let index = attributes.firstIndex(where: {$0.id == 2}){
                self.sizes = attributes[index].options ?? []
                let sizeAsText = sizes.joined(separator:"  ")
                self.btnSizes.setTitle(sizeAsText, for: .normal)
                //self.txtSizes.text = sizeAsText
            }
        }
    }
    
    func getRelatedProducts (){
        if let obj = productObj {
            guard let relatedIDs = obj.relatedIds else {return}
            for id in relatedIDs {
                CategorController.shared(viewController: self).getProduct(id: id) { (product) in
                    self.relatedProducts.append(product)
                    self.relatedReload()
                }
            }
            
        }
            
    }
    
    func relatedReload() {
        relatedProductsCollectionView.objects = []
        let width1 = (relatedProductsCollectionView.frame.size.width - (20 + 35)) / 3
        let hight1 = relatedProductsCollectionView.frame.size.height - 30
        for product in self.relatedProducts.filter({ $0 != nil }) {
            relatedProductsCollectionView.objects.append(GeneralCollectionViewData(identifier: "HomeCategoriesListCollectionViewCell", object: product, cellSize: CGSize.init(width: width1, height: hight1)))
        }
        relatedProductsCollectionView.reloadData()
    }
    
    func fetchReviews() {
        if let obj = productObj {
            CategorController.shared(viewController: self).getReviews(id: obj.id ?? 16279) { (reviews) in
                if let reviews = reviews {
                    for review in reviews {
                        self.reviewaTableView.objects.append(GeneralTableViewData(identifier: "ReviewTableViewCell", object: review, rowHeight: nil))
                    }
                    self.btnViewMoreReviews.isHidden = reviews.count > 3 ? false : true
                    self.reviewaTableView.reloadData()
                    let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ReviewsViewController") as! ReviewsViewController
                    vc.productReviews = reviews
                }
            }
        }
    }
    
}

