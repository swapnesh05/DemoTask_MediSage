//
//  HomeViewController.swift
//  DemoTask
//
//  Created on 10/10/21.
//


import UIKit
import XLPagerTabStrip

protocol HomeProtocol: AnyObject {
}

class HomeViewController: ButtonBarPagerTabStripViewController, HomeProtocol {

    // MARK: Objects & Variables
    var presenterHome: HomePresentationProtocol?

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
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        
        //View Controller will communicate with only presenter
        viewController.presenterHome = presenter
        
        //Presenter will communicate with Interector and Viewcontroller
        presenter.viewControllerHome = viewController
        presenter.interactorHome = interactor
        
        //Interactor will communucate with only presenter.
        interactor.presenterHome = presenter
    }
    
    // MARK: IBOutlets
    

    // MARK: View lifecycle
    override func viewDidLoad() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = UIColor.green
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 14)
        
        settings.style.selectedBarHeight = 3.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = UIColor.green
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.lightGray
            newCell?.label.textColor = UIColor.green
        }

        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = TitleString.shared.homeVC
    }
    
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let postVC = self.storyboard!.instantiateViewController(identifier: Constant.ViewControllerIdentifier.postVC) as PostViewController
        let favVC = self.storyboard!.instantiateViewController(identifier: Constant.ViewControllerIdentifier.favVC) as FavViewController
        return [postVC, favVC]
    }
}
