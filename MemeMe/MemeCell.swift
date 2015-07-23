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
    var memeText: UILabel!
    var memeImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        memeImage = UIImageView(frame: CGRect(x: 21, y: 13, width: 111, height: 111))
        memeText = UILabel(frame: CGRect(x: 147, y: 58, width: 152, height: 21))
        memeImage.contentMode = UIViewContentMode.ScaleAspectFit
        contentView.addSubview(memeImage!)
        
        memeText.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        memeText.textAlignment = NSTextAlignment.Center
        contentView.addSubview(memeText)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}