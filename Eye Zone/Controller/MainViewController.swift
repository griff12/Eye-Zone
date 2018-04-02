//
//  ViewController.swift
//  Eye Zone
//
//  Created by Griffin Christenson on 3/20/18.
//  Copyright © 2018 Eye Zone. All rights reserved.
//

import UIKit
import Firebase
import FacebookCore

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        if fbAccessToken != nil {
        fbAccessToken = nil
        AccessToken.current = nil
        }
        //TODO: Log out the user and send them back to WelcomeViewController
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "backToWelcome", sender: self)
        }
        catch {
            
            print("error, there was a problem signing out")
        }
    }
    
}

