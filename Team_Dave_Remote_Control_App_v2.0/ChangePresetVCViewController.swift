//
//  ChangePresetVCViewController.swift
//  Team_Dave_Remote_Control_App_v2.0
//
//  Created by Team Dave on 10/29/17.
//  Copyright © 2017 Shang-Yun Wu. All rights reserved.
//

import UIKit

class ChangePresetVCViewController: UIViewController {
    
    let apiManager = APIManager.shared;
    
    // color vars
    let blue = UIColor(red: 52/255, green: 77/255, blue: 144/255, alpha: 0.65);
    let green = UIColor(red: 95/255, green: 185/255, blue: 142/255, alpha: 1);
    let red = UIColor(red: 245/255, green: 84/255, blue: 73/255, alpha: 1);
    let left = UIColor(red: 191/255, green: 220/255, blue: 207/255, alpha: 1);
    let right = UIColor(red: 213/255, green: 201/255, blue: 177/255, alpha: 1);
    
    // UIImage for scrollbar
    let min_track = UIImage(named: "min_track.png");
    let max_track = UIImage(named: "max_track.png");
    
    // this comes from the preset page, tells us where to save in UserDefaults
    var receivedPreset = ""
    
    var inputVal = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presetInput.text = String(inputVal);
        
        // make buttons circular
        button0.layer.cornerRadius = 0.5 * button0.bounds.size.width;
        button1.layer.cornerRadius = 0.5 * button1.bounds.size.width;
        button2.layer.cornerRadius = 0.5 * button2.bounds.size.width;
        button3.layer.cornerRadius = 0.5 * button3.bounds.size.width;
        button4.layer.cornerRadius = 0.5 * button4.bounds.size.width;
        button5.layer.cornerRadius = 0.5 * button5.bounds.size.width;
        button6.layer.cornerRadius = 0.5 * button6.bounds.size.width;
        button7.layer.cornerRadius = 0.5 * button7.bounds.size.width;
        button8.layer.cornerRadius = 0.5 * button8.bounds.size.width;
        button9.layer.cornerRadius = 0.5 * button9.bounds.size.width;
        buttonEnt.layer.cornerRadius = 0.5 * buttonEnt.bounds.size.width;
        buttonDel.layer.cornerRadius = 0.5 * buttonDel.bounds.size.width;
        
        // set button colors
        button1.backgroundColor = blue;
        button2.backgroundColor = blue;
        button3.backgroundColor = blue;
        button4.backgroundColor = blue;
        button5.backgroundColor = blue;
        button6.backgroundColor = blue;
        button7.backgroundColor = blue;
        button8.backgroundColor = blue;
        button9.backgroundColor = blue;
        button0.backgroundColor = blue;
        buttonEnt.backgroundColor = green;
        buttonDel.backgroundColor = red;
        
        // set section colors
        sectionTop.backgroundColor = blue;
        sectionLeft.backgroundColor = left;
        sectionRight.backgroundColor = right;
        
        // Volume + slider
        var sliderVal = UserDefaults.standard.string(forKey: "volume");
        if (sliderVal == nil) {
            sliderVal = "10"
        }
        volume.text = sliderVal;
        slider.value = NumberFormatter().number(from: sliderVal!) as! Float
        // make slider vertical
        slider.transform = CGAffineTransform(rotationAngle: -(CGFloat(Double.pi/2)));
        
