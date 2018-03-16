//
//  Interface.swift
//  ViewFactory
//
//  Created by Ethan Hardacre on 3/12/18.
//  Copyright © 2018 Ethan Hardacre. All rights reserved.
//

import Foundation
import UIKit

import UIKit

class Interface: UIViewController {
    
    let menu_types : [String] = ["Menu 1"]
    let button_types : [String] = []
    let header_types : [String] = ["Header 1"]
    let navigation_types : [String] = []
    var element_types : [String] = []
    
    var scrollView = UIScrollView()
    var scrollZero : CGFloat = 0 //This is set in the initializer
    
    var main = Categorical_Chooser()
    var mock = UIView()
    var header = Header()
    
    var manager : Manager = Manager() //an instance of the manager class
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //COMPILING ALL OF THE TYPES OF ELEMENTS
        element_types = menu_types + header_types + button_types + navigation_types
        
        //INITIALIZERS
        init_scroll()
        init_main()
        init_mock()
        init_manager()
        init_header()
        addSubviews()
    }
    
    func init_header() {
        header = Header(frame: CGRect(x: 0, y: 0, width: main.frame.width, height: 60), interface : self)
        header.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
    }
    
    func init_main(){ //Initializes the screen where the user chooses the views that will be on the screen

        main = Categorical_Chooser(frame: CGRect(x: 0,
                                                 y: 30,
                                                 width: view.frame.width,
                                                 height: view.frame.height - 30),
                                   data: element_types)
    }
    
    func init_manager() { //Initializes the manager for interface
        manager = Manager(interface: self)
        main.set_manager(mngr: manager)
        manager.main = main
        manager.mock = mock
    }
    
    func init_scroll() { //Sets up the availability to switch between the main screen and the mock screen
        scrollView = UIScrollView(frame: view.frame)
        scrollView.contentSize.width = (view.frame.width * 2)
        scrollView.isPagingEnabled = true
        scrollZero = view.frame.width
        scrollView.bounces = false;
    }
    
    func init_mock() { //Initializes the mock screen where UI elements will be added
        mock = UIView(frame: CGRect(x: scrollZero,
                                    y: 0,
                                    width: view.frame.width,
                                    height: view.frame.height))
    }
    
    func addSubviews(){ //Adds all initial subviews to the self.view
        view.addSubview(scrollView)
        scrollView.addSubview(mock)
        scrollView.addSubview(main)
        scrollView.addSubview(header)
    }
    
    
}
