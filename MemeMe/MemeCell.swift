//
//  MemeCell.swift
//  MemeMe
//
//  Created by Ricardo Hdz on 7/22/15.
//  Copyright (c) 2015 Ricardo Hdz. All rights reserved.
//

//import Cocoa
import UIKit

class MemeCell: UICollectionViewCell {
    var memeImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        memeImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        memeImage.contentMode = UIViewContentMode.ScaleToFill
        contentView.addSubview(memeImage!)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}