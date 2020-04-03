//
//  LoginViewController.swift
//  MapDemo
//
//  Created by Plam Stefanova on 4/3/20.
//  Copyright © 2020 Plam Stefanova. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUp: UIViewController {
    
   // var loginVC = LoginViewController()
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    var auth = Auth.auth()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpPressed(_ sender: Any) {
        if let email = emailField.text, let pwd = passwordField.text { // check if there is enough text
                   if validateEmail(candidate: email) && pwd.count > 5{
                    signUp(email: email, pwd: pwd)
                   }
                   else {print("i didnt sign you up")}
               }
   
    }
    
    func signUp(email:String, pwd:String) {
        auth.createUser(withEmail: email, password: pwd) { (result, error) in
            if error == nil { // success
                print("successfully sign up to Firebase \(result.debugDescription)")
                self.performSegue(withIdentifier: "goToMap", sender: self)
            }else {
                print("Failed to log in \(error.debugDescription)")
            }
        }
    }
    
    func validateEmail(candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
       // loginVC.modalPresentationStyle = .fullScreen
        performSegue(withIdentifier: "goToMap", sender: nil)

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


