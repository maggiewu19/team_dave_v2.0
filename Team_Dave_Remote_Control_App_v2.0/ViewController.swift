//
//  ViewController.swift
//  Team_Dave_Remote_Control_App_v2.0
//
//  Created by Shang-Yun Wu on 10/25/17.
//  Copyright © 2017 Shang-Yun Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let blue = UIColor(red: 52/255, green: 77/255, blue: 144/255, alpha: 0.65);
    let green = UIColor(red: 95/255, green: 185/255, blue: 142/255, alpha: 1);
    let red = UIColor(red: 245/255, green: 84/255, blue: 73/255, alpha: 1);
    let test = UIColor(red: 231/255, green: 201/255, blue: 177/255, alpha: 1);
    let left = UIColor(red: 191/255, green: 220/255, blue: 207/255, alpha: 1);
    let right = UIColor(red: 213/255, green: 201/255, blue: 177/255, alpha: 1);
    
    let apiManager = APIManager();
    
    static var currentPreset = Int()
    
    override func viewWillAppear(_ animated: Bool) {
        var sliderVal = UserDefaults.standard.string(forKey: "volume");
        if (sliderVal == nil) {
            sliderVal = "10"
        }
        volume.text = sliderVal;
        slider.value = NumberFormatter().number(from: sliderVal!) as! Float
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // current channel
        updateCurrentChannel();
        
        // set title for all presets by retrieving from UserDefaults
        Outlet1.setTitle(UserDefaults.standard.string(forKey: "Outlet1"), for: .normal)
        Outlet2.setTitle(UserDefaults.standard.string(forKey: "Outlet2"), for: .normal)
        Outlet3.setTitle(UserDefaults.standard.string(forKey: "Outlet3"), for: .normal)
        Outlet4.setTitle(UserDefaults.standard.string(forKey: "Outlet4"), for: .normal)
        Outlet5.setTitle(UserDefaults.standard.string(forKey: "Outlet5"), for: .normal)
        Outlet6.setTitle(UserDefaults.standard.string(forKey: "Outlet6"), for: .normal)
        Outlet7.setTitle(UserDefaults.standard.string(forKey: "Outlet7"), for: .normal)
        Outlet8.setTitle(UserDefaults.standard.string(forKey: "Outlet8"), for: .normal)
        Outlet9.setTitle(UserDefaults.standard.string(forKey: "Outlet9"), for: .normal)

        // make buttons with rounded corners
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
        
        sectionTop.backgroundColor = blue;
        sectionLeft.backgroundColor = left;
        sectionRight.backgroundColor = right;
        
        // volume
//        volume.text = String (Int(slider.value));
        var sliderVal = UserDefaults.standard.string(forKey: "volume");
        if (sliderVal == nil) {
            sliderVal = "10"
        }
        volume.text = sliderVal;
        slider.value = NumberFormatter().number(from: sliderVal!) as! Float
        
        slider.transform = CGAffineTransform(rotationAngle: -(CGFloat(Double.pi/2)));
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sliderTapped(gestureRecognizer:)))
        self.slider.addGestureRecognizer(tapGestureRecognizer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCurrentChannel() {
        currentChannel.text = UserDefaults.standard.string(forKey: "CurrentChannel")
    }
    
    // volume
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var up_button: UIButton!
    @IBOutlet weak var down_button: UIButton!
    
    // other buttons
    @IBOutlet weak var currentChannel: UILabel!
    @IBOutlet weak var channelOutlet: UIButton!
    @IBOutlet weak var changeOutlet: UIButton!
    
    // sections
    @IBOutlet weak var sectionTop: UILabel!
    @IBOutlet weak var sectionLeft: UILabel!
    @IBOutlet weak var sectionRight: UILabel!
    
    // presets
    @IBOutlet weak var Outlet1: UIButton!
    @IBOutlet weak var Outlet2: UIButton!
    @IBOutlet weak var Outlet3: UIButton!
    @IBOutlet weak var Outlet4: UIButton!
    @IBOutlet weak var Outlet5: UIButton!
    @IBOutlet weak var Outlet6: UIButton!
    @IBOutlet weak var Outlet7: UIButton!
    @IBOutlet weak var Outlet8: UIButton!
    @IBOutlet weak var Outlet9: UIButton!
    
    // toggles preset buttons between red and blue
    // red = activated, ready to be changed
    // blue = not activated, normal preset button
    @IBAction func changePreset(_ sender: Any) {
        if Outlet1.backgroundColor == blue {
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
    
    // Slider Gesture Recognition
    @objc func sliderTapped(gestureRecognizer: UIGestureRecognizer) {
        
        let pointTapped: CGPoint = gestureRecognizer.location(in: self.view)
        
        let positionOfSlider: CGPoint = slider.frame.origin
        let heightOfSlider: CGFloat = slider.frame.size.height
        
        let newValue = ((pointTapped.y - positionOfSlider.y) * CGFloat(slider.maximumValue) / heightOfSlider)
        
        let volume_value = Float(slider.maximumValue) - Float(newValue);
        slider.setValue(volume_value, animated: true);
        volume.text = String(Int(volume_value));
        UserDefaults.standard.set(volume.text, forKey: "volume");
    }
    
    @IBAction func power(_ sender: UIButton) {
        let prevVolume = UserDefaults.standard.string(forKey: "volume")
        apiManager.power(volume: prevVolume!);
    }
    @IBAction func sliderSlid(_ sender: UISlider) {
        volume.text = String (Int(slider.value));
        UserDefaults.standard.set(volume.text, forKey: "volume")
    }
    
    @IBAction func upAdjust(_ sender: UIButton) {
        slider.value = slider.value + 1;
        volume.text = String(Int(slider.value));
        UserDefaults.standard.set(volume.text, forKey: "volume")
        apiManager.volumeUp();
    }
    
    @IBAction func downAdjust(_ sender: UIButton) {
        slider.value = slider.value - 1;
        volume.text = String(Int(slider.value));
        UserDefaults.standard.set(volume.text, forKey: "volume")
        apiManager.volumeDown();
    }
    
    @IBAction func Preset1(_ sender: Any) {
        if Outlet1.backgroundColor == red {
            ViewController.currentPreset = 1
        } else {
            UserDefaults.standard.set(Outlet1.titleLabel?.text, forKey: "CurrentChannel")
            UserDefaults.standard.synchronize()
            updateCurrentChannel()
            // switch channel to preset
        }
    }
    
    @IBAction func Preset2(_ sender: Any) {
        if Outlet2.backgroundColor == red {
            ViewController.currentPreset = 2
        } else {
            UserDefaults.standard.set(Outlet2.titleLabel?.text, forKey: "CurrentChannel")
            UserDefaults.standard.synchronize()
            updateCurrentChannel()
        }
    }
    
    @IBAction func Preset3(_ sender: Any) {
        if Outlet3.backgroundColor == red {
            ViewController.currentPreset = 3
        } else {
            UserDefaults.standard.set(Outlet3.titleLabel?.text, forKey: "CurrentChannel")
            UserDefaults.standard.synchronize()
            updateCurrentChannel()
        }
    }
    
    @IBAction func Preset4(_ sender: Any) {
        if Outlet4.backgroundColor == red {
            ViewController.currentPreset = 4
        } else {
            UserDefaults.standard.set(Outlet4.titleLabel?.text, forKey: "CurrentChannel")
            UserDefaults.standard.synchronize()
            updateCurrentChannel()
        }
    }
    
    @IBAction func Preset5(_ sender: Any) {
        if Outlet5.backgroundColor == red {
            ViewController.currentPreset = 5
        } else {
            UserDefaults.standard.set(Outlet5.titleLabel?.text, forKey: "CurrentChannel")
            UserDefaults.standard.synchronize()
            updateCurrentChannel()
        }
    }
    
    @IBAction func Preset6(_ sender: Any) {
        if Outlet6.backgroundColor == red {
            ViewController.currentPreset = 6
        } else {
            UserDefaults.standard.set(Outlet6.titleLabel?.text, forKey: "CurrentChannel")
            UserDefaults.standard.synchronize()
            updateCurrentChannel()
        }
    }
    
    @IBAction func Preset7(_ sender: Any) {
        if Outlet7.backgroundColor == red {
            ViewController.currentPreset = 7
        } else {
            UserDefaults.standard.set(Outlet7.titleLabel?.text, forKey: "CurrentChannel")
            UserDefaults.standard.synchronize()
            updateCurrentChannel()
        }
    }
    
    @IBAction func Preset8(_ sender: Any) {
        if Outlet8.backgroundColor == red {
            ViewController.currentPreset = 8
        } else {
            UserDefaults.standard.set(Outlet8.titleLabel?.text, forKey: "CurrentChannel")
            UserDefaults.standard.synchronize()
            updateCurrentChannel()
        }
    }
    
    @IBAction func Preset9(_ sender: Any) {
        if Outlet9.backgroundColor == red {
            ViewController.currentPreset = 9
        } else {
            UserDefaults.standard.set(Outlet9.titleLabel?.text, forKey: "CurrentChannel")
            UserDefaults.standard.synchronize()
            updateCurrentChannel()
        }
    }
    
    // unwind segue if don't want to change preset anymore
    @IBAction func back(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "activated" {
            let changePresetVC = segue.destination as! ChangePresetVCViewController
            changePresetVC.receivedPreset = String(ViewController.currentPreset)
        }
    }
    
    // only segue to change preset if click on activated button
    override func shouldPerformSegue(withIdentifier: String?, sender: Any?) -> Bool {
            if withIdentifier == "activated" {
                if Outlet1.backgroundColor == blue {
                    return false
                }
            }
        return true
    }
}

