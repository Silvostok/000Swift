//
//  LoginViewController.swift
//  LogIn
//
//  Created by Miguel Angel Rubio Caballero on 07/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
  
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var createInfoLabel: UILabel!
  
  
  let MyKeychainWrapper = KeychainWrapper()
  let createLoginButtonTag = 0
  let loginButtonTag = 1
  
  @IBOutlet weak var loginButton: UIButton!
  
  
  

    override func viewDidLoad() {
        super.viewDidLoad()

      // 1.
      let hasLogin = NSUserDefaults.standardUserDefaults().boolForKey("hasLoginKey")
      
      // 2.
      if hasLogin {
        loginButton.setTitle("Login", forState: UIControlState.Normal)
        loginButton.tag = loginButtonTag
        createInfoLabel.hidden = true
      } else {
        loginButton.setTitle("Create", forState: UIControlState.Normal)
        loginButton.tag = createLoginButtonTag
        createInfoLabel.hidden = false
      }
      
      // 3.
      if let storedUsername = NSUserDefaults.standardUserDefaults().valueForKey("username") as? String {
        usernameTextField.text = storedUsername as String
      }
    }

  
  
  
  func checkLogin(username: String, password: String) -> Bool {
    
    if password == MyKeychainWrapper.myObjectForKey("v_Data") as? String &&
      username == NSUserDefaults.standardUserDefaults().valueForKey("username") as? String {
        return true
    } else {
      return false
    }
    
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
  @IBAction func loginAction(sender: UIButton) {
    
    // 1.
    if (usernameTextField.text == "" || passwordTextField.text == "") {
      let alertView = UIAlertController(title: "Login Problem",
        message: "Wrong username or password." as String, preferredStyle:.Alert)
      let okAction = UIAlertAction(title: "Please try Again!", style: .Default, handler: nil)
      alertView.addAction(okAction)
      self.presentViewController(alertView, animated: true, completion: nil)
      return;
    }
    
    // 2.
    usernameTextField.resignFirstResponder()
    passwordTextField.resignFirstResponder()
    
    // 3.
    if sender.tag == createLoginButtonTag {
      
      // 4.
      let hasLoginKey = NSUserDefaults.standardUserDefaults().boolForKey("hasLoginKey")
      if hasLoginKey == false {
        NSUserDefaults.standardUserDefaults().setValue(self.usernameTextField.text, forKey: "username")
      }
      
      // 5.
      MyKeychainWrapper.mySetObject(passwordTextField.text, forKey:kSecValueData)
      MyKeychainWrapper.writeToKeychain()
      NSUserDefaults.standardUserDefaults().setBool(true, forKey: "hasLoginKey")
      NSUserDefaults.standardUserDefaults().synchronize()
      loginButton.tag = loginButtonTag
      
      performSegueWithIdentifier("dismissLogin", sender: self)
    } else if sender.tag == loginButtonTag {
      // 6.
      if checkLogin(usernameTextField.text!, password: passwordTextField.text!) {
        performSegueWithIdentifier("dismissLogin", sender: self)
      } else {
        // 7.
        let alertView = UIAlertController(title: "Login Problem",
          message: "Wrong username or password." as String, preferredStyle:.Alert)
        let okAction = UIAlertAction(title: "Foiled Again!", style: .Default, handler: nil)
        alertView.addAction(okAction)
        self.presentViewController(alertView, animated: true, completion: nil)
      }
    }
  }

}
