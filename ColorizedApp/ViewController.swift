//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Sergei Volotka on 25.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorizedView: UIView!
   
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorizedView.layer.cornerRadius = 20
    
        redSlider.minimumTrackTintColor = .red
       greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
       
        redSliderAction()
        greenSliderAction()
        blueSliderAction()
    }

    @IBAction func redSliderAction() {
        redSliderValue.text = String(format: "%.2f", redSlider.value)
        changeColor()
    }
    
    @IBAction func greenSliderAction() {
        greenSliderValue.text = String(format: "%.2f", greenSlider.value)
        changeColor()
    }
    
    @IBAction func blueSliderAction() {
        blueSliderValue.text = String(format: "%.2f", blueSlider.value)
        changeColor()
    }
     func changeColor() {
        colorizedView.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
}

