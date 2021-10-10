//
//  FavViewController.swift
//  DemoTask
//
//  Created on 10/10/21.
//


import UIKit
import XLPagerTabStrip

protocol FavProtocol: AnyObject {
}

class FavViewController: UIViewController, FavProtocol {

    // MARK: Objects & Variables
    var presenterFav: FavPresentationProtocol?
    
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
        let interactor = FavInteractor()
        let presenter = FavPresenter()
        
        //View Controller will communicate with only presenter
        viewController.presenterFav = presenter
        
        //Presenter will communicate with Interector and Viewcontroller
        presenter.viewControllerFav = viewController
        presenter.interactorFav = interactor
        
        //Interactor will communucate with only presenter.
        interactor.presenterFav = presenter
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var tblFavList: UITableView!

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        GlobalFunction.shared.setUpTableViewDatasourceDelegate(tblView: self.tblFavList, parentView: self)
        self.tblFavList.register(UINib(nibName: Constant.UITableViewCellIdentifier.postCell, bundle: nil), forCellReuseIdentifier: Constant.UITableViewCellIdentifier.postCell)
        //self.tblFavList.separatorStyle = .none
    }
}

// MARK: XLPagerTabStrip
extension FavViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: TitleString.shared.favTab)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension FavViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constant.arrFavPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.UITableViewCellIdentifier.postCell, for: indexPath) as? PostCell else { return UITableViewCell() }
        let obj = Constant.arrFavPost[indexPath.row]
        cell.lblTitle.text = obj.title ?? ""
        cell.lblDetails.text = obj.body ?? ""
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Constant.arrFavPost.append(self.arrPost[indexPath.row])
    }
}
