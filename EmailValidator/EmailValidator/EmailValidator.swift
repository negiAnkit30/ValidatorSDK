//
//  EmailValidator.swift
//  EmailValidator
//
//  Created by H S Negi on 22/06/23.
//

import Foundation
//creating a conflict 
public class EmailValidator {
    //dedkrlfm
   public static func validateEmail(email:String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
 //gvg
}
