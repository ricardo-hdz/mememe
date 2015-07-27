//
//  MemeListViewController.swift
//  MemeMe
//
//  Created by Ricardo Hdz on 7/21/15.
//  Copyright (c) 2015 Ricardo Hdz. All rights reserved.
//

import UIKit

class MemeListViewController: MemeViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var memeTableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        memeTableView.reloadData()
    }
        
    @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    /**
        Displays Meme List Table Rows
    **/
    @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let meme = memes[indexPath.row]
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
        memeDetailVC.meme = self.memes[indexPath.row]
        self.navigationController?.pushViewController(memeDetailVC, animated: true)
    }

}