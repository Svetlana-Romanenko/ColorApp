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
    
    private var red: CGFloat = 0.05
    private var green: CGFloat = 0.27
    private var blue: CGFloat = 0.49
    private var alpha: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        // Labels
        redSlider.value = 0.05
        greenSlider.value = 0.27
        blueSlider.value = 0.49
        
        //Sliders
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    override func viewWillLayoutSubviews() {
        colorView.layer.cornerRadius = colorView.frame.height / 20
    }

    @IBAction func redSliderChanged() {
        amountOfRed.text = String(NSString(format: "%.2f", redSlider.value))
        red = CGFloat(redSlider.value)
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    @IBAction func greenSliderChanged() {
        amountOfGreen.text = String(NSString(format: "%.2f", greenSlider.value))
        green = CGFloat(greenSlider.value)
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    @IBAction func blueSliderChanged() {
        amountOfBlue.text = String(NSString(format: "%.2f", blueSlider.value))
        blue = CGFloat(blueSlider.value)
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
