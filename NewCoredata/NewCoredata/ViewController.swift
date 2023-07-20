//
//  ViewController.swift
//  NewCoredata
//
//  Created by H S Negi on 12/07/23.
//

import UIKit
import CoreData
//import QuartzCore

class ViewController: UIViewController {
    let layer = CALayer()
    let size = 200.0
    override func viewDidLoad() {
        super.viewDidLoad()
        //insertingData()
    //  deleteData()
       // updateData()
     //  readData()
        CAlayer2()
        setupButton()
        //setupLayer()
       // animateLayer()
        //animatePosition()
    }
    
    func setupLayer() {
        layer.bounds = CGRect(x: 0, y: 0, width: size, height: size)
        layer.position = view.center
        layer.cornerRadius = size / 2
        layer.backgroundColor = UIColor.red.cgColor

        var transform = CATransform3DIdentity
        transform.m34 = -1 / 1000  // Set a perspective transform
        layer.transform = transform

        view.layer.addSublayer(layer)
    }
    
    
    func setupButton() {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 600, width: 200, height: 50)
        button.setTitle("Move Layer", for: .normal)
        button.addTarget(self, action: #selector(moveLayer), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func moveLayer() {
        let initialPosition = layer.position
        let upPosition = CGPoint(x: initialPosition.x, y: initialPosition.y + 800)
        let downPosition = CGPoint(x: initialPosition.x, y: initialPosition.y)

        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.values = [
            NSValue(cgPoint: initialPosition),
            NSValue(cgPoint: upPosition),
            NSValue(cgPoint: downPosition)
        ]
        animation.keyTimes = [0, 0.5, 1]
        animation.timingFunctions = [
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeOut)
        ]
        animation.duration = 1.0
        layer.add(animation, forKey: "moveAnimation")
    }
    
    func animateLayer() {
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.values = [
            NSValue(caTransform3D: CATransform3DIdentity),
            NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat.pi / 4, 1, 0, 0)),
            NSValue(caTransform3D: CATransform3DMakeScale(1.5, 1.5, 1.5)),
            NSValue(caTransform3D: CATransform3DIdentity)
        ]
        animation.keyTimes = [0, 0.25, 0.5, 1]
        animation.timingFunctions = [
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeOut),
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeOut)
        ]
        animation.duration = 2.0
        layer.add(animation, forKey: "3DAnimation")
    }

    
    
    func CAlayer2(){
        layer.backgroundColor = UIColor.red.cgColor
       
        layer.position = CGPoint(x: 100, y: 100)
        layer.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        layer.cornerRadius = 100.0
        view.layer.addSublayer(layer)
    }
    
    
    func animationLayer() {
        let animation = CABasicAnimation(keyPath: "poistion")
        animation.fromValue = NSValue(cgPoint: layer.position)
        animation.toValue = NSValue(cgPoint: CGPoint(x: 400, y: 200))
        animation.duration = 5.0
        layer.add(animation, forKey: "positionAnimation")
        layer.position = CGPoint(x: 600, y: 200)
    }
    
    
//    func animatePosition() {
//          let animation = CAKeyframeAnimation(keyPath: "position")
//        animation.values = [ NSValue(cgPoint: layer.position),
//                             NSValue(cgPoint: CGPoint(x: 100, y: Int(view.bounds.height) - size / 2)),
//                             NSValue(cgPoint: CGPoint(x: 100, y: Int(view.bounds.height) - size / 2 - 50)),
//        NSValue(cgPoint: CGPoint(x: 100, y: 100))]
//        animation.keyTimes = [0, 0.5, 0.75, 1]
//        animation.timingFunctions = [ CAMediaTimingFunction(name: .easeIn),
//                                      CAMediaTimingFunction(name: .easeOut),
//                                      CAMediaTimingFunction(name: .easeIn),
//                                      CAMediaTimingFunction(name: .easeOut)]
////          animation.fromValue = NSValue(cgPoint: layer.position)
////          animation.toValue = NSValue(cgPoint: CGPoint(x: 400, y: 1000))
//          animation.duration = 3.0
//          layer.add(animation, forKey: "bounceAnimation")
//        //  layer.position = CGPoint(x: 400, y: 1000) // Apply the final position after the animation
//      }

    func insertingData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let entityData = NSEntityDescription.entity(forEntityName: "ClassData", in: managedContext)
        let studentData = ClassData(entity: entityData!, insertInto: managedContext)
        studentData.studentName = "Ankit"
        studentData.rollNo = 3
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        if let date = dateFormatter.date(from: "1994-01-30") {
            studentData.date = date
        }
        do {
            try managedContext.save()
        }catch let error as NSError {
            print("\(error.userInfo)")
        }
    }
    
    func deleteData() {
        
        guard let appdleegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appdleegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassData")
        
        let predicate = NSPredicate(format: "studentName==%@", "Ankit")
        fetchRequest.predicate = predicate
        
        do {
            let fetchResult = try managedContext.fetch(fetchRequest) as? [ClassData]
            
            if let result = fetchResult {
                
                for data in result {
                    managedContext.delete(data)
                }
            }
        }catch let error as NSError {
            print(error.userInfo)
        }
     
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Save error: \(error), \(error.userInfo)")
        }
    }

    func updateData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let mgContext = appDelegate.persistentContainer.viewContext
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassData")
        
        let predicate = NSPredicate(format: "studentName ==%@", "Martaand")
        fetchReq.predicate = predicate
        
        do {
            let fretchReslt = try mgContext.fetch(fetchReq) as? [ClassData]
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.timeZone = TimeZone(identifier: "UTC")
            
            if let rslt = fretchReslt {
                
                for data in rslt {
                    
                    data.date = dateFormatter.date(from: "1994-01-30")
                    
                }
            }
            
        }catch let error as NSError {
            print(error.userInfo)
        }
        do {
            try mgContext.save()
        }catch let error as NSError {
            print(error.userInfo)
        }
    }
    
    
    func readData() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassData")
        
        do {
            let fetchReslt = try managedContext?.fetch(fetchRequest) as? [ClassData]
            if let result = fetchReslt {
                for data in result {
                    
                    let name = data.studentName
                    let rollNo = data.rollNo
                    let date = data.date ?? Date()
                    
                    print("name :\(name), rollNo :\(rollNo), date:\(date)")
                }
                
                
            }
        }catch let error {
            print(error)
        }
        
    }
    
    
}


class Employee:NSObject {
    
    @objc var name:String?
    
}


