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
        self.navigationController?.pushViewController(memeDetailVC, animated: true)
    }
}