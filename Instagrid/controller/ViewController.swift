//
//  ViewController.swift
//  Instagrid
//
//  Created by Brian Friess on 20/03/2021.
//

import UIKit

class ViewController: UIViewController  {

    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var choiceView: ChoiceView!
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
        buttonViewTwo(buttonTwo)
    }
    
    @IBAction func buttonViewOne(_ sender: UIButton) {
        choiceView.style = .viewOne
        buttonOne.isSelected = true
        buttonTwo.isSelected = false
        buttonThree.isSelected = false
        buttonOne.setImage(UIImage(named : "Selected"), for: .selected )
    }
    
    @IBAction func buttonViewTwo(_ sender: UIButton) {
        choiceView.style = .viewTwo
        buttonOne.isSelected = false
        buttonTwo.isSelected = true
        buttonThree.isSelected = false
        buttonTwo.setImage(UIImage(named: "Selected"), for: .selected)
    }
    
    
    @IBAction func buttonViewThree(_ sender: UIButton) {
        choiceView.style = .viewThree
        buttonOne.isSelected = false
        buttonTwo.isSelected = false
        buttonThree.isSelected = true
        buttonThree.setImage(UIImage(named: "Selected"), for: .selected)
    }
    
    
    @IBAction func buttonPlusRectangleDown(_ sender: UIButton) {
        displayPhotoLibrary()
    }
    @IBAction func ButtonPlusUpLeft(_ sender: UIButton) {
        displayPhotoLibrary()
    }
    @IBAction func buttonPlusUpRight(_ sender: UIButton) {
        displayPhotoLibrary()
    }
    @IBAction func buttonPlusDownLeft(_ sender: UIButton) {
        displayPhotoLibrary()
    }
    @IBAction func buttonPlusDownRight(_ sender: UIButton) {
        displayPhotoLibrary()
    }
    @IBAction func buttonPlusRectangleUp(_ sender: UIButton) {
        displayPhotoLibrary()
    }
    
    
    private func displayPhotoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            self.present(UIImagePickerController(), animated: true, completion: nil)
        }
    }
    

    
}


