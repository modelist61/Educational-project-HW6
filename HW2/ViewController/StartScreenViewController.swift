//
//  StartScreenViewController.swift
//  HW2
//
//  Created by Dmitry Tokarev on 29.10.2020.
//

import UIKit

protocol rgbFromColorMixerViewControllerDelegate {
    func rgbMix(red: Float, green: Float, blue: Float)
}

class StartScreenViewController: UIViewController {
    
    var redValue: Float = 0.0
    var greenValue: Float = 0.0
    var blueValue: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbMix(red: 1.0, green: 1.0, blue: 1.0)
    }

    @IBAction func editButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let startScreenVC = segue.destination as! ColorMixerViewController
        startScreenVC.delegate = self
        startScreenVC.redColor = redValue
        startScreenVC.greenColor = greenValue
        startScreenVC.blueColor = blueValue
    }
}

extension StartScreenViewController: rgbFromColorMixerViewControllerDelegate {
    func rgbMix(red: Float, green: Float, blue: Float) {
        self.view.backgroundColor = UIColor(red: CGFloat(red),
                                            green: CGFloat(green),
                                            blue: CGFloat(blue), alpha: 1)
        redValue = red
        greenValue = green
        blueValue = blue
    }
}


