//
//  LoginViewController.swift
//  Facebook
//
//  Created by WilliamDevine on 9/22/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIAlertViewDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fieldsView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

loadingIndicator.hidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func keyboardWillShow(notification: NSNotification!) {
   println("keyboardwillshow")
        
        var userInfo = notification.userInfo!
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!,animations: {
            self.fieldsView.frame.origin.y = self.view.frame.size.height - kbSize.height - self.fieldsView.frame.size.height}, completion: nil)
        
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        println("bye")
                var userInfo = notification.userInfo!
                var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
                var animationDuration = durationValue.doubleValue
                var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
                var animationCurve = curveValue.integerValue
                
    UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!,animations: {
            self.fieldsView.frame.origin.y = 79}, completion: nil)
                
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func onEmailEdit(sender: AnyObject) {
                    
        if (emailTextField.text=="")||(passwordTextField.text=="") {
        
            loginButton.enabled = false
            }
                    else {
                    println("notworking")
                    loginButton.enabled=true
        }
        
    }
    
    @IBAction func onLogin(sender: UIButton) {
            var alertview = UIAlertView(title: "Missing fields", message: "WRROOOONNNG PASSWORD", delegate: nil, cancelButtonTitle: "FU!")

            loadingIndicator.hidden = false
            self.loadingIndicator.startAnimating()
        
            delay(2) {
            self.loadingIndicator.stopAnimating()
            self.loadingIndicator.hidden = true
            if (self.emailTextField.text == "123") && (self.passwordTextField.text == "123")
            {
            self.performSegueWithIdentifier("loginSegue", sender: self)
            }
            else
    {
                alertview.show()
            }
            
        }
    }
    
    func delay(delay:Double, closure:()->()) {
    dispatch_after(
    dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
    ),
    dispatch_get_main_queue(), closure)
    }

    /*
// MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
