//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Sergei Volotka on 25.06.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor(color: UIColor)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet var colorizedView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
  
    var delegate: SettingsViewControllerDelegate!
    var mainVC: UIColor!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    colorizedView.layer.cornerRadius = 20
    setColor()
    setValue(for: redSliderValue, greenSliderValue, blueSliderValue)

        colorizedView.backgroundColor = mainVC
    }

  
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
@IBAction func sliderAction(_ sender: UISlider) {
    setColor()
    switch sender {
    case redSlider:
        redSliderValue.text = string(from: redSlider)
        redTextField.text = string(from: redSlider)
    case greenSlider:
        greenSliderValue.text = string(from: greenSlider)
        greenTextField.text = string(from: greenSlider)
    default:
        blueSliderValue.text = string(from: blueSlider)
        blueTextField.text = string(from: blueSlider)
    }
}

    
    @IBAction func doneButtonPressed() {
        delegate?.setColor(color: colorizedView.backgroundColor ?? .red)
        dismiss(animated: true)
    }
    
    
    private func setColor() {
    colorizedView.backgroundColor = UIColor(
        red:
            CGFloat(redSlider.value),
        green:
            CGFloat(greenSlider.value),
        blue:
            CGFloat(blueSlider.value),
        alpha: 1
    )
}

private func setValue(for labels: UILabel...) {
    labels.forEach { label in
        switch label {
        case redSliderValue:
            redSliderValue.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSliderValue:
            greenSliderValue.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueSliderValue.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }
    }
}

private func string(from slider: UISlider) -> String {
    String(format: "%.2f", slider.value)
}
}

