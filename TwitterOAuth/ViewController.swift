//
//  ViewController.swift
//  TwitterOAuth
//
//  Created by Satnam Sync on 1/22/16.
//  Copyright © 2016 Satnam Sync. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //recreate app on twitter dev
    
    @IBAction func onLogin(sender: UIButton) {
        
        TwitterClient.SharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.SharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "POST", callbackURL: NSURL(string: "twitterClient://oauth-callback"), scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            
            print("got the token request", requestToken.token)
            
            let authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            UIApplication.sharedApplication().openURL(authURL!)
            
            }) { (error: NSError!) -> Void in
                print("failed to  get the token request")
                print(error)
        }
    }
}

