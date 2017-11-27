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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var ipField: UITextField!
    @IBOutlet weak var submitIP: UIButton!
    @IBOutlet weak var submitEmail: UIButton!
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func closePopUp(_ sender: UIButton) {
        self.view.removeFromSuperview()
    }
    
    @IBAction func changeIP(_ sender: UIButton) {
        if (APIManager.shared.ip == nil) {
            NSLog("before is nil")
        } else {
            NSLog("before " + APIManager.shared.ip!)
        }
        UserDefaults.standard.set(ipField.text, forKey: "ip")
        APIManager.shared.ip = UserDefaults.standard.string(forKey: "ip")
        NSLog("after " + APIManager.shared.ip!)
        ipField.text = ""
    }
    
    @IBAction func changeEmail(_ sender: UIButton) {
        UserDefaults.standard.set(emailField.text, forKey: "email")
        // CALL EMAIL API
        emailField.text = ""
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
