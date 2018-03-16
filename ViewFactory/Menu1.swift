//
//  Menu1.swift
//  ViewFactory
//
//  Created by Ethan Hardacre on 3/14/18.
//  Copyright © 2018 Ethan Hardacre. All rights reserved.
//

import Foundation
import UIKit

class Menu1 : Element {
    
    var color_base = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    var menuOpen = false
    
    var dimmingView = UIView()
    
    var mock : UIView = UIView()
    var button : UIButton = UIButton()
    var view_width: CGFloat = 0,
        view_height: CGFloat = 0,
        menu_vertical_buffer : CGFloat = 0,
        menu_width : CGFloat = 0,
        button_vertical_buffer : CGFloat = 0,
        button_width : CGFloat = 0
    var pi = CGFloat(Double.pi)
    
    
    required init(mock: UIView) {
        super.init(mock: mock)
        self.mock = mock
        init_dims()
        init_menu()
        init_button()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func init_dims(){
        view_width = mock.frame.width
        view_height = mock.frame.height
        menu_vertical_buffer = CGFloat(floor(Double(view_height/17.5)))
        menu_width = CGFloat(floor(Double(view_width/2.67)))
        button_vertical_buffer = CGFloat(floor(Double(menu_vertical_buffer/3.6)))
        button_width = menu_width - CGFloat(floor(Double(menu_width/7)))
    }
    
    func init_menu(){
        self.frame = CGRect(x: mock.frame.width,
                            y: menu_vertical_buffer,
                            width: menu_width,
                            height: mock.frame.height - 2*(menu_vertical_buffer))
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        dimmingView = UIView(frame: CGRect(x: 0, y: 0, width: mock.frame.width, height: mock.frame.height))
    
    }
    
    func init_button(){
        button = UIButton(frame: CGRect(x: mock.frame.width - menu_width,
                                        y: mock.frame.height - (menu_vertical_buffer + (2 * button_vertical_buffer)),
                                        width: button_width,
                                        height: menu_vertical_buffer))
        button.backgroundColor = color_base
        button.layer.cornerRadius = button.frame.height/2
        button.addTarget(self, action: #selector(changeMenuState), for: .touchUpInside)
        mock.addSubview(button)
    }
    
    dynamic func changeMenuState(){
        if menuOpen {
            UIView.animate(withDuration: 0.1, animations: {
                self.frame = CGRect(x: self.mock.frame.width,
                                   y: self.menu_vertical_buffer,
                                   width: self.menu_width,
                                   height: self.mock.frame.height - 2*(self.menu_vertical_buffer))
                self.dimmingView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.0)
            })
            dimmingView.removeFromSuperview()
            self.menuOpen = false
        }else{
            mock.addSubview(dimmingView)
            UIView.animate(withDuration: 0.1, animations: {
                self.frame = CGRect(x: self.mock.frame.width - self.menu_width,
                                    y: self.menu_vertical_buffer,
                                    width: self.menu_width,
                                    height: self.mock.frame.height - 2*(self.menu_vertical_buffer))
                self.dimmingView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.5)
            })
            self.menuOpen = true
            mock.bringSubview(toFront: self)
            mock.bringSubview(toFront: button)
        }
    }
    
    override func className() -> String {
        return "Menu1"
    }
    
    override func get_Param() -> String {
        let parameters : String = "Menu 1 Parameters    "
        return parameters
    }
    
    override func get_Init() -> String {
        return "Menu 1 Initializers     "
    }
    
    override func get_Class() -> String {
        return "Menu 1 Class    "
    }
    
    override func removeFromSuperview() {
        button.removeFromSuperview()
        super.removeFromSuperview()
    }
    
    override func draw(_ rect: CGRect) {
        let BR = CGPoint(x: frame.width,
                         y: frame.height)
        let TR = CGPoint(x: frame.width,
                         y: 0.0)
        let anchorOne = CGPoint(x: BR.x - menu_vertical_buffer,
                                y: BR.y)
        let anchorTwo = CGPoint(x: 0.0 + menu_vertical_buffer,
                                y: BR.y - (2*menu_vertical_buffer))
        let anchorThree = CGPoint(x: 0.0 + menu_vertical_buffer ,
                                  y: 0.0 + (2*menu_vertical_buffer))
        let anchorFour = CGPoint(x: TR.x - menu_vertical_buffer,
                                 y: 0.0)
        
        let path = UIBezierPath()
        path.move(to: BR)
        path.addArc(withCenter: anchorOne,
                    radius: menu_vertical_buffer,
                    startAngle: 0,
                    endAngle: 3*pi/2,
                    clockwise: false)
        path.addLine(to: CGPoint(x: anchorTwo.x,
                                 y: anchorTwo.y + 38))
        path.addArc(withCenter: anchorTwo,
                    radius: menu_vertical_buffer,
                    startAngle: 3*pi/2,
                    endAngle: pi,
                    clockwise: true)
        path.addLine(to: CGPoint(x: 0.0,
                                 y: anchorThree.y))
        path.addArc(withCenter: anchorThree,
                    radius: menu_vertical_buffer,
                    startAngle: pi,
                    endAngle: 3*pi/2,
                    clockwise: true)
        path.addLine(to: CGPoint(x: anchorFour.x,
                                 y: anchorFour.y + menu_vertical_buffer))
        path.addArc(withCenter: anchorFour,
                    radius: menu_vertical_buffer,
                    startAngle: pi/2,
                    endAngle: 0.0,
                    clockwise: false)
        path.close()
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        path.fill()
    }

    
    
    
    
}
