//
//  ViewController.swift
//  BMICalculator
//
//  Created by mac on 4/14/23.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let screenImage = UIImage(named: "y")
    var bmi: BMICategory?
    
    // MARK: - UI Properties
    
    lazy var mainImageView: UIImageView = {
        var imageView = UIImageView()
        imageView = UIImageView(frame: self.view.bounds)
        imageView.image = screenImage
        imageView.contentMode = .scaleAspectFill
        imageView.center = view.center
        return imageView
    }()
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.text = "Calculate your BMI"
        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        label.textAlignment = .right
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    let weightLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Weight"
        lable.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lable.textColor = .white
        return lable
    }()
    
    let heightLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Height"
        lable.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lable.textColor = .white
        return lable
    }()
    
    lazy var weightSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 200
        slider.minimumTrackTintColor = #colorLiteral(red: 0, green: 0.8375163674, blue: 1, alpha: 1)
        slider.maximumTrackTintColor = .systemGray3
        slider.addTarget(self, action: #selector(wigthSliderValue), for: .valueChanged)
        return slider
    }()
    
    lazy var heightSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 3
        slider.minimumTrackTintColor = #colorLiteral(red: 0, green: 0.8375163674, blue: 1, alpha: 1)
        slider.maximumTrackTintColor = .systemGray3
        slider.addTarget(self, action: #selector(heightSliderValue), for: .valueChanged)
        return slider
    }()
    
    lazy var wightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "kg"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.adjustsFontSizeToFitWidth = true
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .white
        textField.keyboardType = .decimalPad
        textField.addTarget(self, action: #selector(wightTextFieldChange), for: .editingChanged)
        return textField
    }()
    
    lazy var heightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "cm"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .white
        textField.adjustsFontSizeToFitWidth = true
        textField.keyboardType = .decimalPad
        textField.addTarget(self, action: #selector(heightTextFieldChange), for: .editingChanged)
        return textField
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1538562477, green: 0.5370084643, blue: 0.8060141206, alpha: 1)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainImageView)
        title = "Calculate"
        
        
        configure()
    }
    
    // MARK: - Methods
    
    
    
    @objc private func buttonPressed() {
        
        if let heightText = heightTextField.text, let weightText = wightTextField.text, let height = Float(heightText), let weight = Float(weightText) {
            let bmi = calculateBMI(height: height, weight: weight)
            
            let resultCV = ResultViewController()
            resultCV.bmi = bmi
        } else {
            let alert = UIAlertController(title: "Error", message: "Please enter vailed height and weight", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
        
        let resultVC = ResultViewController()
        self.present(resultVC, animated: true)
    }
    
    func calculateBMI(height: Float, weight: Float) -> Float {
        let heightMeters = height / 100
        let bmi = weight / (heightMeters * heightMeters)
        return bmi
    }
    
    @objc func wigthSliderValue() {
        wightTextField.text = String(format: "%.0f", weightSlider.value)
    }
    
    @objc func heightSliderValue() {
        heightTextField.text = String(format: "%.0f", heightSlider.value)
    }
    
    @objc func wightTextFieldChange() {
        if let text = wightTextField.text, let value = Float(text) {
            weightSlider.value = value
        }
    }
    
    @objc func heightTextFieldChange() {
        if let text = heightTextField.text, let value = Float(text) {
            heightSlider.value = value
        }
    }
}
        
       /*
        let weight = weightSlider.value
        let height = heightSlider.value
        
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMICategory(value: String(format: "%.1f", bmiValue), advice: "Eat more pies", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMICategory(value: String(format: "%.1f", bmiValue), advice: "Fit as a fiddle", color: .green)
        } else {
            bmi = BMICategory(value: String(format: "%.1f", bmiValue), advice: "Eat less pies", color: .red)
        }
        
        //performSegue(withIdentifier: "showResult", sender: self)
    
    }
    
    private func calculateBMI() {
        guard let height = Float(heightTextField.text ?? ""), let weight = Float(wightTextField.text ?? "") else { return }
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMICategory(value: bmiValue, advice: "Eat more pies", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMICategory(value: bmiValue, advice: "Fit as a fiddle", color: .green)
        } else {
            bmi = BMICategory(value: bmiValue, advice: "Eat less pies", color: .red)
        }
    }
    
    private func setString(from slider: UISlider) -> String {
        String(format: "%.1f", slider.value)
    }
    
}
*/
