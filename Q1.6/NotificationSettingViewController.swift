//
//  NotificationSettingViewController.swift
//  Q1.6
//
//  Created by SoftDev on 4/3/17.
//  Copyright © 2017 SoftDev. All rights reserved.
//

import UIKit

class NotificationSettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let delegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        delegate.vc = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onAllowNotification(sender: UIButton) {
        let settings = UIUserNotificationSettings(forTypes: .Alert, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
    }
    
    @IBAction func onRatherNot(sender: UIButton) {
        goToNextPage()
    }

    func goToNextPage() {
        let codeValidationViewController = storyboard!.instantiateViewControllerWithIdentifier("CodeValidationViewController")
        navigationController!.pushViewController(codeValidationViewController, animated: true)
    }
}
