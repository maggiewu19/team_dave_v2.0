//
//  ViewController.swift
//  Team_Dave_Remote_Control_App_v2.0
//
//  Created by Shang-Yun Wu on 10/25/17.
//  Copyright © 2017 Shang-Yun Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var receivedString = ""
//    let blue = UIColor.blue;
    let blue = UIColor(red: 157/255, green: 223/255, blue: 255/255, alpha: 1);
    let red = UIColor(red: 255/255, green: 119/255, blue: 121/255, alpha: 1);
    
    static var currentPreset = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSLog("received string " + receivedString)
        NSLog("currentPreset " + String(ViewController.currentPreset))
        
        if (ViewController.currentPreset == 1) {
            Outlet1.setTitle(receivedString, for: .normal)
        } else if (ViewController.currentPreset == 2) {
            Outlet2.setTitle(receivedString, for: .normal)
        } else if (ViewController.currentPreset == 3) {
            Outlet3.setTitle(receivedString, for: .normal)
        } else if (ViewController.currentPreset == 4) {
            Outlet4.setTitle(receivedString, for: .normal)
        } else if (ViewController.currentPreset == 5) {
            Outlet5.setTitle(receivedString, for: .normal)
        } else if (ViewController.currentPreset == 6) {
            Outlet6.setTitle(receivedString, for: .normal)
        } else if (ViewController.currentPreset == 7) {
            Outlet7.setTitle(receivedString, for: .normal)
        } else if (ViewController.currentPreset == 8) {
            Outlet8.setTitle(receivedString, for: .normal)
        } else if (ViewController.currentPreset == 9) {
            Outlet9.setTitle(receivedString, for: .normal)
        }

        changeOutlet.layer.cornerRadius = 15;
        channelOutlet.layer.cornerRadius = 15;
        // make buttons circular
        Outlet1.layer.cornerRadius = 0.5 * Outlet1.bounds.size.width;
        Outlet2.layer.cornerRadius = 0.5 * Outlet2.bounds.size.width;
        Outlet3.layer.cornerRadius = 0.5 * Outlet3.bounds.size.width;
        Outlet4.layer.cornerRadius = 0.5 * Outlet4.bounds.size.width;
        Outlet5.layer.cornerRadius = 0.5 * Outlet5.bounds.size.width;
        Outlet6.layer.cornerRadius = 0.5 * Outlet6.bounds.size.width;
        Outlet7.layer.cornerRadius = 0.5 * Outlet7.bounds.size.width;
        Outlet8.layer.cornerRadius = 0.5 * Outlet8.bounds.size.width;
        Outlet9.layer.cornerRadius = 0.5 * Outlet9.bounds.size.width;
        
        // set button colors
        Outlet1.backgroundColor = blue
        Outlet2.backgroundColor = blue
        Outlet3.backgroundColor = blue
        Outlet4.backgroundColor = blue
        Outlet5.backgroundColor = blue
        Outlet6.backgroundColor = blue
        Outlet7.backgroundColor = blue
        Outlet8.backgroundColor = blue
        Outlet9.backgroundColor = blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toChangePresetVC(viewIdentifier: String) {
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ChangePresetViewController")
//        let vc = storyboard?.instantiateViewController(withIdentifier: "ChangePresetViewController") as! ChangePresetVCViewController
//        vc.stringPassed = passedPreset
        navigationController?.pushViewController(vc as! UIViewController, animated: true)
//        self.show(vc as! UIViewController, sender: vc)
    }
    
    @IBOutlet weak var channelOutlet: UIButton!
    @IBOutlet weak var changeOutlet: UIButton!
    @IBOutlet weak var Outlet1: UIButton!
    @IBOutlet weak var Outlet2: UIButton!
    @IBOutlet weak var Outlet3: UIButton!
    @IBOutlet weak var Outlet4: UIButton!
    @IBOutlet weak var Outlet5: UIButton!
    @IBOutlet weak var Outlet6: UIButton!
    @IBOutlet weak var Outlet7: UIButton!
    @IBOutlet weak var Outlet8: UIButton!
    @IBOutlet weak var Outlet9: UIButton!
    
    @IBAction func changePreset(_ sender: Any) {
        if Outlet1.backgroundColor == blue {
            // change all outlet buttons to red
            Outlet1.backgroundColor = red
            Outlet2.backgroundColor = red
            Outlet3.backgroundColor = red
            Outlet4.backgroundColor = red
            Outlet5.backgroundColor = red
            Outlet6.backgroundColor = red
            Outlet7.backgroundColor = red
            Outlet8.backgroundColor = red
            Outlet9.backgroundColor = red
        } else {
//            currentPreset = 0
            Outlet1.backgroundColor = blue
            Outlet2.backgroundColor = blue
            Outlet3.backgroundColor = blue
            Outlet4.backgroundColor = blue
            Outlet5.backgroundColor = blue
            Outlet6.backgroundColor = blue
            Outlet7.backgroundColor = blue
            Outlet8.backgroundColor = blue
            Outlet9.backgroundColor = blue
        }
    }
    
    @IBAction func ChannelButton(_ sender: Any) {
        // change storyboard to channel page
    }
    
    @IBAction func Preset1(_ sender: Any) {
        NSLog("send preset1")
        if Outlet1.backgroundColor == red {
            ViewController.currentPreset = 1
        } else {
            // switch channel to preset
        }
    }
    
    @IBAction func Preset2(_ sender: Any) {
        NSLog("send preset2")
        if Outlet2.backgroundColor == red {
            ViewController.currentPreset = 2
        } else {
            
        }
    }
    
    @IBAction func Preset3(_ sender: Any) {
        NSLog("send preset3")
        if Outlet3.backgroundColor == red {
            ViewController.currentPreset = 3
        } else {
            
        }
    }
    
    @IBAction func Preset4(_ sender: Any) {
        NSLog("send preset4")
        if Outlet4.backgroundColor == red {
            ViewController.currentPreset = 4
        } else {
            
        }
    }
    
    @IBAction func Preset5(_ sender: Any) {
        NSLog("send preset5")
        if Outlet5.backgroundColor == red {
            ViewController.currentPreset = 5
        } else {
            
        }
    }
    
    @IBAction func Preset6(_ sender: Any) {
        NSLog("send preset6")
        if Outlet6.backgroundColor == red {
            ViewController.currentPreset = 6
        } else {
            
        }
    }
    
    @IBAction func Preset7(_ sender: Any) {
        NSLog("send preset7")
        if Outlet7.backgroundColor == red {
            ViewController.currentPreset = 7
        } else {
            
        }
    }
    
    @IBAction func Preset8(_ sender: Any) {
        NSLog("send preset8")
        if Outlet8.backgroundColor == red {
            ViewController.currentPreset = 8
        } else {
            
        }
    }
    
    @IBAction func Preset9(_ sender: Any) {
        NSLog("send preset9")
        if Outlet9.backgroundColor == red {
            ViewController.currentPreset = 9
        } else {
            
        }
    }
    
    @IBAction func back(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "activated" {
            let changePresetVC = segue.destination as! ChangePresetVCViewController
            changePresetVC.receivedPreset = String(ViewController.currentPreset)
        }
    }
    
    override func shouldPerformSegue(withIdentifier: String?, sender: Any?) -> Bool {
            if withIdentifier == "activated" {
                if Outlet1.backgroundColor == blue {
                    return false
                }
            }
        return true
    }
}

