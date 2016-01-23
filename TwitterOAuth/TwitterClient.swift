//
//  TwitterClient.swift
//  Twitter OAuth
//
//  Created by Satnam Sync on 1/22/16.
//  Copyright © 2016 Satnam Sync. All rights reserved.
//


import UIKit

let twitterConsumerKey = "O19xuROoSRlAGKYU6ACxfPdk8"
let twitterConsumerSecret = "jlwWlsr5dSJyIrhtgB4YsMbtaCxJGAITBnluGwlpOcWIfPtwu3"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1SessionManager {
    
    class var SharedInstance:  TwitterClient {
    
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret )

        }
        return Static.instance
    }

}
