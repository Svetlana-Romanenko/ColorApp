//
//  ViewController.swift
//  HomeWork 2.2
//
//  Created by Светлана Романенко on 31.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!

    @IBOutlet var amountOfRed: UILabel!
    @IBOutlet var amountOfGreen: UILabel!
    @IBOutlet var amountOfBlue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setColor()
        setValue(for: amountOfRed, amountOfGreen, amountOfBlue)
    }
    
    override func viewWillLayoutSubviews() {
        colorView.layer.cornerRadius = colorView.frame.height / 20
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender.tag {
        case 0: amountOfRed.text = string(from: sender)
        case 1: amountOfGreen.text = string(from: sender)
        case 2: amountOfBlue.text = string(from: sender)
        default: break
        }
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: amountOfRed.text = string(from: redSlider)
            case 1: amountOfGreen.text = string(from: greenSlider)
            case 2: amountOfBlue.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
