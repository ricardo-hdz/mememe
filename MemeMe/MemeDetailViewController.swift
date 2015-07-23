//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Ricardo Hdz on 7/22/15.
//  Copyright (c) 2015 Ricardo Hdz. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    var meme: Meme!
    
    @IBOutlet weak var memeImage: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        //Assign meme to image
        self.memeImage!.image = meme.memeImage
    }
    
}