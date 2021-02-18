//
//  ViewController.swift
//  HomeWork 2.2
//
//  Created by Светлана Романенко on 31.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!

    @IBOutlet var amountOfRed: UILabel!
    @IBOutlet var amountOfGreen: UILabel!
    @IBOutlet var amountOfBlue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    // MARK: - Public Properties
    var delegate: SetBackgroundColorDelegate!
    var mainViewColor: UIColor!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        colorView.backgroundColor = mainViewColor
        
        setSliders()
        setValue(for: amountOfRed, amountOfGreen, amountOfBlue)
        setValue(for: redTF, greenTF, blueTF)
        addDoneButton(to: redTF, greenTF, blueTF)
    }
    
    override func viewWillLayoutSubviews() {
        colorView.layer.cornerRadius = colorView.frame.height / 20
    }
    
    // MARK: - IB Actions
    @IBAction func rgbSlider(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            setValue(for: amountOfRed)
            setValue(for: redTF)
        case 1:
            setValue(for: amountOfGreen)
            setValue(for: greenTF)
        case 2:
            setValue(for: amountOfBlue)
            setValue(for: blueTF)
        default:
            break
        }
        setColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate?.setNewColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

    // MARK: - Private Methods
extension ViewController {
    
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
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField.tag {
            case 0: redTF.text = string(from: redSlider)
            case 1: greenTF.text = string(from: greenSlider)
            case 2: blueTF.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: mainViewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func addDoneButton(to textFields: UITextField...) {
        
        textFields.forEach { textField in
            textField.keyboardType = UIKeyboardType.decimalPad
            let keyBoardToolBar = UIToolbar()
            textField.inputAccessoryView = keyBoardToolBar
            keyBoardToolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(
                title: "Done",
                style: .done,
                target: self,
                action: #selector(didTapDone)
            )
            
            let flexBarButton = UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace,
                target: nil,
                action: nil
            )
            
            keyBoardToolBar.items = [flexBarButton, doneButton]
        }
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(tittle: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text?.replacingOccurrences(of: ",", with: ".") else { return }
        
        if let currentValue = Float(text), currentValue <= 1 {
            
            switch textField.tag {
            case 0:
                redSlider.setValue(currentValue, animated: true)
                setValue(for: amountOfRed)
            case 1:
                greenSlider.setValue(currentValue, animated: true)
                setValue(for: amountOfGreen)
            case 2:
                blueSlider.setValue(currentValue, animated: true)
                setValue(for: amountOfBlue)
            default:
                break
            }
            
            setColor()
            return
        }
        showAlert(tittle: "Wrong format!", message: "Please enter correct value")
        textField.text = ""
    }
}
