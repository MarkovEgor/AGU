//
//  PresetPasswordVC.swift
//  AGU
//
//  Created by Egor Markov on 07/01/2019.
//  Copyright © 2019 Egor Markov. All rights reserved.
//

import UIKit
import FirebaseAuth

class PresetPasswordVC: UIViewController {
    
  //Outlets
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var viewCustom: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewCustom.layer.cornerRadius = 10
        
    }


    @IBAction func resetPasswordPressedbutton(_ sender: Any) {
        
        
        guard let email = emailTF.text, !email.isEmpty else {
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func cancelPressedButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
