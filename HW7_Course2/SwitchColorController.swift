//
//  SwitchColorController.swift
//  HW7_Course2
//
//  Created by admin on 25.04.2021.
//

import UIKit

class SwitchColorController: UIViewController {

    // color View
    @IBOutlet weak var colorOutput: UIView!
    
    // color labels
    @IBOutlet weak var redColorValue: UILabel!
    @IBOutlet weak var greenColorValue: UILabel!
    @IBOutlet weak var blueColorValue: UILabel!
    
    
    // color sliders
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    // text fields
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
    // segue color from previous screen
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorOutput.layer.cornerRadius = colorOutput.frame.width / 40
        colorOutput.backgroundColor = viewColor
    }
    

    @IBAction func doneButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    // Sliders' actions
    @IBAction func redSliderChange(_ sender: UISlider) {
        changeTextFieldsAndLabelValue(slider: redSlider, label: redColorValue, textField: redTextField)
        changeViewColor(view: colorOutput, sliderOne: redSlider, sliderTwo: greenSlider, sliderThree: blueSlider)
    }
    
    
    @IBAction func greenSliderChange(_ sender: UISlider) {
        changeTextFieldsAndLabelValue(slider: greenSlider, label: greenColorValue, textField: greenTextField)
        changeViewColor(view: colorOutput, sliderOne: redSlider, sliderTwo: greenSlider, sliderThree: blueSlider)
    }
    
    @IBAction func blueSliderChange(_ sender: UISlider) {
        changeTextFieldsAndLabelValue(slider: blueSlider, label: blueColorValue, textField: blueTextField)
        changeViewColor(view: colorOutput, sliderOne: redSlider, sliderTwo: greenSlider, sliderThree: blueSlider)
    }
    
    
    
}
extension SwitchColorController {
    func changeTextFieldsAndLabelValue(slider: UISlider, label: UILabel, textField: UITextField) {
        let sliderValue = String(round(slider.value * 100) / 100)
        label.text = sliderValue
        textField.text = sliderValue
    }
    
    func changeViewColor(view: UIView, sliderOne: UISlider, sliderTwo: UISlider, sliderThree: UISlider) {
        view.backgroundColor = UIColor(red: CGFloat(sliderOne.value),
                                       green: CGFloat(sliderTwo.value),
                                       blue: CGFloat(sliderThree.value),
                                       alpha: 1.0)
    }
}
