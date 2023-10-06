//
//  ViewController.swift
//  BMIcal
//
//  Created by Bowon Han on 2023/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lbHeight: UITextField!
    @IBOutlet var lbWeight: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func BMIcal(_ sender: UIButton) {
        //이동할 뷰 컨트롤러 객체를 storyboardID정보를 이용하여 참조
        guard let uvc =
        //현재 뷰 컨트롤러에서 BMIResultVC라는 식별자를 가진 뷰컨을 인스턴스화 하려는 것 -> as ~는 backCalViewController로 형변환하려는 것 -> 안되면 nil 반환
        self.storyboard?.instantiateViewController(withIdentifier: "BMIResultVC") as? backCalViewController else {
            return
        }
        
        uvc.height = self.lbHeight.text!
        uvc.weight = self.lbWeight.text!
        
        uvc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        //인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
        self.present(uvc,animated: true)
    }
}

