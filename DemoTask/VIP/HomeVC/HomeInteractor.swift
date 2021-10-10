//
//  HomeInteractor.swift
//  DemoTask
//
//  Created by on 10/10/21.
//


import UIKit

protocol HomeInteractorProtocol {
    func callSomething()
}

protocol HomeDataStore {
    //{ get set }
}

class HomeInteractor: HomeInteractorProtocol, HomeDataStore {

    // MARK: Objects & Variables
    var presenterHome: HomePresentationProtocol?
    
    // MARK: Call something
    func callSomething() {
        
    }
}
