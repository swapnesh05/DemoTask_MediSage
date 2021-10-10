//
//  Constant.swift
//  DemoTask
//
//  Created by SOTSYS140 on 10/10/21.
//

import UIKit

class Constant: NSObject {
    
    static let shared = Constant()
    private override init() {
        
    }
    
    static let baseURL = "https://jsonplaceholder.typicode.com/posts"

    static var arrFavPost = [PostList]()
    
    struct UITableViewCellIdentifier {
        static let postCell = "PostCell"
    }
    
    struct ViewControllerIdentifier {
        static let loginVC = "LoginViewController"
        static let homeVC = "HomeViewController"
        static let postVC = "PostViewController"
        static let favVC = "FavViewController"
    }
    
}

class GlobalFunction: NSObject {
    
    static let shared = GlobalFunction()
    
    private override init() {
        
    }
    
    func setUpTableViewDatasourceDelegate(tblView: UITableView, parentView: UIViewController) {

        tblView.dataSource = parentView as? UITableViewDataSource
        tblView.delegate = parentView as? UITableViewDelegate
        
        tblView.estimatedRowHeight = 100
        tblView.rowHeight = UITableView.automaticDimension
        tblView.reloadData()

    }
    
    func showAlert(msg: String, vc: UIViewController) {
        let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
