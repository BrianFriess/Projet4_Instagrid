//
//  ViewController.swift
//  Instagrid
//
//  Created by Brian Friess on 20/03/2021.
//

import UIKit

class ViewController: UIViewController{

    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var choiceView: ChoiceView!
    var chooseButton : UIButton!
    

    
    

    
    override func viewDidLoad() {
         super.viewDidLoad()
         buttonViewTwo(buttonTwo)
     }
    
    
    enum View{
        case choiceOne, choiceTwo, choiceThree
    }
    
    func choiceView(_ choice : View){
        switch choice{
        case .choiceOne:
            choiceView.style = .viewOne
            buttonOne.isSelected = true
            buttonTwo.isSelected = false
            buttonThree.isSelected = false
            
        case .choiceTwo:
            choiceView.style = .viewTwo
            buttonOne.isSelected = false
            buttonTwo.isSelected = true
            buttonThree.isSelected = false

        case .choiceThree:
            choiceView.style = .viewThree
            buttonOne.isSelected = false
            buttonTwo.isSelected = false
            buttonThree.isSelected = true
        }
    }
    
    
    
    @IBAction func buttonViewOne(_ sender: UIButton) {
        choiceView(.choiceOne)
        buttonOne.setImage(UIImage(named : "Selected"), for: .selected)
    }
    
    @IBAction func buttonViewTwo(_ sender: UIButton) {
        choiceView(.choiceTwo)
        buttonTwo.setImage(UIImage(named: "Selected"), for: .selected)
    }
    
    @IBAction func buttonViewThree(_ sender: UIButton) {
        choiceView(.choiceThree)
        buttonThree.setImage(UIImage(named: "Selected"), for: .selected)
    }
    
    
    
    @IBAction func buttonTopLeft(_ sender: UIButton) {
        displayPhotoLibrary()
        chooseButton = choiceView.buttonTopLeft
    }
    
    @IBAction func buttonTopRight(_ sender: UIButton) {
        displayPhotoLibrary()
        chooseButton = choiceView.buttonTopRight
    }
    
    @IBAction func buttonDownLeft(_ sender: UIButton) {
        displayPhotoLibrary()
        chooseButton = choiceView.buttonDownLeft
    }
    
    @IBAction func buttonDownRight(_ sender: UIButton) {
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


