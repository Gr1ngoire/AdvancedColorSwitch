//
//  SwitchColorController.swift
//  HW7_Course2
//
//  Created by admin on 25.04.2021.
//

import UIKit

protocol PassingTheColor {
    func execution(redPar: CGFloat, greenPar: CGFloat, bluePar: CGFloat, alphaPar: CGFloat)
}

class SwitchColorController: UIViewController, UITextFieldDelegate {
    
    // PassingTheColor delegate
    var delegate: PassingTheColor?
    
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
        
        
        // tap recognizer
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        // editing the view
        colorOutput.layer.cornerRadius = colorOutput.frame.width / 40
        colorOutput.backgroundColor = viewColor
        
        // adding done button for text fields
        redTextField.addDoneButtonOnKeyboard()
        greenTextField.addDoneButtonOnKeyboard()
        blueTextField.addDoneButtonOnKeyboard()
        
        // delegetion for Done button on keyboard
        self.redTextField.delegate = self
        self.greenTextField.delegate = self
        self.blueTextField.delegate = self
    }
    
    
    // done button sending color to the first screen
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        if  colorOutput.backgroundColor != nil {
            
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
                        
            colorOutput.backgroundColor?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            delegate?.execution(redPar: red, greenPar: green, bluePar: blue, alphaPar: alpha)
            dismiss(animated: true)
        }
        
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
    
    
    // done button action
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let value = textField.text else { return }
        
        if let convertedValue = Float(value) {
            
            switch textField.tag {
            case 0:
                redSlider.value = convertedValue
            case 1:
                greenSlider.value = convertedValue
            case 2:
                blueSlider.value = convertedValue
            default:
                break
            }
            
        } else {
            let alert = UIAlertController(title: "Ooops!", message: "Please, enter the value properly", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}

// switch value and color extension
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

// Done button on keyboard pressed => keyboard hides
extension SwitchColorController {
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

// add Done buton function extension
extension UITextField {
    func addDoneButtonOnKeyboard() {
        let doneToolBar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width,  height: 50))
        doneToolBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action:
                                                        #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolBar.items = items
        doneToolBar.sizeToFit()
        
        self.inputAccessoryView = doneToolBar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
    
}
