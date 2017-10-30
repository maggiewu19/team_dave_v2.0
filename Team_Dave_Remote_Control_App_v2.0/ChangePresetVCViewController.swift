//
//  ChangePresetVCViewController.swift
//  Team_Dave_Remote_Control_App_v2.0
//
//  Created by Team Dave on 10/29/17.
//  Copyright © 2017 Shang-Yun Wu. All rights reserved.
//

import UIKit

class ChangePresetVCViewController: UIViewController {

    var receivedPreset = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("receivedPreset " + String(receivedPreset))
        presetInput.text = String(inputVal);
        // Do any additional setup after loading the view.
        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBOutlet weak var presetInput: UILabel!
    var inputVal = 0;
    
    
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        let presetVC = segue.destination as! ViewController
        presetVC.receivedString = presetInput.text!
//        presetVC.presetToChange = receivedPreset
        // Pass the selected object to the new view controller.
    }
    

}
