//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Paulina DeVito on 9/30/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    
    //MARK: - Minimize Keyboard after Typing
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    //MARK: - Sign In Action
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if (user != nil) {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error: \(error?.localizedDescription))")
            }
        }
    }
    
    
    
    //MARK: - Sign Out Action
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
       
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error: \(error?.localizedDescription))")
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
