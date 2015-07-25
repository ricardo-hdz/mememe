//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Ricardo Hdz on 7/22/15.
//  Copyright (c) 2015 Ricardo Hdz. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionViewController: UICollectionViewController {
    var memes = Meme.staticMemes

    @IBOutlet var memeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        memeCollectionView!.registerClass(MemeCell.self, forCellWithReuseIdentifier: "memeCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        // Adds navigation "Add Meme" button
        var addMemeBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "viewEditor")
        self.navigationItem.rightBarButtonItem = addMemeBtn
    }
    
    /**
        Action hanlder for the Add meme button
    **/
    func viewEditor() {
        let addMemeController = self.storyboard?.instantiateViewControllerWithIdentifier("AddMemeViewController") as! AddMemeViewController
        var nav = UINavigationController(rootViewController: addMemeController)
        self.showDetailViewController(nav, sender: self)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    /**
        Displays Meme Collection cells
    **/
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("memeCell", forIndexPath: indexPath) as! MemeCell
        let meme = memes[indexPath.item]
        //cell.memeText.text = meme.topText + "..." + meme.bottomText
        cell.memeImage.image = meme.memeImage
        cell.backgroundColor = UIColor.grayColor()
        return cell
    }
    
    /**
        Displays Meme Detail View from Collection
    **/
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let memeDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        memeDetailVC.meme = self.memes[indexPath.row]
        self.navigationController?.pushViewController(memeDetailVC, animated: true)
    }
}