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
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.text = "Calculate your BMI"
        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        label.textAlignment = .right
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    private let weightLabel: UILabel = {
       let lable = UILabel()
        lable.text = "Weight"
        lable.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lable.textColor = .white
        return lable
    }()
    
    private let heightLabel: UILabel = {
       let lable = UILabel()
        lable.text = "Height"
        lable.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lable.textColor = .white
        return lable
    }()
    
    private let weightSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 200
        slider.minimumTrackTintColor = #colorLiteral(red: 0, green: 0.8375163674, blue: 1, alpha: 1)
        slider.maximumTrackTintColor = .systemGray3
        return slider
    }()
    
    private let heightSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 3
        slider.minimumTrackTintColor = #colorLiteral(red: 0, green: 0.8375163674, blue: 1, alpha: 1)
        slider.maximumTrackTintColor = .systemGray3
        return slider
    }()
    
    private let weightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "kg"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.adjustsFontSizeToFitWidth = true
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .white
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let heightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "cm"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .white
        textField.adjustsFontSizeToFitWidth = true
        textField.keyboardType = .decimalPad
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
        
        //calculateButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        configure()
        setValue(for: weightTextField, heightTextField)
        
    }
    
    // MARK: - Methods
    
    

    @objc private func buttonPressed() {
        
        calculateBMI()
        
        performSegue(withIdentifier: "showResult", sender: self)
        
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
       */
    }
    
    private func calculateBMI() {
        guard let height = Float(heightTextField.text ?? ""), let weight = Float(weightTextField.text ?? "") else { return }
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMICategory(value: bmiValue, advice: "Eat more pies", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMICategory(value: bmiValue, advice: "Fit as a fiddle", color: .green)
        } else {
            bmi = BMICategory(value: bmiValue, advice: "Eat less pies", color: .red)
        }
    }
    private func setValue(for sender: UITextField...) {
        sender.forEach { sender in
            switch sender {
            case weightTextField: sender.text = setString(from: weightSlider)
            default: sender.text = setString(from: heightSlider)
            }
        }
    }
    
    private func setString(from slider: UISlider) -> String {
        String(format: "%.1f", slider.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult"{
            guard let resultVC = segue.destination as? ResultViewController else { return }
            
            resultVC.bmi = bmi
            
            /* resultVC.bmiValue = bmi?.value
             resultVC.advice = bmi?.advice
             resultVC.color = bmi?.color
             */
        }
    }
}

// MARK: - ExtentionViewController

extension ViewController {
    func configure() {
       // view.backgroundColor = .white
        
        view.addSubview(titleLable)
        titleLable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(160)
            make.leading.equalToSuperview().offset(160)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        view.addSubview(calculateButton)
        calculateButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        view.addSubview(weightSlider)
        weightSlider.snp.makeConstraints { make in
            make.bottom.equalTo(calculateButton.snp.top).offset(-60)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        view.addSubview(weightLabel)
        weightLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.bottom.equalTo(weightSlider.snp.top).offset(-15)
        }
        
        view.addSubview(weightTextField)
        weightTextField.snp.makeConstraints { make in
            make.bottom.equalTo(weightSlider.snp.top).offset(-10)
            make.trailing.equalToSuperview().offset(-25)
        }
        
        view.addSubview(heightSlider)
        heightSlider.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(weightSlider.snp.top).offset(-60)
            make.leading.trailing.equalToSuperview().inset(20)
        }
       
        view.addSubview(heightLabel)
        heightLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.bottom.equalTo(heightSlider.snp.top).offset(-15)
        }
        
        view.addSubview(heightTextField)
        heightTextField.snp.makeConstraints { make in
            make.bottom.equalTo(heightSlider.snp.top).offset(-10)
            make.trailing.equalToSuperview().offset(-25)
        }
        
    }
}
