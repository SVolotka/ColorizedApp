//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Sergei Volotka on 14.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.delegate = self
        settingsVC.mainVC = view.backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setColor(color: UIColor) {
        view.backgroundColor = color
    }
    
}


