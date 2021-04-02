//
//  ViewController.swift
//  Instagrid
//
//  Created by Brian Friess on 20/03/2021.
//

import UIKit

class ViewController: UIViewController{

    
    
    @IBOutlet weak private var buttonView: ViewSelect!
    @IBOutlet weak private var choiceView: ChoiceView!
    @IBOutlet weak private var labelText: UILabel!
    @IBOutlet weak private var arrowUp: UIImageView!
    private var chooseButton : UIButton!
    var swipe = UISwipeGestureRecognizer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view(.choiceTwo)
        
        // we give the parameters to "swipe"
        swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeView))
        
        //we create the gesture
        choiceView.addGestureRecognizer(swipe)
     }

    
    //this function is use to recognize the orientation of the phone
    override func viewWillLayoutSubviews() {
        changeOrientation()
    }
    
    
    //this function is used for change the value of "LabelText" and the direction of "swipe"
    func changeOrientation(){
        if UIDevice.current.orientation.isLandscape {
            labelText.text = "Swipe left to share"
            swipe.direction = .left
        }else if UIDevice.current.orientation.isPortrait{
            labelText.text = "Swipe up to share"
            swipe.direction = .up
        }
    }
    

    //this function is called when we make a gesture on choiceView
    @objc private func swipeView(){
        //we take the screen Height and width
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        //we create a mouvement
        let translation : CGAffineTransform
        if swipe.direction == .up{
            translation = CGAffineTransform(translationX:0, y: -screenHeight)
        }else{
            translation = CGAffineTransform(translationX: -screenWidth , y: 0)
        }
        //we create an animation
        UIView.animate(withDuration: 0.5) {
            self.choiceView.transform = translation
            self.labelText.transform = translation
            self.arrowUp.transform = translation
            // when the animation is a success, we call activityView
        } completion: { (success )in
            self.activityView()
        }
    }
    
    
    //we call the activity view for share choiceView
   private func activityView(){
        //we take the size of choiceView
        UIGraphicsBeginImageContext(choiceView.frame.size)
        choiceView.layer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {return}
    
        //we create the activityController
        let activityConroller = UIActivityViewController(activityItems:[image], applicationActivities: nil)
    
        //we call the activityController
        present(activityConroller, animated: true)
    
        //when we close the activity controller, we call the function "AnimationReturnView"
        activityConroller.completionWithItemsHandler = { (_, _, _, _) in
            self.AnimationReturnView()
            
            //pas sûr d'avoir besoin de ça
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    //this function allows choiceView to find its position
    private func AnimationReturnView(){
        UIView.animate(withDuration: 0.5) {
            self.choiceView.transform = .identity
            self.labelText.transform = .identity
            self.arrowUp.transform = .identity
        }
    }
    
    
    
    private enum View{
        case choiceOne, choiceTwo, choiceThree
    }
    
    
    
    //we create  different views
    private func view(_ choice : View){
        switch choice{
        case .choiceOne:
            choiceView.style = .viewOne
            buttonView.style = .viewOne
            
        case .choiceTwo:
            choiceView.style = .viewTwo
            buttonView.style = .viewTwo

        case .choiceThree:
            choiceView.style = .viewThree
            buttonView.style = .viewThree
        }
    }
    
    
    //the different views are set when we press a button
    @IBAction private func buttonViewOne(_ sender: UIButton) {
        view(.choiceOne)
    }
    
    @IBAction private func buttonViewTwo(_ sender: UIButton) {
        view(.choiceTwo)
    }
    
    @IBAction private func buttonViewThree(_ sender: UIButton) {
        view(.choiceThree)
    }
    
    
    
    //when we press a button in the choiceView, we call the function "displayPhotoLibrary" and we give the value of the button at chooseButton
    @IBAction private func buttonTopLeft(_ sender: UIButton) {
        displayPhotoLibrary()
        chooseButton = choiceView.buttonTopLeft
    }
    
    @IBAction private func buttonTopRight(_ sender: UIButton) {
        displayPhotoLibrary()
        chooseButton = choiceView.buttonTopRight
    }
    
    @IBAction private func buttonDownLeft(_ sender: UIButton) {
        displayPhotoLibrary()
        chooseButton = choiceView.buttonDownLeft
    }
    
    @IBAction private func buttonDownRight(_ sender: UIButton) {
        displayPhotoLibrary()
        chooseButton = choiceView.buttonDownRight
    }
}




extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //we create this function  for create an ImagePickerController and display the photoLibrary
    private func displayPhotoLibrary(){
        let imagePicker = UIImagePickerController()
        //redemander pour le delegate
        imagePicker.delegate = self
        //we choose as source the photo library
        imagePicker.sourceType = .photoLibrary
        //we open the photo Library
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    //this function is for choose one picture in the photo Library
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //if we choose an image, the image of chooseButton changes
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            chooseButton.setImage(pickedImage, for: .normal)
            chooseButton.contentMode = .scaleAspectFill
            chooseButton.clipsToBounds = true
        }
        //we close the photo Library when we have choose an image
        dismiss(animated: true, completion: nil)
    }
}


