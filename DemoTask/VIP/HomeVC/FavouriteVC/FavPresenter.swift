//
//  FavPresenter.swift
//  DemoTask
//
//  Created on 10/10/21.
//


import UIKit

protocol FavPresentationProtocol {
    func callSomething()
}

class FavPresenter: FavPresentationProtocol {
    
    // MARK: Objects & Variables
    weak var viewControllerFav: FavProtocol?
    var interactorFav: FavInteractorProtocol?
    
    // MARK: Present something
    func callSomething() {
        
    }
}
