//
//  ChannelViewController.swift
//  Team_Dave_Remote_Control_App_v2.0
//
//  Created by Shang-Yun Wu on 10/30/17.
//  Copyright © 2017 Shang-Yun Wu. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {
    
    let apiManager = APIManager.shared;

    // color vars
    let blue = UIColor(red: 52/255, green: 77/255, blue: 144/255, alpha: 0.65);
    let green = UIColor(red: 95/255, green: 185/255, blue: 142/255, alpha: 1);
    let red = UIColor(red: 245/255, green: 84/255, blue: 73/255, alpha: 1);
    let left = UIColor(red: 191/255, green: 220/255, blue: 207/255, alpha: 1);
    let right = UIColor(red: 213/255, green: 201/255, blue: 177/255, alpha: 1);
    
    var channel_val = Int();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCurrentChannel()
        
        // set button colors
        button_one.backgroundColor = blue;
        button_two.backgroundColor = blue;
        button_three.backgroundColor = blue;
        button_four.backgroundColor = blue;
        button_five.backgroundColor = blue;
        button_six.backgroundColor = blue;
        button_seven.backgroundColor = blue;
        button_eight.backgroundColor = blue;
        button_nine.backgroundColor = blue;
        button_zero.backgroundColor = blue;
        button_enter.backgroundColor = green;
        button_delete.backgroundColor = red;
        preset.backgroundColor = right;
        
        // set section colors
        sectionTop.backgroundColor = blue;
        sectionLeft.backgroundColor = left;
        sectionRight.backgroundColor = right;
        
        // make buttons circular
        button_one.layer.cornerRadius = 0.5 * button_one.bounds.size.width;
        button_two.layer.cornerRadius = 0.5 * button_two.bounds.size.width;
        button_three.layer.cornerRadius = 0.5 * button_three.bounds.size.width;
        button_four.layer.cornerRadius = 0.5 * button_four.bounds.size.width;
        button_five.layer.cornerRadius = 0.5 * button_five.bounds.size.width;
        button_six.layer.cornerRadius = 0.5 * button_six.bounds.size.width;
        button_seven.layer.cornerRadius = 0.5 * button_seven.bounds.size.width;
        button_eight.layer.cornerRadius = 0.5 * button_eight.bounds.size.width;
        button_nine.layer.cornerRadius = 0.5 * button_nine.bounds.size.width;
        button_zero.layer.cornerRadius = 0.5 * button_zero.bounds.size.width;
        button_enter.layer.cornerRadius = 0.5 * button_enter.bounds.size.width;
        button_delete.layer.cornerRadius = 0.5 * button_delete.bounds.size.width;
        
        // rounded corners
        preset.layer.cornerRadius = 0.1 * preset.bounds.size.width;
        
        // Volume + slider
        var sliderVal = UserDefaults.standard.string(forKey: "volume");
        if (sliderVal == nil) {
            sliderVal = "10"
        }
        volume.text = sliderVal;
        customSlider.value = NumberFormatter().number(from: sliderVal!) as! Float
        
        // Slider Gesture Recognition
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sliderTapped(gestureRecognizer:)))
        self.customSlider.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // OUTLETS
    
    // top section buttons
    @IBOutlet weak var preset: UIButton!
    @IBOutlet weak var on_off: UIButton!
    
    // Number Buttons
    @IBOutlet weak var button_one: UIButton!
    @IBOutlet weak var button_two: UIButton!
    @IBOutlet weak var button_three: UIButton!
    @IBOutlet weak var button_four: UIButton!
    @IBOutlet weak var button_five: UIButton!
    @IBOutlet weak var button_six: UIButton!
    @IBOutlet weak var button_seven: UIButton!
    @IBOutlet weak var button_eight: UIButton!
    @IBOutlet weak var button_nine: UIButton!
    @IBOutlet weak var button_enter: UIButton!
    @IBOutlet weak var button_zero: UIButton!
    @IBOutlet weak var button_delete: UIButton!
    
    // Volume
    @IBOutlet weak var customSlider: CustomSlider!
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var up_button: UIButton!
    @IBOutlet weak var down_button: UIButton!
    @IBOutlet weak var volume_max: UILabel!
    @IBOutlet weak var volume_min: UILabel!
    
    // sections
    @IBOutlet weak var sectionTop: UILabel!
    @IBOutlet weak var sectionLeft: UILabel!
    @IBOutlet weak var sectionRight: UILabel!
    
    // Channel Input
    @IBOutlet weak var channel_input: UILabel!
    @IBOutlet weak var currentChannel: UILabel!
    
    // HELPER FUNCTIONS
    
    func updateCurrentChannel() {
        currentChannel.text = UserDefaults.standard.string(forKey: "CurrentChannel")
    }
    
    // Slider Gesture Recognition
    @objc func sliderTapped(gestureRecognizer: UIGestureRecognizer) {
        
        let pointTapped: CGPoint = gestureRecognizer.location(in: self.view)
        
        let positionOfSlider: CGPoint = customSlider.frame.origin
        let heightOfSlider: CGFloat = customSlider.frame.size.height
        
        let newValue = ((pointTapped.y - positionOfSlider.y) * CGFloat(customSlider.maximumValue) / heightOfSlider)
        
        let volume_value = Float(customSlider.maximumValue) - Float(newValue);
        customSlider.setValue(volume_value, animated: true);
        let currentV = volume.text;
        volume.text = String(Int(volume_value));
        UserDefaults.standard.set(volume.text, forKey: "volume");
        apiManager.volume(currentVol: currentV!, newVol: volume.text!)
    }
    
    // Channel
    func channel_num(num: Int) -> Int {
        if (channel_val == 0) {
            channel_val = num;
        }
        else if (channel_val < 100) {
            channel_val = channel_val*10 + num;
        }
        return channel_val;
    }
    
    // ACTION FUNCTIONS
    
    @IBAction func sliderSlide(_ sender: Any) {
        let currentVol = UserDefaults.standard.string(forKey: "volume")
        volume.text = String(Int(customSlider.value));
        UserDefaults.standard.set(volume.text, forKey: "volume")
        apiManager.volume(currentVol: currentVol!, newVol: UserDefaults.standard.string(forKey: "volume")!);
    }
    
    @IBAction func volumeUp(_ sender: UIButton) {
        customSlider.value = customSlider.value + 1;
        volume.text = String(Int(customSlider.value));
        UserDefaults.standard.set(volume.text, forKey: "volume")
        apiManager.volumeUp();
    }
    
    @IBAction func volumeDown(_ sender: UIButton) {
        customSlider.value = customSlider.value - 1;
        volume.text = String(Int(customSlider.value));
        UserDefaults.standard.set(volume.text, forKey: "volume")
        apiManager.volumeDown();
    }
    
    @IBAction func power(_ sender: UIButton) {
        let prevVolume = UserDefaults.standard.string(forKey: "volume")
        apiManager.power(volume: prevVolume!);
    }
    
    @IBAction func input_one(_ sender: UIButton) {
        channel_input.text = String(channel_num(num: 1));
    }
    
    @IBAction func input_two(_ sender: UIButton) {
        channel_input.text = String(channel_num(num: 2));
    }
    
    @IBAction func input_three(_ sender: UIButton) {
        channel_input.text = String(channel_num(num: 3));
    }
    
    @IBAction func input_four(_ sender: UIButton) {
        channel_input.text = String(channel_num(num: 4));
    }
    
    @IBAction func input_five(_ sender: UIButton) {
        channel_input.text = String(channel_num(num: 5));
    }
    
    @IBAction func input_six(_ sender: UIButton) {
        channel_input.text = String(channel_num(num: 6));
    }
    
    @IBAction func input_seven(_ sender: UIButton) {
        channel_input.text = String(channel_num(num: 7));
    }
    
    @IBAction func input_eight(_ sender: UIButton) {
        channel_input.text = String(channel_num(num: 8));
    }
    
    @IBAction func input_nine(_ sender: UIButton) {
        channel_input.text = String(channel_num(num: 9));
    }
    
    @IBAction func input_zero(_ sender: UIButton) {
        channel_input.text = String(channel_num(num: 0));
    }
    
    @IBAction func input_delete(_ sender: UIButton) {
        channel_val = channel_val/10;
        channel_input.text = String(channel_val);
    }
    
    @IBAction func input_enter(_ sender: UIButton) {
        UserDefaults.standard.set(channel_input.text, forKey: "CurrentChannel")
        UserDefaults.standard.synchronize()
        apiManager.channel(channel: channel_input.text!);
        updateCurrentChannel()
        channel_val = 0;
        channel_input.text = String(channel_val);
    }
    
    @IBAction func showPopUp(_ sender: UIButton) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }

}
