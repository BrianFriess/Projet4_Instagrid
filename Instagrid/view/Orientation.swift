//
//  Style.swift
//  Instagrid
//
//  Created by Brian Friess on 29/03/2021.
//

import Foundation

struct Orientation{
        
    enum Style {
        case portait, landscape
        
        var text : String{
            switch self{
            case .portait:
                return "Swipe up to share"
            case .landscape:
                return "Swipe left to share"
            }
        }
    }

    mutating func setUpOrientation(isLandscape : Bool){
        if isLandscape{
            orientation = Style.landscape
        }else{
            orientation = Style.portait
        }
        let name = Notification.Name(rawValue: "returnOrientation")
        NotificationCenter.default.post(name: name, object: orientation , userInfo: nil)
    }
    
    
    private var orientation : Style = .portait
}
