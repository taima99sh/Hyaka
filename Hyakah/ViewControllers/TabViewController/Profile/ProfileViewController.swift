//
//  ProfileViewController.swift
//  Hyakah
//
//  Created by taima on 11/10/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
import SCLAlertView
class ProfileViewController: UIViewController {
    
    let appearance = SCLAlertView.SCLAppearance(
        kTitleFont: Constant.shared.ProjectFont.toFont() ?? UIFont(),
        kTextFont: Constant.shared.ProjectFont.toFont()!,
        kButtonFont: Constant.shared.ProjectFont.toFont()!,
        showCloseButton: true,
        circleBackgroundColor: "secondaryColor".myColor
        //contentViewColor: "".myColor
    )

    @IBOutlet weak var lblNotLogin: UILabel!
    
     @IBOutlet weak var loginStackView: UIStackView!
    
    @IBOutlet weak var notLoginStackView: UIStackView!
    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
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
        self.tabBarController?.navigationItem.title = "الملف الشخصي"
        let btnSetting = UIBarButtonItem(image: "settings-3".image_, style: .plain, target: self, action: #selector(toSettings))
        self.tabBarController?.navigationItem.rightBarButtonItem  = btnSetting
    
    }
    
    @objc func toSettings(){
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "SettingsViewController")
        self.navigationController?.pushViewController(vc, animated: false)
         print("clicked")
    }
    
    @IBAction func toRegister(_ sender: Any) {
    }
    
    @IBAction func toLogin(_ sender: Any) {
    }
    
    @IBAction func btnMyOrder(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "MyOrdersViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnMyInfo(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "MyInfoViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnChangePassword(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ChangePasswordViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnToAddresses(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "AddressesViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnLogOut(_ sender: Any) {
        let alertView = SCLAlertView(appearance: self.appearance)
        alertView.addButton("تأكيد") {
            GIDSignIn.sharedInstance().signOut()
            LoginManager().logOut()
            let vc = UIStoryboard.mainStoryboard
            .instantiateViewController(withIdentifier: "FirstScreenViewController")
            AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
        }
        alertView.showWarning("تحذير", subTitle: "هل تريد تسجيل الخروج من التطبيق؟",closeButtonTitle: "إلغاء")
    }
    
}
extension ProfileViewController {
    func setupView(){
        notLoginStackView.isHidden = UserProfile.shared.isUserLogin() ? true : false
        
        loginStackView.isHidden = UserProfile.shared.isUserLogin() ? false : true
        
        
        if self.profileImg.image == nil {
            profileImg.setImage(string:"Layla Khalefa", color: "secondaryColor".myColor, circular: false, stroke: false)
        }
    }
    func localized(){}
    func setupData(){
        
    }
    func fetchData(){}
}

