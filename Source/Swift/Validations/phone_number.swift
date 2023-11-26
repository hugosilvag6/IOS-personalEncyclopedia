//
//  phone_number.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import Foundation

extension String {
    func isValidPhoneNumber() -> Bool {
        let phoneRegEx = "^[\\+]?[(]?[0]{2}[)] [0]{5}-[0]{4}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        if phoneTest.evaluate(with: self) {
            return false
        }
        return self.count == 15
    }
}
