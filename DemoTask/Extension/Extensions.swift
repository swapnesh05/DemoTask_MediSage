//
//  Extensions.swift
//  DemoTask
//
//  Created by SOTSYS140 on 10/10/21.
//

import UIKit

extension String {
    /// SwifterSwift: Verify if string matches the regex pattern.
    ///
    /// - Parameter pattern: Pattern to verify.
    /// - Returns: true if string matches the pattern.
    func matches(pattern: String) -> Bool {
        return range(of: pattern,
                     options: String.CompareOptions.regularExpression,
                     range: nil, locale: nil) != nil
    }
    
    var isEmail: Bool {
        // http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
        return matches(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    }
    
    var isPassword: Bool {
        return matches(pattern: "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[@#$%^&*-_!?&]).{8,15}")
    }
}


extension UITextField {
    
    @IBInspectable var placeHolderColor: UIColor? {
         get {
             return self.placeHolderColor
         }
         set {
             self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
         }
     }
}

