//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Ricardo Hdz on 7/22/15.
//  Copyright (c) 2015 Ricardo Hdz. All rights reserved.
//

import UIKit

class MemeDetailViewController: MemeViewController {
    var meme: Meme!
    
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var memeToolbar: UIToolbar!
    
    override func viewWillAppear(animated: Bool) {
        //Assign meme to image
        self.memeImage!.image = meme.memeImage
        self.tabBarController?.tabBar.hidden = true
        setNavigationItems()
        setToolbarItems()
    }
    
    /**
        Done button handler - Pops to root navigation controller
    **/
    func dismissDetailController() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    /**
        Sets the nav button items
    **/
    func setNavigationItems() {
        var doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "dismissDetailController")
        self.navigationItem.rightBarButtonItem = doneBtn
    }
    
    /**
        Sets the toolbar button items
    **/
    func setToolbarItems() {
        var deleteButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Trash, target: self, action: "deleteMeme")
        var spaceItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        memeToolbar.setItems([spaceItem, deleteButton], animated: false)
    }
    
    func deleteMeme() {
        if let found = find(memes.map({ $0.memeImage }), meme.memeImage) {
            memes.removeAtIndex(found)
            self.dismissDetailController()
        }
    }
}