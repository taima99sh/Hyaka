//
//  LoginViewController.swift
//  Hyakah
//
//  Created by taima on 11/8/20.
//  Copyright © 2020 mac air. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit

class LoginViewController: UIViewController {
    
    let facebookLoginButton = FBLoginButton(frame: .zero, permissions: [.publicProfile, .email])
    
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var lblUnderLogin: UILabel!
    @IBOutlet weak var lblOrRegisterWith: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnToRegister: UIButton!
    @IBOutlet weak var btnForgetPassword: UIButton!
    @IBOutlet weak var txtPhoneNum: UITextField!
    @IBOutlet weak var tXtPassword: UITextField!
//    @IBOutlet weak var googleSignInButton: GIDSignInButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // Automatically sign in the user.
       // GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        //facebook
        facebookLoginButton.delegate = self
        facebookLoginButton.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    @IBAction func btnLogin(_ sender: Any) {
         guard self.validation() else {return}
        let vc = UIStoryboard.mainStoryboard
            .instantiateViewController(withIdentifier: "TabBarController")
        //UserProfile.shared.isLoggined = true
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
    }
    
    @IBAction func btnToRegister(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "RegisterViewController")
        AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
    }
    
    @IBAction func btnForgetPassword(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ForgetPasswordViewController") 
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnFacebook(_ sender: Any) {
        facebookLoginButton.sendActions(for: .touchUpInside)
    }
    
    @IBAction func btnGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
}
extension LoginViewController {
    func setupView(){}
    func localized(){}
    func setupData(){}
    func fetchData(){}
}

extension LoginViewController {
    func validation() -> Bool {
        if ( txtPhoneNum.isValidValue  && tXtPassword.isValidValue ) == false {
            self.ErrorMessage(title: "", errorbody: "هناك حقول فارغة")
            return false
        }
        return true
    }
    
}

// MARK: google sign In
extension LoginViewController: GIDSignInDelegate{
    func signIn(_ signIn: GIDSignIn!,
        presentViewController viewController: UIViewController!) {
      self.present(viewController, animated: true, completion: nil)
    }
    
    func signIn(_ signIn: GIDSignIn!,
        dismissViewController viewController: UIViewController!) {
      self.dismiss(animated: true, completion: nil)
    }
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
      withError error: Error!) {
        if let user = user {
            /*user.userID
            user.authentication.idToken
            user.profile.name
            user.profile.givenName
            user.profile.familyName
            user.profile.email */
            print(user.profile.name ?? "")
            let vc = UIStoryboard.mainStoryboard
                .instantiateViewController(withIdentifier: "TabBarController")
            AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
        }else {
          print("\(error.debugDescription)")
        }
    }
}

// MARK: google sign In
extension LoginViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error == nil {
            getUserDataFromFacebook()
        }
        
    }
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("User logged out")
    }
    
    func getUserDataFromFacebook() {
        GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, relationship_status"]).start(completionHandler: { (connection, result, error) -> Void in
            if (error == nil){
                let fbDetails = result as! NSDictionary
                print(fbDetails)
                let vc = UIStoryboard.mainStoryboard
                .instantiateViewController(withIdentifier: "TabBarController")
                AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
            }
        })
    }
}




