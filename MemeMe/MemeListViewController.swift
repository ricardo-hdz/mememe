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
        var addMeme = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: self, action: "viewEditor")
        self.navigationItem.rightBarButtonItem = addMeme
    }
    
    /**
        Action hanlder for the Add meme button
    **/
    func viewEditor() {
        let addMemeController = self.storyboard?.instantiateViewControllerWithIdentifier("AddMemeViewController") as! AddMemeViewController
        self.navigationController!.pushViewController(addMemeController, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stubMemes.count
    }
    
    /**
        Displays Meme List Table Rows
    **/
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("memeCell") as! UITableViewCell
        let meme = stubMemes[indexPath.row]
        cell.textLabel?.text = meme.topText
        cell.imageView?.image = meme.memeImage
        
        if let detailText = cell.detailTextLabel {
            detailText.text = meme.bottomText
        }
        return cell
    }
    
    /**
        Displays Meme Detail View from List
    **/
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Instantiate detail meme controller ans present
        let memeDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        memeDetailVC.meme = self.stubMemes[indexPath.row]
        self.navigationController?.pushViewController(memeDetailVC, animated: true)
    }

}