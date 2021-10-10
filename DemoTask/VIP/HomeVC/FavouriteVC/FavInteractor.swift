//
//  FavInteractor.swift
//  DemoTask
//
//  Created by on 10/10/21.
//


import UIKit

protocol FavInteractorProtocol {
    func callSomething()
}

protocol FavDataStore {
    //{ get set }
}

class FavInteractor: FavInteractorProtocol, FavDataStore {

    // MARK: Objects & Variables
    var presenterFav: FavPresentationProtocol?
    
    // MARK: Call something
    func callSomething() {
        
    }
}
