//
//  ViewController.swift
//  TestValidator
//
//  Created by H S Negi on 22/06/23.
//

import UIKit
import ValidatorSdk

protocol ArthmethicOperation {
    associatedtype itemQueue
   mutating func addItem(item:itemQueue)
    func count()-> Int
}

struct IntQueue: ArthmethicOperation {
    
    var intArray = [Int]()
    
   mutating func addItem(item: Int) {
        intArray.append(item)
    }
    
    func count() -> Int {
        return intArray.count
    }

}

struct FloatQueue: ArthmethicOperation {
    var intArray = [Float]()
   mutating func addItem(item: Float) {
        intArray.append(item)
    }
    
    func count() -> Int {
        return intArray.count
    }
}



class ViewController: UIViewController {
    
    
    var intqueue = IntQueue()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intqueue.addItem(item: 34)
        intqueue.addItem(item: 43)
        print("response \(intqueue)")
        print("rsponse :- \(EmailValidator.validateEmail(email: "ankit@gmail.com"))")
    }
}
