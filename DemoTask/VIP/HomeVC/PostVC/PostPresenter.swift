//
//  PostPresenter.swift
//  DemoTask
//
//  Created on 10/10/21.
//


import UIKit

protocol PostPresentationProtocol {
    func callPostListAPI()
    func getResponsePostList(data: Data?, error: Error?)
}

class PostPresenter: PostPresentationProtocol {
    
    // MARK: Objects & Variables
    weak var viewControllerPost: PostProtocol?
    var interactorPost: PostInteractorProtocol?
    
    // MARK: Present something
    func callPostListAPI() {
        self.interactorPost?.callPostListAPI()
    }
    
    func getResponsePostList(data: Data?, error: Error?) {
        if error == nil {
            let decoder = JSONDecoder()
            do {
                let post = try decoder.decode([PostList].self, from: data!)
                self.viewControllerPost?.responsePostList(arrPostList: post)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            GlobalFunction.shared.showAlert(msg: (error?.localizedDescription ?? ""), vc: ((self.viewControllerPost as? UIViewController)!))
        }
    }
}
