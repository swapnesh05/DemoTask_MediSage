//
//  PostViewController.swift
//  DemoTask
//
//  Created on 10/10/21.
//


import UIKit
import XLPagerTabStrip
import Reachability

protocol PostProtocol: AnyObject {
    func responsePostList(arrPostList: [PostList])
}

class PostViewController: UIViewController, PostProtocol {

    // MARK: Objects & Variables
    var presenterPost: PostPresentationProtocol?

    // MARK: Object lifecycle
    /*
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = PostInteractor()
        let presenter = PostPresenter()
        
        //View Controller will communicate with only presenter
        viewController.presenterPost = presenter
        
        //Presenter will communicate with Interector and Viewcontroller
        presenter.viewControllerPost = viewController
        presenter.interactorPost = interactor
        
        //Interactor will communucate with only presenter.
        interactor.presenterPost = presenter
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var tblPostList: UITableView!

    private var arrPost = [PostList]()
    private var reachability = try! Reachability()

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
            
        //MARK: API Call
        //declare this property where it won't go out of scope relative to your listener
        self.reachability.whenReachable = { reachability in
            self.presenterPost?.callPostListAPI()
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
            //Retrieving Items
            self.loadLocalData()
        }

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        GlobalFunction.shared.setUpTableViewDatasourceDelegate(tblView: self.tblPostList, parentView: self)
        self.tblPostList.register(UINib(nibName: Constant.UITableViewCellIdentifier.postCell, bundle: nil), forCellReuseIdentifier: Constant.UITableViewCellIdentifier.postCell)
        //self.tblPostList.separatorStyle = .none        
    }
    
    private func loadLocalData() {
        do {
            let storedObjItem = UserDefaults.standard.object(forKey: "items")
            let storedItems = try JSONDecoder().decode([PostList].self, from: storedObjItem as! Data)
            self.arrPost = storedItems
            self.tblPostList.reloadData()
        } catch let err {
            print(err)
        }
    }
}

// MARK: - XLPagerTabStrip
extension PostViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: TitleString.shared.postTab)
    }
}

// MARK: - API Response
extension PostViewController {
    func responsePostList(arrPostList: [PostList]) {
        self.arrPost = arrPostList
        DispatchQueue.main.async {
            self.tblPostList.reloadData()
            //Storing Items
            if let encoded = try? JSONEncoder().encode(self.arrPost) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.UITableViewCellIdentifier.postCell, for: indexPath) as? PostCell else { return UITableViewCell() }
        let obj = self.arrPost[indexPath.row]
        cell.lblTitle.text = obj.title ?? ""
        cell.lblDetails.text = obj.body ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Constant.arrFavPost.append(self.arrPost[indexPath.row])
    }
}

class KeyedUnarchiver : NSKeyedUnarchiver {
    open override class func unarchiveObject(with data: Data) -> Any? {
        do {
            let object = try NSKeyedUnarchiver.unarchivedObject(ofClasses: [NSObject.self], from: data)
            return object
        }
        catch let error {
            Swift.print("unarchiveObject(with:) \(error.localizedDescription)")
            return nil
        }
    }

    open override class func unarchiveObject(withFile path: String) -> Any? {
        do {
            let data = try Data(contentsOf: URL.init(fileURLWithPath: path))
            let object = try unarchivedObject(ofClasses: [NSObject.self], from: data)
            return object
        }
        catch let error {
            Swift.print("unarchiveObject(withFile:) \(error.localizedDescription)")
            return nil
        }
    }
}
