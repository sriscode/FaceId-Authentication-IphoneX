# FaceId-Authentication-IphoneX
Face Id Authentication integration into the app

The code here demonstrates how to integrate Face Id authentication integration into the app. Face Id is currently supported on iPhone X.
Thia Code also works for touchId authenticaiton.

Detailed explanation of the code will be added soon in https://www.machinethinks.com

clas MTBiometricAuthenication in this respository is responsible for biometeric authentication and notify the success / fail status with 
Post Notification

How to use MTBiometricAuthenication class
1) Create an instance of MTBiometricAuthenication class
2) call authenticationWithBiometricID to initiate the authentication process
3) add notification observerers as below

  NotificationCenter.default.addObserver(self, selector: #selector(LoginVC.authenticationCompletionHandler(loginStatusNotification:)),
    name: .MTBiometricAuthenicationNotificationLoginStatus, object: nil)
  
4) Implement the authenticationCompletionHandler as below.

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
    
    
    Output Screenshot from this project:
    
    ![alt text](https://github.com/sriscode/FaceId-Authentication-IphoneX/blob/master/FaceIDAuthenticating.PNG)
    
