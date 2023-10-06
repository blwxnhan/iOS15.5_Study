//
//  ViewController.swift
//  test
//
//  Created by Bowon Han on 2023/09/28.
//

import UIKit

final class ViewController: UIViewController {
    
    lazy var BMIButton:UIButton = {
        let button = UIButton()
        let safeArea = view.safeAreaLayoutGuide
        button.setTitle("BMI 계산하기", for: .normal)
        button.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 20).isActive = true
        button.bottomAnchor.constraint(equalTo:  safeArea.bottomAnchor,constant: -20).isActive = true
        button.trailingAnchor.constraint(equalTo:  safeArea.trailingAnchor, constant: -20).isActive = true
//        button.frame = CGRect(x: 50, y: 700, width: 300, height: 40) // 위치와 크기 조정
        return button
    }()
    
    lazy var guideLabel:UILabel = {
        let label = UILabel()
        let safeArea = view.safeAreaLayoutGuide
        label.text = "키와 몸무게를 입력하세요"
        label.textAlignment = .center
        //adjustsFontSizeToFitWidth 라벨의 크기에 맞게 자동으로 폰트 크기조절
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false

//        label.frame = CGRect(x: 50, y:100, width: 300, height: 40)
        label.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo:  safeArea.trailingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 80).isActive = true
        return label
    }()
    
    lazy var lbHeight:UILabel = {
        let label = UILabel()
        let safeArea = view.safeAreaLayoutGuide

        label.text = "키"
        label.adjustsFontSizeToFitWidth = true
//        label.frame = CGRect(x: 60, y: 180, width: 100, height: 40)
        label.translatesAutoresizingMaskIntoConstraints = false

        label.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 60).isActive = true
        label.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 150).isActive = true

        return label
    }()
    
    lazy var lbWeight:UILabel = {
        let label = UILabel()
        let safeArea = view.safeAreaLayoutGuide

        label.text = "몸무게"
        label.adjustsFontSizeToFitWidth = true
//        label.frame = CGRect(x: 50, y: 230, width: 100, height: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 50).isActive = true
        label.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 210).isActive = true
        return label
    }()

    lazy var tfHeight:UITextField = {
        let textField = UITextField()
        let safeArea = view.safeAreaLayoutGuide

        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.frame = CGRect(x: 110, y: 180, width: 230, height: 40)
        textField.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 120).isActive = true
        textField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 145).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 228).isActive = true
        return textField
    }()
    
    lazy var tfWeight:UITextField = {
        let textField = UITextField()
        let safeArea = view.safeAreaLayoutGuide

        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor,constant: 120).isActive = true
        textField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 205).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 228).isActive = true
//        textField.frame = CGRect(x: 110, y: 230, width: 230, height: 40)
        
        return textField
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white 
        view.addSubview(BMIButton)
        view.addSubview(guideLabel)
        view.addSubview(lbHeight)
        view.addSubview(lbWeight)
        view.addSubview(tfHeight)
        view.addSubview(tfWeight)
        
    }
    
    @objc
    func onTapButton(_ sender: UIButton){
        let backCalVC = BackCalViewController()
        backCalVC.height = tfHeight.text!
        backCalVC.weight = tfWeight.text!
        
        //modalPresentationStyle -> UIViewController의 속성 중 하나 , 열거형 사용하여 모달의 프레젠테이션 스타일 지정가능
        //full screen -> 화면을 완전히 덮고 배경 뷰 컨트롤러를 숨김

        backCalVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(backCalVC, animated: true, completion: nil)
        
    }

    
    
}


