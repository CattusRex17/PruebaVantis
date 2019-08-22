//
//  Utils.swift
//  PruebaVantis
//
//  Created by Mauricio Rodriguez on 8/22/19.
//  Copyright © 2019 Mauricio Rodriguez. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    public static func validateRegex(type: RegexType, stringToValidate: String) -> Bool {
        let valid = NSPredicate(format: "SELF MATCHES %@", type.rawValue)
        return valid.evaluate(with: stringToValidate)
    }
}

//Expresiones regulares para correo
public enum RegexType: String {
    case user = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
}