        // Slider Gesture Recognition
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sliderTapped(gestureRecognizer:)))
        self.slider.addGestureRecognizer(tapGestureRecognizer)
        
        // Image for slider width
        self.slider.setMaximumTrackImage(max_track, for: UIControlState.normal)
        self.slider.setMinimumTrackImage(min_track, for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // OUTLETS
    
    // number buttons
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonEnt: UIButton!
    @IBOutlet weak var buttonDel: UIButton!
    
    // volume
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var up_button: UIButton!
    @IBOutlet weak var down_button: UIButton!
    @IBOutlet weak var volume_max: UILabel!
    @IBOutlet weak var volume_min: UILabel!
    
    // sections
    @IBOutlet weak var sectionTop: UILabel!
    @IBOutlet weak var sectionLeft: UILabel!
    @IBOutlet weak var sectionRight: UILabel!
    
    // label for preset
    @IBOutlet weak var presetInput: UILabel!
    
    // HELPER FUNCTIONS
    
    // Slider Gesture Recognition
    @objc func sliderTapped(gestureRecognizer: UIGestureRecognizer) {
        
        let pointTapped: CGPoint = gestureRecognizer.location(in: self.view)
        
        let positionOfSlider: CGPoint = slider.frame.origin
        let heightOfSlider: CGFloat = slider.frame.size.height
        
        let newValue = ((pointTapped.y - positionOfSlider.y) * CGFloat(slider.maximumValue) / heightOfSlider)
        
        let volume_value = Float(slider.maximumValue) - Float(newValue);
        slider.setValue(volume_value, animated: true);
        let currentV = volume.text;
        volume.text = String(Int(volume_value));
        UserDefaults.standard.set(volume.text, forKey: "volume");
        apiManager.volume(currentVol: currentV!, newVol: volume.text!)
    }
    
    func preset_num(num: Int) -> Int {
        if (inputVal == 0) {
            inputVal = num;
        }
        else if (inputVal < 100) {
            inputVal = inputVal*10 + num;
        }
        return inputVal;
    }
    
    // ACTION FUNCTIONS
    
    @IBAction func power(_ sender: UIButton) {
        let prevVolume = UserDefaults.standard.string(forKey: "volume")
        apiManager.power(volume: prevVolume!);
    }
    
    @IBAction func sliderSlide(_ sender: UISlider) {
        volume.text = String(Int(slider.value));
        UserDefaults.standard.set(volume.text, forKey: "volume");
    }
    
    @IBAction func volumeUp(_ sender: UIButton) {
        slider.value = slider.value + 1;
        volume.text = String(Int(slider.value));
        UserDefaults.standard.set(volume.text, forKey: "volume");
        apiManager.volumeUp();
    }
    
    @IBAction func volumeDown(_ sender: UIButton) {
        slider.value = slider.value - 1;
        volume.text = String(Int(slider.value));
        UserDefaults.standard.set(volume.text, forKey: "volume");
        apiManager.volumeDown();
    }
    
    @IBAction func input_zero(_ sender: UIButton) {
        presetInput.text = String(preset_num(num: 0))
    }
    
    @IBAction func input_one(_ sender: UIButton) {
        presetInput.text = String(preset_num(num: 1))
    }
    
    @IBAction func input_two(_ sender: UIButton) {
        presetInput.text = String(preset_num(num: 2))
    }
    
    @IBAction func input_three(_ sender: UIButton) {
        presetInput.text = String(preset_num(num: 3))
    }
    
    @IBAction func input_four(_ sender: UIButton) {
        presetInput.text = String(preset_num(num: 4))
    }
    
    @IBAction func input_five(_ sender: UIButton) {
        presetInput.text = String(preset_num(num: 5))
    }
    
    @IBAction func input_six(_ sender: UIButton) {
        presetInput.text = String(preset_num(num: 6))
    }
    
    @IBAction func input_seven(_ sender: UIButton) {
        presetInput.text = String(preset_num(num: 7))
    }
    
    @IBAction func input_eight(_ sender: UIButton) {
        presetInput.text = String(preset_num(num: 8))
    }
    
    @IBAction func input_nine(_ sender: UIButton) {
        presetInput.text = String(preset_num(num: 9))
    }
    
    @IBAction func input_del(_ sender: UIButton) {
        inputVal = inputVal/10;
        presetInput.text = String(inputVal);
    }
    
    // when new preset is entered, stores preset into UserDefaults
    @IBAction func input_ent(_ sender: UIButton) {
        let newPreset = presetInput.text
        if (receivedPreset == "1") {
            UserDefaults.standard.set(newPreset, forKey: "Outlet1")
        } else if (receivedPreset == "2") {
            UserDefaults.standard.set(newPreset, forKey: "Outlet2")
        } else if (receivedPreset == "3") {
            UserDefaults.standard.set(newPreset, forKey: "Outlet3")
        } else if (receivedPreset == "4") {
            UserDefaults.standard.set(newPreset, forKey: "Outlet4")
        } else if (receivedPreset == "5") {
            UserDefaults.standard.set(newPreset, forKey: "Outlet5")
        } else if (receivedPreset == "6") {
            UserDefaults.standard.set(newPreset, forKey: "Outlet6")
        } else if (receivedPreset == "7") {
            UserDefaults.standard.set(newPreset, forKey: "Outlet7")
        } else if (receivedPreset == "8") {
            UserDefaults.standard.set(newPreset, forKey: "Outlet8")
        } else if (receivedPreset == "9") {
            UserDefaults.standard.set(newPreset, forKey: "Outlet9")
        }
        UserDefaults.standard.synchronize()
    }

}
