//
//  FirebaseManager.swift
//  MapDemo
//
//  Created by Plam Stefanova on 4/3/20.
//  Copyright © 2020 Plam Stefanova. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseManager{
    
    var auth = Auth.auth() // Firebase authentication class.
    let parentVC: UIViewController
    
    init(parentVC: UIViewController) {
        self.parentVC = parentVC
        auth.addIDTokenDidChangeListener { (auth, user) in
                if user != nil {
                               print("Status: user is logged in: \(user)") // show some GUI
                           }else {
                               print("Status: user is logged out") // hide content
                }
         }
    }
    
    func signUp(email:String, pwd:String) {
         auth.createUser(withEmail: email, password: pwd) { (result, error) in
             if error == nil { // success
                 print("successfully signed up to Firebase \(result.debugDescription)")
             }else {
                 print("Failed to log in \(error.debugDescription)")
             }
         }
     }
     
     func signIn(email:String, pwd:String) {
         auth.signIn(withEmail: email, password: pwd) { (result, error) in
             if error == nil { // success
                    print("successfully logged in to Firebase \(result.debugDescription)")
                    // call parentVC to display something, such as parentVC.showPanel()
                    }else {
                    print("Failed to log in \(error.debugDescription)")
             }
         }
     }
     
     func signOut() {
         do {
             try auth.signOut()
         }catch let error{
             print("error signing out \(error.localizedDescription)")
         }
     }
    
}
