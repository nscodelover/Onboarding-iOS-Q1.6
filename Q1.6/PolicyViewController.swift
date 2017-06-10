//
//  PolicyViewController.swift
//  Q1.6
//
//  Created by SoftDev on 4/3/17.
//  Copyright © 2017 SoftDev. All rights reserved.
//

import UIKit
import FRHyperLabel

class PolicyViewController: UIViewController {
    
    @IBOutlet weak var circleView: UIView!
    
    @IBOutlet weak var checkboxBtn1: UIButton!
    @IBOutlet weak var checkboxBtn2: UIButton!

    
    @IBOutlet weak var termsLabel: FRHyperLabel!
    @IBOutlet weak var policyLabel: FRHyperLabel!
    
    @IBOutlet weak var redTermsLabel: UILabel!
    @IBOutlet weak var redPolicyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        circleView.layer.borderColor = UIColor(red: 217 / 255, green: 217 / 255, blue: 217 / 255, alpha: 1).CGColor
        circleView.layer.borderWidth = 1.0
        circleView.layer.cornerRadius = UIScreen.mainScreen().bounds.height * 0.09
        
        let str1 = "I’ve read and agree to the terms of \nservice"
        let attributes1 = [NSForegroundColorAttributeName: UIColor.blackColor(),
            NSFontAttributeName: UIFont.systemFontOfSize(17)]
        termsLabel.attributedText = NSAttributedString(string: str1, attributes: attributes1)
        
        let handler1 = {
            (hyperLabel: FRHyperLabel!, substring: String!) -> Void in
            
            //action here
            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.onepointsixseconds.com/terms-hr")!)
        }
        termsLabel.setLinksForSubstrings(["terms of \nservice"], withLinkHandler: handler1)


        let str2 = "I’ve read and agree to the privacy \npolicy"
        let attributes2 = [NSForegroundColorAttributeName: UIColor.blackColor(),
            NSFontAttributeName: UIFont.systemFontOfSize(17)]
        policyLabel.attributedText = NSAttributedString(string: str2, attributes: attributes2)
        
        let handler2 = {
            (hyperLabel: FRHyperLabel!, substring: String!) -> Void in
            
            //action here
            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.onepointsixseconds.com/privacy-policy-hr")!)
        }
        policyLabel.setLinksForSubstrings(["privacy \npolicy"], withLinkHandler: handler2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onCheckBox(sender: UIButton) {
        if (sender.selected)
        {
            sender.setBackgroundImage(UIImage(named: "checkbox0"), forState: UIControlState.Normal)
        }
        else
        {
            sender.setBackgroundImage(UIImage(named: "checkbox1"), forState: UIControlState.Normal)
        }
        
        sender.selected = !sender.selected
    }
    
    @IBAction func onNext(sender: UIButton) {
        redTermsLabel.hidden = checkboxBtn1.selected
        redPolicyLabel.hidden = checkboxBtn2.selected
        
        if (checkboxBtn1.selected && checkboxBtn2.selected) {
            print("Next")
        }
    }

    @IBAction func onPrevious(sender: UIButton) {
        navigationController!.popViewControllerAnimated(true)
    }
}
