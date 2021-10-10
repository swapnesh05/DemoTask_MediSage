//
//  HomePresenter.swift
//  DemoTask
//
//  Created on 10/10/21.
//


import UIKit

protocol HomePresentationProtocol {
    func callSomething()
}

class HomePresenter: HomePresentationProtocol {
    
    // MARK: Objects & Variables
    weak var viewControllerHome: HomeProtocol?
    var interactorHome: HomeInteractorProtocol?
    
    // MARK: Present something
    func callSomething() {
        
    }
}
