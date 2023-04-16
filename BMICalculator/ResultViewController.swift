//
//  ResultViewController.swift
//  BMICalculator
//
//  Created by mac on 4/14/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let titleLable: UILabel = {
       let label = UILabel()
        label.text = "YOUR RESULT"
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
    
    private let backButton: UIButton = {
       let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1538562477, green: 0.5370084643, blue: 0.8060141206, alpha: 1)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private var bmi: Float
    
    init(bmi: Float) {
        self.bmi = bmi
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configere()
        showResult()
    }
    
    func showResult() {
        resultLable.text = String(format: "Your BMI is %.2f", bmi)
        
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
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
    
