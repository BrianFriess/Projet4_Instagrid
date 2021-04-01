//
//  ViewSelect.swift
//  Instagrid
//
//  Created by Brian Friess on 23/03/2021.
//

import UIKit

// we create a class to manage the three buttons for the choice of the view
class ViewSelect: UIStackView {
    
    //creation of the 3 outlets for choice the view
    @IBOutlet private var buttonOne : UIButton!
    @IBOutlet private var buttonTwo : UIButton!
    @IBOutlet private var buttonThree : UIButton!

    
    enum StyleView{
          case viewOne
          case viewTwo
          case viewThree
      }
    
    //when we change the value of style, we call the function "setStyle" with style as parameter
    var style : StyleView = .viewTwo{
        didSet{
            setStyle(style)
        }
    }
    
    
    //this function changes the selection and the image of the buttons
    private func setStyle(_ style : StyleView){
        switch style{
        case .viewOne:
            //we select and deselect all the buttons
            buttonOne.isSelected = true
            buttonTwo.isSelected = false
            buttonThree.isSelected = false
            //we change the image of the button when the button is selected
            buttonOne.setImage(UIImage(named : "Selected"), for: .selected)
        case .viewTwo:
            buttonOne.isSelected = false
            buttonTwo.isSelected = true
            buttonThree.isSelected = false
            buttonTwo.setImage(UIImage(named: "Selected"), for: .selected)
        case .viewThree :
            buttonOne.isSelected = false
            buttonTwo.isSelected = false
            buttonThree.isSelected = true
            buttonThree.setImage(UIImage(named: "Selected"), for: .selected)
        }
    }


}
