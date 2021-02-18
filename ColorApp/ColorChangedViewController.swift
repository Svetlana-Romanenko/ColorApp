//
//  ColorChangedViewController.swift
//  HomeWork 2.2
//
//  Created by Светлана Романенко on 15.02.2021.
//

import UIKit

protocol SetBackgroundColorDelegate {
    func setNewColor(_ color: UIColor)
}

class ColorChangedViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! ViewController
        settingsVC.delegate = self
        settingsVC.mainViewColor = view.backgroundColor
    }
}

// MARK: - Color Delegate
extension ColorChangedViewController: SetBackgroundColorDelegate {
    func setNewColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
