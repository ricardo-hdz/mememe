//
//  Meme.swift
//  MemeMe
//
//  Created by Ricardo Hdz on 7/20/15.
//  Copyright (c) 2015 Ricardo Hdz. All rights reserved.
//

import Foundation
import UIKit

struct Meme {
    var topText: String
    var bottomText: String
    var originalImage: UIImage
    var memeImage: UIImage
    
    init(topText: String, bottomText: String, originalImage: UIImage, memeImage: UIImage) {
        self.bottomText = bottomText
        self.topText = topText
        self.originalImage = originalImage
        self.memeImage = memeImage
    }

}