//
//  ViewController.swift
//  Demo
//
//  Created by H S Negi on 27/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageVw: UIImageView!
    
    var vwModel = ImgVwModel()
    var imageUrl = "https://d4eu0x65jf51a.cloudfront.net/10097-1671431248626.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
    }
    
    func callApi() {
        vwModel.delegte = self
        vwModel.callApi(url: imageUrl) { data in
            print(data)
        }
    }
    
}

extension ViewController: ResponseData {
    func dataReceiveFromAPI(data: String) {
        print("here")
    }
    
    func imageData(data: Data) {
        if data.count > 0 {            
            DispatchQueue.main.async {
                self.imageVw.image = UIImage(data: data)
            }
        }
    }
}

