//
//  MemeListViewController.swift
//  MemeMe
//
//  Created by Ricardo Hdz on 7/21/15.
//  Copyright (c) 2015 Ricardo Hdz. All rights reserved.
//

import UIKit

class MemeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let stubMemes = Meme.staticMemes
    
    override func viewWillAppear(animated: Bool) {
        // Adds navigation "Add Meme" button
        var addMemeBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "viewEditor")
        self.navigationItem.rightBarButtonItem = addMemeBtn
    }
    
    /**
        Action handler for the Add meme button
    **/
    func viewEditor() {
        let addMemeController = self.storyboard?.instantiateViewControllerWithIdentifier("AddMemeViewController") as! AddMemeViewController
        var nav = UINavigationController(rootViewController: addMemeController)
        self.showDetailViewController(nav, sender: self)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stubMemes.count
    }
    
    /**
        Displays Meme List Table Rows
    **/
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let meme = stubMemes[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("memeCell") as! MemeTableViewCell
        cell.memeImage.image = meme.memeImage
        cell.memeText.text = meme.topText + " " + meme.bottomText
        
        return cell
    }
    
    /**
        Displays Meme Detail View from List
    **/
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let memeDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        memeDetailVC.meme = self.stubMemes[indexPath.row]
        self.navigationController?.pushViewController(memeDetailVC, animated: true)
    }

}