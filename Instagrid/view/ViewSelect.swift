//
//  ViewSelect.swift
//  Instagrid
//
//  Created by Brian Friess on 23/03/2021.
//

import UIKit

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
    
    
    var style : StyleView = .viewTwo{
        didSet{
            setStyle(style)
        }
    }
    
    
    
    private func setStyle(_ style : StyleView){
        switch style{
        case .viewOne:
            buttonOne.isSelected = true
            buttonTwo.isSelected = false
            buttonThree.isSelected = false
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
