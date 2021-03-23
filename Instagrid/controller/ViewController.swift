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
    var chooseButton : UIButton!
    
    override func viewDidLoad() {
         super.viewDidLoad()
        choiceView(.choiceTwo)
     }
    
    
    enum View{
        case choiceOne, choiceTwo, choiceThree
    }
    
    func choiceView(_ choice : View){
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
    
    
    
    @IBAction func buttonViewOne(_ sender: UIButton) {
        choiceView(.choiceOne)
    }
    
    @IBAction func buttonViewTwo(_ sender: UIButton) {
        choiceView(.choiceTwo)
    }
    
    @IBAction func buttonViewThree(_ sender: UIButton) {
        choiceView(.choiceThree)
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


