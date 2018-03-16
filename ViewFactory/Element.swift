//
//  Element.swift
//  ViewFactory
//
//  Created by Ethan Hardacre on 3/13/18.
//  Copyright © 2018 Ethan Hardacre. All rights reserved.
//

import Foundation
import UIKit

class Element : UIView {
    
    enum vertical_position {
        case top
        case middle
        case bottom
    }
    
    enum horizontal_position {
        case left
        case middle
        case right
    }
    
    required init(mock : UIView) {
        super.init(frame: mock.frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func className() -> String {
        return ""
    }
    
    func get_Param() -> String {
        return ""
    }
    
    func get_Init() -> String {
        return ""
    }
    
    func get_Class() -> String {
        return ""
    }
    
    
    
}
