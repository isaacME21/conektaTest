//
//  String+Extension.swift
//  Examen Conekta
//
//  Created by Luis Isaac Maya on 31/03/21.
//

import Foundation
extension String{
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{6,}$"

        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: self)
    }
}
