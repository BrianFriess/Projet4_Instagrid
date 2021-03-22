//
//  Layout.swift
//  Instagrid
//
//  Created by Brian Friess on 20/03/2021.
//

import UIKit

class ChoiceView : UIView {
    


    @IBOutlet private var collectionView : [UIView]!

    
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
            collectionView[0].isHidden = true
            collectionView[1].isHidden = true
            collectionView[2].isHidden = true
            collectionView[3].isHidden = false
            collectionView[4].isHidden = false
            collectionView[5].isHidden = false
        case .viewTwo:
            collectionView[0].isHidden = false
            collectionView[1].isHidden = false
            collectionView[2].isHidden = false
            collectionView[3].isHidden = true
            collectionView[4].isHidden = true
            collectionView[5].isHidden = true
        case .viewThree:
            collectionView[0].isHidden = false
            collectionView[1].isHidden = false
            collectionView[2].isHidden = true
            collectionView[3].isHidden = false
            collectionView[4].isHidden = false
            collectionView[5].isHidden = true
        }
        
    }
    
    
    /*@IBOutlet private var squareUpLeft : UIView!
    @IBOutlet private var squareUpRight : UIView!
    @IBOutlet private var squareDownLeft : UIView!
    @IBOutlet private var squareDownRight : UIView!
    @IBOutlet private var rectangleUp : UIView!
    @IBOutlet private var rectangleDown : UIView!*/
    
    
    /*private func setStyle(_ style : StyleView){
        switch style{
        case .viewOne:
            squareUpLeft.isHidden = true
            squareUpRight.isHidden = true
            squareDownLeft.isHidden = false
            squareDownRight.isHidden = false
            rectangleUp.isHidden = false
            rectangleDown.isHidden = true
        case .viewTwo:
            squareUpLeft.isHidden = false
            squareUpRight.isHidden = false
            squareDownLeft.isHidden = true
            squareDownRight.isHidden = true
            rectangleUp.isHidden = true
            rectangleDown.isHidden = false
        case .viewThree:
            squareUpLeft.isHidden = false
            squareUpRight.isHidden = false
            squareDownLeft.isHidden = false
            squareDownRight.isHidden = false
            rectangleUp.isHidden = true
            rectangleDown.isHidden = true
        }
        
    }*/
    

}
