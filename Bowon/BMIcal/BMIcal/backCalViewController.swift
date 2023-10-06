//
//  backCalViewController.swift
//  BMIcal
//
//  Created by Bowon Han on 2023/09/23.
//

import UIKit

class backCalViewController:UIViewController{

    var height:String! = ""
    var weight:String! = ""
    var bmiResultStore:Float! = 0
    
    @IBOutlet var BMIResult: UILabel!
    @IBOutlet var lbCondition: UILabel!
    
    override func viewDidLoad() {
        BMIResult.layer.cornerRadius = 5
        BMIResult.layer.masksToBounds = true

        let floatHeight:Float! = (height as NSString).floatValue
        let floatWeight:Float! = (weight as NSString).floatValue
        
        bmiResultStore = floatWeight / ((floatHeight*0.01)*(floatHeight*0.01))

        if bmiResultStore >= 25 {
            lbCondition.text = "비만"
        }
        else if (23 <= bmiResultStore) || (bmiResultStore >= 24.99) {
            lbCondition.text = "과체중"
        }
        else if (18.5 <= bmiResultStore) || (bmiResultStore >= 22.99) {
            lbCondition.text = "정상"
        }
        else {
            lbCondition.text = "저체중"
        }
        
        self.BMIResult.text = String(format:"%.2f",bmiResultStore)
        
    }
    
    @IBAction func backCalView(_ sender: UIButton) {
        
        self.presentingViewController?.dismiss(animated: true)
        
    }
    
}

