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
    
    var hasNewMeme: Bool {
        get {
            return self.hasNewMeme
        }
        set (hasNewMeme) {
            self.hasNewMeme = hasNewMeme
        }
    }
    
    var memes: [Meme] {
        get {
            let object = UIApplication.sharedApplication().delegate
            let appDelegate = object as! AppDelegate
            // Use static data on first view
            return appDelegate.memes.count > 0 ? appDelegate.memes : Meme.staticMemes
        }
    }
    
    /**
        Action hanlder for the Add meme button
    **/
    func viewEditor() {
        let addMemeController = self.storyboard?.instantiateViewControllerWithIdentifier("AddMemeViewController") as! AddMemeViewController
        var nav = UINavigationController(rootViewController: addMemeController)
        self.showDetailViewController(nav, sender: self)
    }
}