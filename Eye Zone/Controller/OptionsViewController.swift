//
//  RegisterViewController.swift
//  Eye Zone
//
//  Created by Griffin Christenson on 3/20/18.
//  Copyright © 2018 Eye Zone. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import Firebase


class SignInOptionsViewController: UIViewController {
    
    
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var backgroundView: UIImageView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var eyeZoneLogo: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.stackView.transform = CGAffineTransform(translationX: -stackView.frame.width + 10, y: 0 )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1){
            
            self.stackView.transform = .identity
                   }
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
    }
    @IBAction func signInButtonPressed(_ sender: Any) {
    }
    
    @IBAction func facebookButtonPressed(_ sender: Any) {
        
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email], viewController: self) { LoginResult in
            switch LoginResult {
            case .failed(let error):
                print(error.localizedDescription)
            case .cancelled:
                print("Cancelled")
            case.success(let grantedPermissions, let declinedPermissions, let accessToken):
                print(grantedPermissions)
                print(declinedPermissions)
                print(accessToken)
                fbAccessToken = accessToken
                let credential = FacebookAuthProvider.credential(withAccessToken: (fbAccessToken?.authenticationToken)!)
                Auth.auth().signIn(with: credential, completion: { (user, error) in
                    if let error = error {
                        print(error.localizedDescription)}})
                self.performSegue(withIdentifier: "goToMain", sender: self)
            } } }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
