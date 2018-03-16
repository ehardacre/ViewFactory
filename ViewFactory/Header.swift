//
//  Header.swift
//  ViewFactory
//
//  Created by Ethan Hardacre on 3/15/18.
//  Copyright © 2018 Ethan Hardacre. All rights reserved.
//

import Foundation
import MessageUI
import UIKit

class Header : UIView , MFMailComposeViewControllerDelegate{
    
    var emailButton : UIButton = UIButton()
    var emailContents : String = ""
    var button_width : CGFloat = 30
    var interface : Interface?
    
    init() {
        self.interface = nil
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    init(frame: CGRect, interface : Interface) {
        self.interface = interface
        super.init(frame: frame)
        init_email_button()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func init_email_button(){
        emailButton = UIButton(frame: CGRect(x: self.frame.width - button_width - (self.frame.height - button_width)/2, y: (self.frame.height - button_width)/2, width: button_width, height: button_width))
        emailButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        emailButton.layer.cornerRadius = button_width/5
        emailButton.addTarget(self, action: #selector(sendEmail), for: .touchUpInside)
        self.addSubview(emailButton)
    }
    
    func sendEmail(){
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        // Configure the fields of the interface.
        composeVC.setToRecipients(["hardacre.ethan@gmail.com"])
        composeVC.setSubject("APP FOR")
        setContent()
        composeVC.setMessageBody(emailContents, isHTML: false)
        // Present the view controller modally.
        interface!.present(composeVC, animated: true, completion: nil)
        
    }
    
    @nonobjc func mailComposeController(controller: MFMailComposeViewController,
                               didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        // Check the result or perform other tasks.
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    
    func test_email(){
        setContent()
        print(emailContents)
    }
    
    func setContent(){
        emailContents = interface!.manager.code.finalize()
    }
    
}
