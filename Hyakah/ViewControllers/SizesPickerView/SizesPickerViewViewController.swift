//
//  SizesPickerViewViewController.swift
//  Hyakah
//
//  Created by taima on 11/17/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit

class SizesPickerViewViewController: UIViewController {
    
    var arr: [String] = ["773","665","555","888"]

    @IBOutlet weak var sizePickerView: UIPickerView!
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
extension SizesPickerViewViewController {
    func setupView(){
        sizePickerView.dataSource = self
        sizePickerView.delegate = self
    }
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension SizesPickerViewViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        arr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr[row]
    }
   
}
