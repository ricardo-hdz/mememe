//
//  SentMemeViewController.swift
//  MemeMe
//
//  Created by Ricardo Hdz on 7/21/15.
//  Copyright (c) 2015 Ricardo Hdz. All rights reserved.
//

import Foundation
import UIKit

class MemeViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        // Adds navigation "Add Meme" button
        var addMemeBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "viewEditor")
        self.navigationItem.rightBarButtonItem = addMemeBtn
        self.tabBarController?.tabBar.hidden = false
    }
    
    /**
        Returns the memes stored in the app
        @return {Array}
    **/
    func getStoredMemes() -> [Meme] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.memes
    }
    
    /**
        Sets the memes in the shared array
        @param {Array}
    **/
    func setStoredMemes(memes: [Meme]) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.memes = memes
    }
    
    /**
        Action handler for the Add meme button
    **/
    func viewEditor() {
        let addMemeController = self.storyboard?.instantiateViewControllerWithIdentifier("AddMemeViewController") as! AddMemeViewController
        var nav = UINavigationController(rootViewController: addMemeController)
        self.showDetailViewController(nav, sender: self)
    }
}