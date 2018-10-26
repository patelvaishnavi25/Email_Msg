//
//  ViewController.swift
//  EmailAndMessageSendingSwift
//
//  Created by MACOS on 7/5/17.
//  Copyright © 2017 MACOS. All rights reserved.
//

import UIKit
import Messages
import MessageUI

class ViewController: UIViewController,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnmail(_ sender: Any) {
        
        if MFMailComposeViewController.canSendMail() {
            
            let mail = MFMailComposeViewController();
            mail.mailComposeDelegate = self;
            mail.setToRecipients(["mansi0074@gmail.com"]);
            mail.setSubject("Tops Demo");
            mail.setMessageBody("<p>Welcome to Tops!</p>", isHTML: true);
            
            present(mail, animated: true);
        }
        else
        {
            // show failure alert
        }
    }
    
    @IBAction func btnmsg(_ sender: Any) {
        
        if MFMessageComposeViewController.canSendText() {
            
            let message = MFMessageComposeViewController();
            message.messageComposeDelegate = self;
            message.recipients = ["8347006565","9662435315"];
            message.body = "Welcome to Tops!";
            
            present(message, animated: true);
        }
        else
        {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true);
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        controller.dismiss(animated: true);
    }

}

