# FaceId-Authentication-IphoneX
Face Id Authentication integration into the app

The code demonstrates how to integrate Face Id authentication integration into the app. Face Id is currently supported on iPhone X.
This Code also works for touchId authentication.

Detailed explanation of the code will be added soon in https://www.machinethinks.com
Output response is available https://www.youtube.com/embed/cVszLYc85Bo

Class MTBiometricAuthentication in this project is responsible for biometeric authentication and notify the success / fail status with 
Post Notification

How to use MTBiometricAuthentication class.

1) Create an instance of MTBiometricAuthentication class
2) Call authenticationWithBiometricID to initiate the authentication process
3) Add notification observerers as below:

  NotificationCenter.default.addObserver(self, selector: #selector(LoginVC.authenticationCompletionHandler(loginStatusNotification:)),
    name: .MTBiometricAuthenticationNotificationLoginStatus, object: nil)
  
4) Typecast userInfo[MTBiometricAuthentication.status] to MTBiomericAuthenticationStatus instance (authStatus) that  holds the response object.
  a) check if authStatus.success is true for successfull authentication
  b) if authStatus.success is false, check for authStatus.errorMessage for error message and  authStatus.errorCode for LAError code.
  Currently all the possible error codes are mapped to error message in the response.
 
Output Screenshot from this project:
    
![alt text](https://github.com/sriscode/FaceId-Authentication-IphoneX/blob/master/FaceIDAuthenticating.PNG)
    
