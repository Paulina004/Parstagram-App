//
//  CameraViewController.swift
//  Parstagram
//
//  Created by Paulina DeVito on 9/30/22.
//

import UIKit
import AlamofireImage
import Parse

//UIImagePickerControllerDelegate -> Gives you the camera events.
class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentField: UITextField!
    
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: - Submit Action
    @IBAction func onSubmitButton(_ sender: Any) {
        let post = PFObject(className: "Posts") //PFObject is kind of like a dictionary. This is for Parse.
        
        post["caption"] = commentField.text
        post["author"] = PFUser.current()! //this is for whoever the logged in owner is
        
        //This is the photo from the camera. We save it as a PNG here.
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        post["image"] = file
        
        post.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("Post saved!")
            }
            else {
                print("Error saving post!")
            }
        }
    }
    
    
    
    //MARK: - Camera Gesture Action
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self //wants to know what photo the user picked
        picker.allowsEditing = true //presents a second screen to the user after they take the photo to allow them to tweek the photo
        
        
        //If the camera is available (which it's not on the simulator) it will use that.
        //Otherwise, it will open the photo library.
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        }
        else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        //Here, we resize the image using AlamofireImage.
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageAspectScaled(toFill: size)
        imageView.image = scaledImage
        dismiss(animated: true, completion: nil) //dismisses the camera view
    }
    
    

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
