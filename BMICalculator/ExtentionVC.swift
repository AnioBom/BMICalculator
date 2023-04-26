//
//  ExtentionVC.swift
//  BMICalculator
//
//  Created by mac on 4/26/23.
//

import UIKit
import SnapKit

// MARK: - ExtentionViewController

extension ViewController {
    
    func configure() {
        
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
        
        view.addSubview(wightTextField)
        wightTextField.snp.makeConstraints { make in
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
