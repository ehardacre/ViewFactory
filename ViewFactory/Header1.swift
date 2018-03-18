//
//  Header1.swift
//  ViewFactory
//
//  Created by Ethan Hardacre on 3/16/18.
//  Copyright © 2018 Ethan Hardacre. All rights reserved.
//

import Foundation
import UIKit

class Header1: Element {
    
    var color_base = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    var font_color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var font_size : CGFloat = 20
    var font_name = "avenir"
    var title = "Title"
    
    var mock : UIView = UIView()
    var header_height : CGFloat = 0,
        view_height : CGFloat = 0,
        view_width : CGFloat = 0,
        label_width : CGFloat = 0,
        label_horizontal_buffer : CGFloat = 0,
        label_vertical_buffer : CGFloat = 0,
        label_height : CGFloat = 0
    
    /*
     Initializer from Element
     */
    required init(mock : UIView) {
        super.init(mock: mock)
        self.mock = mock
        init_dims()
        init_header()
    }
    
    /*
     Initializes the dimensions in this class
     */
    func init_dims(){
        view_width = mock.frame.width
        view_height = mock.frame.width
        header_height = CGFloat(floor(Double(view_height/5)))
        label_horizontal_buffer = CGFloat(floor(Double(view_width/5)))
        label_width = CGFloat(floor(Double(view_width - (2 * label_horizontal_buffer))))
        label_vertical_buffer = CGFloat(floor(Double(view_height/5)))
        label_height = CGFloat(floor(Double(header_height - (2 * label_vertical_buffer))))
    }
    
    /*
     Initializes the views in this class
     */
    func init_header(){
        self.frame = CGRect(x: 0, y: 0, width: view_height, height: header_height)
        self.backgroundColor = color_base
        
        var title_label = UILabel(frame: CGRect(x: label_horizontal_buffer, y: label_vertical_buffer,
                                                width: label_width, height: label_height))
        title_label.text = title
        title_label.textColor = font_color
        title_label.textAlignment = .center
        title_label.font = UIFont(name: font_name, size: font_size)
        self.addSubview(title_label)
        
        mock.addSubview(self)
    }
    
    /*
     Returns the name of this class
     */
    override func className() -> String {
        return "Header1"
    }
    
    /*
     returns the code for the parameters of this class
     */
    override func get_Param() -> String {
        let parameters : String = "Header 1 Parameters  "
        return parameters
    }
    
    /*
     returns the code of the initializers of this class
     */
    override func get_Init() -> String {
        return "Header 1 Initializers   "
    }
    
    /*
     returns the code of the class
     */
    override func get_Class() -> String {
        return "Header 1 Class  "
    }
    
    /*
     required initializer only called upon .nib files
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
