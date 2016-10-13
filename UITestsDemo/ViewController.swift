//
//  ViewController.swift
//  UITestsDemo
//
//  Created by gaoqinghua on 16/10/10.
//  Copyright © 2016年 gaoqinghua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var operLabel: UILabel!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func switcherTap(sender: UISwitch) {
        operLabel.text = switcher.on ? "/" : "+"
    }
    @IBAction func calculateBtnClick(sender: UIButton) {
        guard textField1.text != textField2.text else{
            let alert = UIAlertController(title: "FBI Warning", message: "Can't same", preferredStyle: UIAlertControllerStyle.Alert)
            let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(cancelAction)
            presentViewController(alert, animated: true, completion: nil)
            return
        }
        if switcher.on {
            resultLabel.text = String().stringByAppendingFormat("%.2f", Double(textField1.text!)! / Double(textField2.text!)!)
        }else {
            resultLabel.text = String(Int(textField1.text!)! + Int(textField2.text!)!)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.keyboardType = .NumberPad
        textField2.keyboardType = .NumberPad
        button.enabled = false
        textField2.addTarget(self, action: "textChange", forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func textChange() {
        if let value = Int(textField2.text!) {
            button.enabled = value != 0
        }else {
            button.enabled = false
        }
    }


    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
    }
}

