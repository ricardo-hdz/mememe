//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Ricardo Hdz on 7/22/15.
//  Copyright (c) 2015 Ricardo Hdz. All rights reserved.
//

import UIKit

class MemeCollectionViewController: MemeViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var memeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        memeCollectionView!.registerClass(MemeCell.self, forCellWithReuseIdentifier: "memeCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        memeCollectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.getStoredMemes().count
    }
    
    /**
        Displays Meme Collection cells
    **/
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("memeCell", forIndexPath: indexPath) as! MemeCell
        let meme = self.getStoredMemes()[indexPath.item]
        cell.memeImage.image = meme.memeImage
        cell.backgroundColor = UIColor.grayColor()
        return cell
    }
    
    /**
        Displays Meme Detail View from Collection
    **/
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let memeDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        memeDetailVC.meme = self.getStoredMemes()[indexPath.row]
        self.navigationController?.pushViewController(memeDetailVC, animated: true)
    }
}