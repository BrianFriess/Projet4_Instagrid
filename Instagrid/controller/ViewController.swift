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
    var orientation = Orientation()
    var isLandscape = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view(.choiceTwo)
        
        //we create the GestureRecognizer "swipe up" with ChoiceView
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeViewUp(_:)))
        swipeUp.direction = .up
        choiceView.addGestureRecognizer(swipeUp)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeViewLeft(_:)))
        swipeLeft.direction = .left
        choiceView.addGestureRecognizer(swipeLeft)
        
        
        let name = Notification.Name(rawValue: "returnOrientation")
        NotificationCenter.default.addObserver(self, selector: #selector(SetOrientation), name: name, object: nil)
        
        
     }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        changeOrientation()
    }
    
    
    
    func changeOrientation(){
        orientation.setUpOrientation(isLandscape: UIDevice.current.orientation.isLandscape == true)
    }
    
    
    
    @objc func SetOrientation(_ notification : Notification){
        guard let changeOrientation = notification.object as? Orientation.Style else {return}
        labelText.text = changeOrientation.text
        if changeOrientation == .landscape{
            isLandscape = true
        }else{
            isLandscape = false
        }
    }

    
    //this function animates choiceView to go up and call the function activityView
    @objc private func swipeViewUp(_ sender: UISwipeGestureRecognizer) {
        if isLandscape == false{
            let screenHeight = UIScreen.main.bounds.height
            let translationUp = CGAffineTransform(translationX:0, y: -screenHeight)
            UIView.animate(withDuration: 0.5) {
                self.choiceView.transform = translationUp
                self.labelText.transform = translationUp
                self.arrowUp.transform = translationUp
            } completion: { (success )in
                self.activityView()
            }
        }
    }
    
    
    @objc private func swipeViewLeft(_ sender: UISwipeGestureRecognizer) {
        if isLandscape == true{
            let screenWidth = UIScreen.main.bounds.width
            let translationUp = CGAffineTransform(translationX: -screenWidth , y: 0)
            UIView.animate(withDuration: 0.5) {
                self.choiceView.transform = translationUp
                self.labelText.transform = translationUp
                self.arrowUp.transform = translationUp
            } completion: { (success )in
                self.activityView()
            }
        }
    }
    
    
    private func AnimationReturnView(){
        UIView.animate(withDuration: 0.5) {
            self.choiceView.transform = .identity
            self.labelText.transform = .identity
            self.arrowUp.transform = .identity
        }
    }
    
    
    //we call the activity view for share choiceView
   private func activityView(){
        UIGraphicsBeginImageContext(choiceView.frame.size)
        choiceView.layer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {return}
        let activityConroller = UIActivityViewController(activityItems:[image], applicationActivities: nil)
    
        activityConroller.completionWithItemsHandler = { (_, _, _, _) in
            self.AnimationReturnView()
            self.dismiss(animated: true, completion: nil)
        }
        present(activityConroller, animated: true)
        
    }
    
    
    
    
    /*// moveArrowUp and moveArrowDown functions is there to animate a floating arrow
    private func moveArrowUp(){
        if IsOnMove == false{
            let moveUp = CGAffineTransform(translationX: 0, y: -2.5)
            UIView.animate(withDuration: 0.5) {
                self.arrowUp.transform = moveUp
            } completion: { (success) in
                self.moveArrowDown()
            }
        }
    }
    
   private func moveArrowDown(){
        if IsOnMove == false{
            let moveDown = CGAffineTransform(translationX: 0, y: 2.5)
            UIView.animate(withDuration: 0.5) {
                self.arrowUp.transform = moveDown
            } completion: { (success) in
                self.moveArrowUp()
            }
        }
    }
    
    private func moveArrowLeft(){
        if IsOnMove == false{
            let moveUp = CGAffineTransform(translationX: -2.5, y:0)
            UIView.animate(withDuration: 0.5) {
                self.arrowUp.transform = moveUp
            } completion: { (success) in
                self.moveArrowRight()
            }
        }
    }
    
   private func moveArrowRight(){
        if IsOnMove == false{
            let moveDown = CGAffineTransform(translationX: 2.5, y: 0)
            UIView.animate(withDuration: 0.5) {
                self.arrowUp.transform = moveDown
            } completion: { (success) in
                self.moveArrowLeft()
            }
        }
    }*/
    
    
    
    
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


