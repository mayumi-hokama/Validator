//
//  ViewController.swift
//  Example
//
//  Created by 外間麻友美 on 2017/06/19.
//  Copyright © 2017年 外間麻友美. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FormValidationProtocol {

    @IBOutlet weak var inputText: UITextField! {
        didSet {
            inputText.placeholder = "数字をいれてね！"
        }
    }
    
    @IBOutlet weak var validationButton: UIButton! {
        didSet {
            validationButton.addTarget(self, action: #selector(validation), for: .touchUpInside)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func validation() {
        
        let ret = numberValid(min: 1, max: 1, text: inputText.text)
        
        switch ret {
        case .valid:
            print("OK")
            break
        case .invalid(let error):
            print(error.message)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreate
        
    }


}

