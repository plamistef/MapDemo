//
//  LoginViewController.swift
//  MapDemo
//
//  Created by Plam Stefanova on 4/3/20.
//  Copyright © 2020 Plam Stefanova. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var firebaseManager: FirebaseManager?
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebaseManager = FirebaseManager(parentVC: self)
        //self.modalPresentationStyle = .fullScreen
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func signInPressed(_ sender: UIButton) {
        if let email = emailField.text, let pwd = passwordField.text { // check if there is enough text
                   if email.count > 5 && pwd.count > 5{
                    firebaseManager?.signIn(email: email, pwd: pwd)
                    self.performSegue(withIdentifier: "toMap", sender: nil)
                    
                   }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
