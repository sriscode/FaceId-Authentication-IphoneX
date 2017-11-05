//
//  HomeVC.swift
//  MTFaceIdAuthentication
//
//  Created by SA on 11/4/17.
//  Copyright © 2017 sriscode. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func LogoutTapped(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }

}
