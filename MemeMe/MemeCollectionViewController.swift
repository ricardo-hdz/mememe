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
        var addMeme = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "viewEditor")
        self.navigationItem.rightBarButtonItem = addMeme
    }
    
    /**
    Action hanlder for the Add meme button
    **/
    func viewEditor() {
        let addMemeController = self.storyboard?.instantiateViewControllerWithIdentifier("AddMemeViewController") as! AddMemeViewController
        self.navigationController!.pushViewController(addMemeController, animated: true)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("memeCell", forIndexPath: indexPath) as! MemeCell
        let meme = memes[indexPath.item]
        cell.memeText.text = meme.topText + "..." + meme.bottomText
        cell.memeImage.image = meme.memeImage
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let memeDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        memeDetailVC.meme = self.memes[indexPath.row]
        //memeDetailVC.modalInPopover = true
        memeDetailVC.modalPresentationStyle = UIModalPresentationStyle.FullScreen
//        self.navigationController?.pushViewController(memeDetailVC, animated: true)
        self.navigationController?.presentViewController(memeDetailVC, animated: true, completion: nil)
    }
}