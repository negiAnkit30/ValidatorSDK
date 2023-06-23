//
//  ViewController.swift
//  TestValidator
//
//  Created by H S Negi on 22/06/23.
//

import UIKit
import ValidatorSdk

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("rsponse :- \(EmailValidator.validateEmail(email: "ankit@gmail.com"))")
    }
}
