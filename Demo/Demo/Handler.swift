//
//  Handler.swift
//  Demo
//
//  Created by H S Negi on 27/06/23.
//


protocol ResponseData: AnyObject {
    func dataReceiveFromAPI(data:String)
    func imageData(data:Data)
}

import Foundation

class ImgVwModel: NSObject {
    
    weak var delegte: ResponseData?
    
    func callApi(url:String, completionHandler: @escaping(String)-> Void) {  
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
       
            if error != nil {
                
           self.delegte?.dataReceiveFromAPI(data: "\(error?.localizedDescription ?? "error")")
            }
            
            else{
                self.delegte?.imageData(data: data!)
            }
            
        }.resume()
    }
    
}

