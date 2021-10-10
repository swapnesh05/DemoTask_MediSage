//
//  KeyMessages.swift
//  DemoTask
//
//  Created by SOTSYS140 on 10/10/21.
//

import UIKit


class TitleString: NSObject {
    
    static let shared = TitleString()
    
    private override init() {
        
    }
    
    let homeVC = "Home"
    let postTab = "Post List"
    let favTab = "Favourite Posts"
}


class KeyMessages: NSObject {
    
    static let shared = KeyMessages()
    
    private override init() {
        
    }
    
    let enterEmail = "Enter email"
    let enterPassword = "Enter password (Contains 1 uppercase, 1 lowercase, 1 special character, 8 - 15 character)"
    
    

}
