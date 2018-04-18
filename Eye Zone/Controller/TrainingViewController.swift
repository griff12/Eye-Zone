//
//  TrainingViewController.swift
//  Eye Zone
//
//  Created by Griffin Christenson on 4/17/18.
//  Copyright © 2018 Eye Zone. All rights reserved.
//

import UIKit

class TrainingViewController: UIViewController {
    
    // MARK: - Properties and variables
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var resourceIdTextField: UITextField!
    @IBOutlet weak var customLayoutButton: UIButton!
    @IBOutlet weak var inputDetailsView: UIView!
    private var viewMoved:CGFloat = 0.0
    
    // MARK: - ViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the VidyoClient Library
        VCConnectorPkg.vcInitialize()
        
        // Dismissing keyboard on tap
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TrainingViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(TrainingViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(TrainingViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Class methods
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            if ((inputDetailsView.frame.origin.y + 100) > (UIScreen.main.bounds.height - keyboardRectangle.height)) {
                viewMoved = (inputDetailsView.frame.origin.y + 100.0) - (UIScreen.main.bounds.height - keyboardRectangle.height)
                UIView.animate(withDuration: 1, animations: {
                    self.inputDetailsView.frame.origin.y -= self.viewMoved
                }, completion: nil)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if viewMoved > 0 {
            UIView.animate(withDuration: 1, animations: {
                self.inputDetailsView.frame.origin.y +=  self.viewMoved
                self.viewMoved = 0
            }, completion: nil)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        if (!(nameTextField.text?.isEmpty)! && !(resourceIdTextField.text?.isEmpty)!) {
            customLayoutButton.isEnabled = true
           
        } else {
            customLayoutButton.isEnabled = false
          
        }
    }
    
    @IBAction func compositedClicked(_ sender: Any) {
        performSegue(withIdentifier: "compositedSegue", sender: nil)
    }
    
    @IBAction func customClicked(_ sender: Any) {
        performSegue(withIdentifier: "customSegue", sender: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
            let vc = segue.destination as! CustomViewController
            vc.displayName = self.nameTextField.text!
            vc.resourceID = self.resourceIdTextField.text!
        }
    
}
