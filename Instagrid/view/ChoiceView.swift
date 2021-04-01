//
//  ViewOne.swift
//  Instagrid
//
//  Created by Brian Friess on 22/03/2021.
//

import UIKit

//this class, manages the differents views to choose the pictures
class ChoiceView: UIView {

    @IBOutlet private(set) var buttonTopLeft : UIButton!
    @IBOutlet private(set) var buttonTopRight : UIButton!
    @IBOutlet private(set) var buttonDownLeft : UIButton!
    @IBOutlet private(set) var buttonDownRight : UIButton!
    
    
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
    
    //this function manages the visible or invisible views
    private func setStyle(_ style : StyleView){
        switch style{
        case .viewOne:
            buttonTopRight.isHidden = true
            buttonDownRight.isHidden = false
        case .viewTwo:
            buttonTopRight.isHidden = false
            buttonDownRight.isHidden = true
        case .viewThree :
            buttonTopRight.isHidden = false
            buttonDownRight.isHidden = false
        }
    }

}
