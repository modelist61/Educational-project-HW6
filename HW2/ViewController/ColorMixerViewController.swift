//
//  ViewController.swift
//  HW2
//
//  Created by Dmitry Tokarev on 16.10.2020.
//

import UIKit

class ColorMixerViewController: UIViewController {

    @IBOutlet var multiColorView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var delegate: rgbFromColorMixerViewControllerDelegate!
    
    var redColor: Float = 0.0
    var greenColor: Float = 0.0
    var blueColor: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        multiColorView.layer.cornerRadius = 15
        
        redSlider.value = redColor
        greenSlider.value = greenColor
        blueSlider.value = blueColor
        
        setValue(for: redValue, greenValue, blueValue)
        rgbLable()
    }
    
    @IBAction func doneButton() {
        delegate.rgbMix(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
        dismiss(animated: true)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        rgbLable()
        switch sender.tag {
        case 0: redValue.text = stringConvert(from: sender)
        case 1: greenValue.text = stringConvert(from: sender)
        case 2: blueValue.text = stringConvert(from: sender)
        default: break
        }
    }
    
//    @IBAction func textFieldEdit(_ sender: UITextField) {
//        rgbLable()
//        switch sender.tag {
//        case 0:
//        case 1:
//        case 2:
//        default: break
//        }
//
//    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redValue.text = stringConvert(from: redSlider)
            case 1: greenValue.text = stringConvert(from: greenSlider)
            case 2: blueValue.text = stringConvert(from: blueSlider)
            default: break
            }
        }
    }
    
    private func stringConvert(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func rgbLable() {
        multiColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0)
    }
    
}

// MARK: - RGB mixing
extension ColorMixerViewController {
    
    
    
}

// MARK: - Keyboard
extension ColorMixerViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == redTextField {
            doneButton()
        } else {
            doneButton()
        }
        
        return true
    }
}
