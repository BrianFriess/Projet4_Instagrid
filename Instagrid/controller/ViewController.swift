//
//  ViewController.swift
//  Instagrid
//
//  Created by Brian Friess on 20/03/2021.
//

import UIKit

class ViewController: UIViewController{

    
    
    @IBOutlet weak var buttonView: ViewSelect!
    @IBOutlet weak var choiceView: ChoiceView!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var arrowUp: UIImageView!
    private(set) var chooseButton : UIButton!
    private var IsOnMove = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moveArrowUp()
        view(.choiceTwo)
        
        //we create the GestureRecognizer "swipe up" with ChoiceView
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeViewUp(_:)))
        swipeUp.direction = .up
        choiceView.addGestureRecognizer(swipeUp)
     }
    
    

    //this function animates choiceView to go up and call the function activityView
    @objc func swipeViewUp(_ sender: UISwipeGestureRecognizer) {

        let screenHeight = UIScreen.main.bounds.height
        let translationUp = CGAffineTransform(translationX:0, y: -screenHeight/2)
        IsOnMove = true
        UIView.animate(withDuration: 1) {
            self.choiceView.transform = translationUp
            self.labelText.transform = translationUp
            self.arrowUp.transform = translationUp
        } completion: { (success )in
            self.activityView()
        }
    }
    
    
    private func AnimationReturnView(){
        UIView.animate(withDuration: 1) {
            self.choiceView.transform = .identity
            self.labelText.transform = .identity
            self.arrowUp.transform = .identity
        }
        self.IsOnMove = false
        self.moveArrowUp()
    }
    
    
    //we call the activity view for share choiceView
    func activityView(){
        UIGraphicsBeginImageContext(choiceView.frame.size)
        choiceView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        let ac = UIActivityViewController(activityItems:[image!], applicationActivities: nil)
        present(ac, animated: true) {
        }
    }
    
    
    // moveArrowUp and moveArrowDown functions is there to animate a floating arrow
    func moveArrowUp(){
        if IsOnMove == false{
            let moveUp = CGAffineTransform(translationX: 0, y: -2.5)
            UIView.animate(withDuration: 0.5) {
                self.arrowUp.transform = moveUp
            } completion: { (success) in
                self.moveArrowDown()
            }
        }
    }
    
    func moveArrowDown(){
        if IsOnMove == false{
            let moveDown = CGAffineTransform(translationX: 0, y: 2.5)
            UIView.animate(withDuration: 0.5) {
                self.arrowUp.transform = moveDown
            } completion: { (success) in
                self.moveArrowUp()
            }
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
    
    
    //different view are defined when we press a button
    @IBAction private func buttonViewOne(_ sender: UIButton) {
        view(.choiceOne)
    }
    
    @IBAction private func buttonViewTwo(_ sender: UIButton) {
        view(.choiceTwo)
    }
    
    @IBAction private func buttonViewThree(_ sender: UIButton) {
        view(.choiceThree)
    }
    
    
    
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
    
    private func displayPhotoLibrary(){

        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            chooseButton.setImage(pickedImage, for: .normal)
            chooseButton.contentMode = .scaleAspectFill
            chooseButton.clipsToBounds = true
        }
        
        dismiss(animated: true, completion: nil)
    }
}


