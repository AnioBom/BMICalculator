//
//  ViewController.swift
//  BMICalculator
//
//  Created by mac on 4/14/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let screenImage = UIImage(named: "y")
    
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
        lable.text = "Weight (kg)"
        lable.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lable.textColor = .white
        return lable
    }()
    
    private let heightLabel: UILabel = {
       let lable = UILabel()
        lable.text = "Height (cm)"
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
    
    private let calculateButton: UIButton = {
       let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1538562477, green: 0.5370084643, blue: 0.8060141206, alpha: 1)
        button.layer.cornerRadius = 15
        
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainImageView)
        
        calculateButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        configure()
        
    }

    @objc private func buttonPressed() {
        let weight = weightSlider.value
        let height = heightSlider.value
        
        let bmi = weight / pow(height, 2)//(height * height)
        
        let resultVC = ResultViewController(bmi: bmi)
        navigationController?.pushViewController(resultVC, animated: true)
    }

}

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
        
    }
}
