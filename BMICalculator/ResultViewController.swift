//
//  ResultViewController.swift
//  BMICalculator
//
//  Created by mac on 4/14/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmi: BMICategory?
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    private let titleLable: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    private let resultLable: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()
    
    lazy var backButton: UIButton = {
       let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1538562477, green: 0.5370084643, blue: 0.8060141206, alpha: 1)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configere()
        
    }
    
    @objc func backButtonPressed() {
        dismiss(animated: true, completion: nil)
        
    }

    private func setupUI() {
        if let bmi = bmi {
            
            resultLable.text = String(format: "%.1f", bmi.value)
            titleLable.text = bmi.advice
            view.backgroundColor = bmi.color
            
        }
    }

}

extension ResultViewController {
    private func configere() {
        view.addSubview(titleLable)
        titleLable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(resultLable.snp.top).offset(50)
        }
        
        view.addSubview(resultLable)
        resultLable.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
}
    
