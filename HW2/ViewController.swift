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
        multiColorView.backgroundColor = UIColor(displayP3Red: CGFloat(sliderRed.value),
                                                 green: CGFloat(sliderGreen.value),
                                                 blue: CGFloat(sliderBlue.value), alpha: 1.0)
    }

    @IBAction func redSliderAction() {
        redValue.text = String(format: "%.2f", sliderRed.value)
        rgbLable()
    }
    @IBAction func greenSliderAction() {
        greenValue.text = String(format: "%.2f", sliderGreen.value)
        rgbLable()
    }
    @IBAction func blueSliderAction() {
        blueValue.text = String(format: "%.2f", sliderBlue.value)
        rgbLable()
    }
}

// MARK: - RGB mixing
extension ViewController {
    private func rgbLable() {
        multiColorView.backgroundColor = UIColor(displayP3Red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1.0)
    }
}



