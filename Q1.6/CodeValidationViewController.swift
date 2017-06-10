//
//  CodeValidationViewController.swift
//  Q1.6
//
//  Created by SoftDev on 4/3/17.
//  Copyright © 2017 SoftDev. All rights reserved.
//

import UIKit

class CodeValidationViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var invalidateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        codeTextField.layer.borderColor = UIColor(red: 133.0 / 255, green: 133.0 / 255, blue: 133.0 / 255, alpha: 0.7).CGColor
        codeTextField.layer.borderWidth = 1.0
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 15, self.codeTextField.frame.height))
        codeTextField.leftView = paddingView
        codeTextField.leftViewMode = UITextFieldViewMode.Always
        codeTextField.autocapitalizationType = .AllCharacters
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("hideKeyboard"))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .Default
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    ////////////////////////////////
    
    func textFieldDidBeginEditing(textField: UITextField) {
        codeTextField.layer.borderColor = UIColor(red: 133.0 / 255, green: 133.0 / 255, blue: 133.0 / 255, alpha: 0.7).CGColor
        codeTextField.textColor = UIColor(red: 133.0 / 255, green: 133.0 / 255, blue: 133.0 / 255, alpha: 0.7)
        invalidateLabel.hidden = true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        codeTextField.resignFirstResponder()
        moveToNextPage()
        return true
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    ////////////////////////////////

    @IBAction func onNext(sender: UIButton) {
        moveToNextPage()
    }
    
    func moveToNextPage() {
        if (checkValidateCode()) {
            let policyViewController = storyboard!.instantiateViewControllerWithIdentifier("PolicyViewController")
            navigationController!.pushViewController(policyViewController, animated: true)
        }
        else {
            print("Invalid")
            codeTextField.layer.borderColor = UIColor(red: 208.0 / 255, green: 1.0 / 255, blue: 27.0 / 255, alpha: 1.0).CGColor
            codeTextField.textColor = UIColor(red: 208.0 / 255, green: 1.0 / 255, blue: 27.0 / 255, alpha: 1.0)
            invalidateLabel.hidden = false
        }
    }
    
    func checkValidateCode() -> Bool {
        let txtCode = (codeTextField.text!).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if (txtCode.characters.count < 3) {
            return false
        }
        
        let numCode = Int(txtCode.substringFromIndex(txtCode.endIndex.advancedBy(-2)))
        let charCode = String(txtCode.characters.dropLast(2)).lowercaseString
        
        
        var retVal: String = ""
        for val in charCode.unicodeScalars where val.isASCII() {
            retVal += String(UInt32(val))
        }
        
        let code: Int? = Int(retVal)
        
        if code != nil {
            
            print(code)
            print(numCode)
            print(code! % 97)
            
            if(numCode != nil) {
                if code! % 97 == numCode! {
                    return true
                }
            }
        }
        
        return false
    }
}
