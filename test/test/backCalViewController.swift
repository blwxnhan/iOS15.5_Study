//
//  BackCalViewController.swift
//  test
//
//  Created by Bowon Han on 2023/09/28.
//

import UIKit

class BackCalViewController:UIViewController{
    
    var height:String! = ""
    var weight:String! = ""
    var bmiResultStore:Float! = 0
    
    override func viewDidLoad() {
    
        calBMI()
        view.backgroundColor = .white
        view.addSubview(backCalButton)
        view.addSubview(resultGuideLabel)
        view.addSubview(lbResult)
        view.addSubview(lbCondition)
    }
    
    func calBMI(){
        
        let floatHeight:Float! = (height as NSString).floatValue
        let floatWeight:Float! = (weight as NSString).floatValue
        bmiResultStore = floatWeight / ((floatHeight*0.01)*(floatHeight*0.01))

        if bmiResultStore >= 25 {lbCondition.text = "비만"}
        else if (23 <= bmiResultStore) || (bmiResultStore >= 24.99) {
            lbCondition.text = "과체중"
        }
        else if (18.5 <= bmiResultStore) || (bmiResultStore >= 22.99) {
            lbCondition.text = "정상"
        }
        else {lbCondition.text = "저체중"}
        self.lbResult.text = String(format:"%.2f",bmiResultStore)
    }
    
    lazy var backCalButton:UIButton = {
        let button = UIButton()
        button.setTitle("다시 계산하기", for: .normal)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.backgroundColor = .systemBlue
        button.frame = CGRect(x: 50, y: 700, width: 300, height: 40)
        
        return button
    }()
    
    let resultGuideLabel:UILabel = {
        let label = UILabel()
        label.text = "BMI 결과값"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 23)
        label.frame = CGRect(x: 50, y: 100, width: 300, height: 40)
        
        return label
    }()
    
    let lbResult:UILabel = {
        var label = UILabel()
        label.backgroundColor = .systemBrown
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.frame = CGRect(x: 100, y: 180, width: 200, height: 50)
        
        return label
    }()
    
    let lbCondition:UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.frame = CGRect(x: 50, y: 260, width: 300, height: 40)
        
        return label
    }()
    
        
    @objc
    func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}



