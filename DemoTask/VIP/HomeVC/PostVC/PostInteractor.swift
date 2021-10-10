//
//  PostInteractor.swift
//  DemoTask
//
//  Created by on 10/10/21.
//


import UIKit
import ProgressHUD

protocol PostInteractorProtocol {
    func callPostListAPI()
}

protocol PostDataStore {
    //{ get set }
}

class PostInteractor: PostInteractorProtocol, PostDataStore {

    // MARK: Objects & Variables
    var presenterPost: PostPresentationProtocol?
    
    // MARK: Call something
    func callPostListAPI() {
        ProgressHUD.show()
        let url = URL(string: Constant.baseURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            ProgressHUD.dismiss()
            self.presenterPost?.getResponsePostList(data: data, error: error)
        }
        task.resume()
    }
}
