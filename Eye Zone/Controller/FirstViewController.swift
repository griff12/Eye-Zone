//
//  FirstViewController.swift
//  Eye Zone
//
//  Created by Griffin Christenson on 3/22/18.
//  Copyright © 2018 Eye Zone. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
   
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        UIView.animate(withDuration: 2){
            self.heightConstraint.constant = -150
            self.view.layoutIfNeeded() }        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
