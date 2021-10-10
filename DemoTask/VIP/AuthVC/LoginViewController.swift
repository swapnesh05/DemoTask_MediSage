//
//  LoginViewController.swift
//  DemoTask
//
//  Created on 10/10/21.
//


import UIKit

protocol LoginProtocol: class {
}

class LoginViewController: UIViewController, LoginProtocol {

    // MARK: Objects & Variables
    var presenterLogin: LoginPresentationProtocol?

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
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        
        //View Controller will communicate with only presenter
        viewController.presenterLogin = presenter
        
        //Presenter will communicate with Interector and Viewcontroller
        presenter.viewControllerLogin = viewController
        presenter.interactorLogin = interactor
        
        //Interactor will communucate with only presenter.
        interactor.presenterLogin = presenter
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    private var strEmail = String()
    private var strPassword = String()

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupUI()
    }
    
    //MARK: SetupUI()
    private func setupUI() {
        self.txtEmail.placeholder = KeyMessages.shared.enterEmail
        self.txtEmail.placeHolderColor = .darkGray
        self.txtPassword.placeholder = KeyMessages.shared.enterPassword
        self.txtPassword.placeHolderColor = .darkGray
        
        self.txtEmail.delegate = self
        self.txtPassword.delegate = self
        
        self.btnSubmit.isEnabled = false
        self.btnSubmit.alpha = 0.5
        self.btnSubmit.layer.cornerRadius = 5
    }
    
    //MARK: @IBAction
    @IBAction func actionLoginBtn(_ sender: Any) {
        self.presenterLogin?.moveToHomeVC()
    }
}

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {        
        if textField == self.txtEmail {
            let isValidEmail = textField.text!.isEmail
            if isValidEmail {
                self.strEmail = textField.text!.trimmingCharacters(in: .whitespaces)
            } else {
                self.strEmail = ""
            }
        } else {
            let isValidPassword = textField.text!.isPassword
            if isValidPassword {
                self.strPassword = textField.text!.trimmingCharacters(in: .whitespaces)
            } else {
                self.strPassword = ""
            }
        }
                
        if !self.strEmail.isEmpty && !self.strPassword.isEmpty {
            self.btnSubmit.isEnabled = true
            self.btnSubmit.alpha = 1
        } else {
            self.btnSubmit.isEnabled = false
            self.btnSubmit.alpha = 0.5
        }
    }
}
