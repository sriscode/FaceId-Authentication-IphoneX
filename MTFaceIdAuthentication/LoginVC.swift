//
//  LoginVC.swift
//  MTFaceIdAuthentication
//
//  Created by SA on 11/4/17.
//  Copyright © 2017 sriscode. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    let HomeVCId = "HomeVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(LoginVC.authenticationCompletionHandler(loginStatusNotification:)), name: .MTBiometricAuthenicationNotificationLoginStatus, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginSubmitted(_ sender: Any) {
       // Normal Login Flow with username, password authentication
        self.onLoginSuccess()
    }
    
    @IBAction func bioMetricLoginSubmitted(_ sender: Any) {
//         iOS 11.0 is the minimum iOS version for faceId authentication. Uncomment if check you need to use the touch Id authentication
// 
//       if #available(iOS 11.0, macOS 10.12.1, *) {
     
            authenticateWithBiometric()
        
//       }
    }
    
    
    @objc func authenticationCompletionHandler(loginStatusNotification: Notification) {
        if let _ = loginStatusNotification.object as? MTBiometricAuthenication, let userInfo = loginStatusNotification.userInfo {
            if let authStatus = userInfo[MTBiometricAuthenication.status] as? MTBiomericAuthenticationStatus {
                if authStatus.success {
                    print("Login Success")
                    DispatchQueue.main.async {
                        self.onLoginSuccess()
                    }
                } else {
                    if let errorCode = authStatus.errorCode {
                        print("Login Fail with code \(String(describing: errorCode)) reason \(authStatus.errorMessage)")
                        DispatchQueue.main.async {
                            self.onLoginFail()
                            }
                    
                    }
                }
            }
        }
    }
    
    func onLoginSuccess() {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let homeVC = mainStoryboard.instantiateViewController(withIdentifier: HomeVCId)
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func onLoginFail() {
        let alert = UIAlertController(title: "Login", message: "Login Failed", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func authenticateWithBiometric() {
        let bioAuth = MTBiometricAuthenication()
        bioAuth.reasonString = "To login into the app"
        bioAuth.authenticationWithTouchID()
    }

}
