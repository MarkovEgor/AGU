//
//  ViewController.swift
//  AGU
//
//  Created by Egor Markov on 06/01/2019.
//  Copyright © 2019 Egor Markov. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var activitiIdicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginInPressedButton(_ sender: Any) {
        
        guard let email = emailTF.text, !email.isEmpty, let password = passwordTF.text, !password.isEmpty else {
            return
        }
        view.endEditing(true)
        activitiIdicator.startAnimating()
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            self.activitiIdicator.stopAnimating()
            self.emailTF.text = ""
            self.passwordTF.text = ""
            print( "user sing in")
           
            self.performSegue(withIdentifier: "segueHome", sender: nil)
        }

            
        
    }
    
    
    

    @IBAction func forgotPasswordPressed(_ sender: Any) {
        
        let presetVC = PresetPasswordVC()
        presetVC.modalPresentationStyle = .overCurrentContext
        presetVC.modalTransitionStyle = .crossDissolve
        present(presetVC, animated: true, completion: nil)
    }
    
}

