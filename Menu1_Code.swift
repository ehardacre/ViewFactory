//
//  ViewController.swift
//  test
//
//  Created by Ethan Hardacre on 3/15/18.
//  Copyright © 2018 Ethan Hardacre. All rights reserved.
//
//--------------------------------------------------------------------------------------------------

import UIKit

class ViewController: UIViewController {
    
//--------------------------------------------------------------------------------------------------
    
     let MENU_COLOR = UIColor.black
     let BUTTON_COLOR = UIColor.black
    
//--------------------------------------------------------------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//--------------------------------------------------------------------------------------------------
        
        var menu1 = Menu1(view: self.view, menu_color: MENU_COLOR, button_color: BUTTON_COLOR)
        self.view.addSubview(menu1)
        
//--------------------------------------------------------------------------------------------------
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//--------------------------------------------------------------------------------------------------


class Menu1 : UIView {
    
    var color_menu = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    var color_button = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    var menuOpen = false
    
    var mock : UIView = UIView()
    var button : UIButton = UIButton()
    var view_width: CGFloat = 0,
    view_height: CGFloat = 0,
    menu_vertical_buffer : CGFloat = 0,
    menu_width : CGFloat = 0,
    button_vertical_buffer : CGFloat = 0,
    button_width : CGFloat = 0
    var pi = CGFloat(Double.pi)
    
    
    required init(view: UIView, menu_color : UIColor, button_color : UIColor) {
        super.init(frame: view.frame)
        self.mock = view
        
        color_menu = menu_color
        color_button = button_color
        
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
        backgroundColor = UIColor.clear
        
    }
    
    func init_button(){
        button = UIButton(frame: CGRect(x: mock.frame.width - menu_width,
                                        y: mock.frame.height - (menu_vertical_buffer + (2 * button_vertical_buffer)),
                                        width: button_width,
                                        height: menu_vertical_buffer))
        button.backgroundColor = color_button
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
            })
            self.menuOpen = false
        }else{
            UIView.animate(withDuration: 0.1, animations: {
                self.frame = CGRect(x: self.mock.frame.width - self.menu_width,
                                    y: self.menu_vertical_buffer,
                                    width: self.menu_width,
                                    height: self.mock.frame.height - 2*(self.menu_vertical_buffer))
                
            })
            self.menuOpen = true
            mock.bringSubview(toFront: button)
        }
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
        color_menu.setFill()
        path.fill()
    }
    
}

//--------------------------------------------------------------------------------------------------
