//
//  ViewController.swift
//  HW2
//
//  Created by Dmitry Tokarev on 16.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var multiColorView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        multiColorView.layer.cornerRadius = 15
        
        sliderRed.minimumValue = 0.00
        sliderRed.maximumValue = 1.00
        sliderRed.minimumTrackTintColor = .red
        
        sliderGreen.minimumValue = 0.00
        sliderGreen.maximumValue = 1.00
        sliderGreen.minimumTrackTintColor = .green

        sliderBlue.minimumValue = 0.00
        sliderBlue.maximumValue = 1.00
        sliderBlue.minimumTrackTintColor = .blue
    }

    @IBAction func redSliderAction() {
        redValue.text = String(format: "%.2f", sliderRed.value)
        rgbLable(red: sliderRed.value, green: sliderGreen.value, blue: sliderBlue.value)
    }
    @IBAction func greenSliderAction() {
        greenValue.text = String(format: "%.2f", sliderGreen.value)
        rgbLable(red: sliderRed.value, green: sliderGreen.value, blue: sliderBlue.value)
    }
    @IBAction func blueSliderAction() {
        blueValue.text = String(format: "%.2f", sliderBlue.value)
        rgbLable(red: sliderRed.value, green: sliderGreen.value, blue: sliderBlue.value)
    }
}

// MARK: - RGB mixing
extension ViewController {
    private func rgbLable(red: Float, green: Float, blue: Float) {
        multiColorView.backgroundColor = UIColor(displayP3Red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
}

