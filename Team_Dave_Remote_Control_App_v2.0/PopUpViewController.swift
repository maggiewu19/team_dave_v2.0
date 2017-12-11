//
//  PopUpViewController.swift
//  Team_Dave_Remote_Control_App_v2.0
//
//  Created by Team Dave on 11/27/17.
//  Copyright © 2017 Shang-Yun Wu. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var ipField: UITextField!
    @IBOutlet weak var submitIP: UIButton!
    @IBOutlet weak var submitEmail: UIButton!
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func closePopUp(_ sender: UIButton) {
        self.view.removeFromSuperview()
    }
    
    @IBAction func changeIP(_ sender: UIButton) {
        UserDefaults.standard.set(ipField.text, forKey: "ip")
        APIManager.shared.ip = UserDefaults.standard.string(forKey: "ip")
        ipField.text = ""
    }
    
    @IBAction func changeEmail(_ sender: UIButton) {
        UserDefaults.standard.set(emailField.text, forKey: "email")
        APIManager.shared.email(email: UserDefaults.standard.string(forKey: "email")!)
        emailField.text = ""
    }

}
