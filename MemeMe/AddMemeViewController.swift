//
//  ViewController.swift
//  MemeMe
//
//  Created by Ricardo Hdz on 7/20/15.
//  Copyright (c) 2015 Ricardo Hdz. All rights reserved.
//

import UIKit

class AddMemeViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var originalImage: UIImageView!
    @IBOutlet weak var menuBar: UIToolbar!
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    @IBOutlet weak var memeToolbar: UIToolbar!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    let memeTextAttributes = [
        NSStrokeColorAttributeName: UIColor.blackColor(),
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName: 3.0
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Sets the image picket items
        var pickImage = UIBarButtonItem(title: "Album", style: UIBarButtonItemStyle.Plain, target: self, action: "displayImagePickerLibrary")
        var spaceItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        var cameraButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: self, action: "displayImagePickerCamera")
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(.Camera)

        menuBar.setItems([cameraButton, spaceItem, pickImage], animated: false)
        
        // Sets the textfields
        topText.text = "TOP"
        topText.textAlignment = NSTextAlignment.Center
        topText.defaultTextAttributes = memeTextAttributes
        topText.delegate = self
        
        bottomText.text = "BOTTOM"
        bottomText.textAlignment = NSTextAlignment.Center
        bottomText.defaultTextAttributes = memeTextAttributes
        bottomText.delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Subscibe to keyboard notifications
        self.subscribeToKeyboardNotifications()

        // Set navigation bar buttons
        var cancelBtn = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "cancelAction")
        self.navigationBar.rightBarButtonItem = cancelBtn
        
        var shareBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: "shareMeme")
        self.navigationItem.leftBarButtonItem = shareBtn
    }
    
    /**
         Dismiss VCV and returns to list view
    **/
    func cancelAction() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //var keyboardHideNotification = NSNotification(name: "keyboardWillHide", object: self)
        //NSNotificationCenter.defaultCenter().postNotification(keyboardHideNotification)
        self.view.endEditing(true)
        
        return false
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.unsubscribeFromKeyboardNotifications()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    Subscriber to keyboard notifications
    **/
    func subscribeToKeyboardNotifications() {
        // Show keyboard
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        // Hide keyboard
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    /**
    Repositions view frame when keyboard displays
    **/
    func keyboardWillShow(notification: NSNotification) {
        self.view.frame.origin.y -= getKeyboardHeight(notification)
    }
    
    /**
    Repositions view frame when keyboard hides
    **/
    func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y += getKeyboardHeight(notification)
    }
    
    /**
    Gets the keyboard height
    **/
    func getKeyboardHeight(notifcation: NSNotification) -> CGFloat {
        let userInfo = notifcation.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.CGRectValue().height
    }
    
    /**
    Sets the selected image on the UIImageView
    **/
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            originalImage.image = image
        }
        displayTextfields()
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /**
    Displays the textfields in the view
    **/
    func displayTextfields() {
        topText.hidden = false
        bottomText.hidden = false
    }
    
    /**
    Generate a meme image with the current view grame context
    TODO: DRY up the toolbar hide logic
    **/
    func generateMemeImage() -> UIImage {
        
        self.navigationController?.navigationBarHidden = true
        self.memeToolbar.hidden = true
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawViewHierarchyInRect(self.view.frame, afterScreenUpdates: true)
        let memeImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.navigationController?.navigationBarHidden = false
        self.memeToolbar.hidden = true
        
        return memeImage
    }
    
    /**
    Image Picker Controller - Cancel handler
    **/
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /**
    UIBarButtomItem - Image Picker handlers - PhotoLibrary
    **/
    func displayImagePickerLibrary() {
        self.displayImagePicker(UIImagePickerControllerSourceType.PhotoLibrary)
    }
    
    /**
    UIBarButtomItem - Image Picker handlers - Camera
    **/
    func displayImagePickerCamera() {
        self.displayImagePicker(UIImagePickerControllerSourceType.Camera)
    }
    
    /**
    Displays the image picker
    @param sourceType
    **/
    func displayImagePicker(sourceType: UIImagePickerControllerSourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func shareMeme(sender: AnyObject) {
        var memeImg = generateMemeImage()
        var activityCV = UIActivityViewController(activityItems: [memeImg], applicationActivities: nil)
        activityCV.completionWithItemsHandler = {(activityType, completed:Bool, returnedItems, activityError) in
            if completed {
                // Save meme
                var meme = Meme(
                    topText: self.topText.text as String,
                    bottomText: self.bottomText.text as String,
                    originalImage: self.originalImage.image!,
                    memeImage: memeImg
                )
                self.saveMeme(meme)
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        self.presentViewController(activityCV, animated: true, completion: nil)
    }
    
    /**
    Saves the meme to the AppDelegate
    **/
    func saveMeme(meme: Meme) {
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
    }
}

