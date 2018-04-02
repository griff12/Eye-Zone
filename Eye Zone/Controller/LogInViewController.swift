//
//  LogInViewController.swift
//  Eye Zone
//
//  Created by Griffin Christenson on 3/20/18.
//  Copyright © 2018 Eye Zone. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var credentialsHeight: NSLayoutConstraint!
    @IBOutlet var eyeZoneHeight: NSLayoutConstraint!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
               // Do any additional setup after loading the view.
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.5){
            self.eyeZoneHeight.constant = -150
            self.credentialsHeight.constant = 300
            
            self.view.layoutIfNeeded() }
        usernameTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.returnKeyType = UIReturnKeyType.done
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        
        //TODO: Log in the user
        Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!)
        {(user, error) in
            
            if error != nil || user == nil {
                print(error!)
            }
            else {
                
                print("Log in successful!")
                
                
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
                
            }
            SVProgressHUD.dismiss()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
