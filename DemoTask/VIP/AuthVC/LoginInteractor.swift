//
//  LoginInteractor.swift
//  DemoTask
//
//  Created by on 10/10/21.
//


import UIKit

protocol LoginInteractorProtocol {
    func callSomething()
}

protocol LoginDataStore {
    //{ get set }
}

class LoginInteractor: LoginInteractorProtocol, LoginDataStore {

    // MARK: Objects & Variables
    var presenterLogin: LoginPresentationProtocol?
    
    // MARK: Call something
    func callSomething() {
        
    }
}
