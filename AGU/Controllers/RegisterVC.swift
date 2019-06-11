//
//  RegisterVC.swift
//  AGU
//
//  Created by Egor Markov on 07/01/2019.
//  Copyright © 2019 Egor Markov. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {
    
    //Outlet
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var activityIdecator: UIActivityIndicatorView!
    
    @IBOutlet weak var passCheckImage: UIImageView!
    @IBOutlet weak var confirmPassImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       navigationController?.navigationBar.topItem?.title = ""
       navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        passwordTF.addTarget(self, action: #selector(textFildDidChange(_:)), for: .editingChanged)
        confirmPasswordTF.addTarget(self, action: #selector(textFildDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFildDidChange(_ textFild: UITextField) {
        
        guard let textPassTF = passwordTF.text else { return }
        
        
        //Started typing
        if textFild == confirmPasswordTF {
            passCheckImage.isHidden = false
            confirmPassImage.isHidden = false
        }else if textPassTF.isEmpty {
            passCheckImage.isHidden = true
            confirmPassImage.isHidden = true
            confirmPasswordTF.text = ""
        }
        
        //Check green
        if passwordTF.text == confirmPasswordTF.text {
            passCheckImage.image = UIImage(named: "green_check")
            confirmPassImage.image = UIImage(named: "green_check")
        }else{
            passCheckImage.image = UIImage(named: "red_check")
            confirmPassImage.image = UIImage(named: "red_check")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        
        guard let email = emailTF.text, !email.isEmpty, let password = passwordTF.text, !password.isEmpty, let username = usernameTF.text, !username.isEmpty else {
            return
        }
        view.endEditing(true)
        activityIdecator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error {
                debugPrint(error)
            }
            
       
            self.activityIdecator.stopAnimating()
            self.didTapBackButton()
            print( "new user" )
           
            
            
        }
        
        
    }
    

    func didTapBackButton() {
        // if you use navigation controller, just pop ViewController:
        if let nvc = navigationController {
            nvc.popViewController(animated: true)
        } else {
            // otherwise, dismiss it
            dismiss(animated: true, completion: nil)
        }
    }
    

}
