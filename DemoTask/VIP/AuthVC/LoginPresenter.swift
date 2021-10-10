//
//  LoginPresenter.swift
//  DemoTask
//
//  Created on 10/10/21.
//


import UIKit

protocol LoginPresentationProtocol {
    func moveToHomeVC()
}

class LoginPresenter: LoginPresentationProtocol {
    
    // MARK: Objects & Variables
    weak var viewControllerLogin: LoginProtocol?
    var interactorLogin: LoginInteractorProtocol?
    
    // MARK: Present something
    func moveToHomeVC() {
        if let view = self.viewControllerLogin as? UIViewController {
            let homeVC = view.storyboard!.instantiateViewController(identifier: Constant.ViewControllerIdentifier.homeVC) as HomeViewController
            view.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
}
