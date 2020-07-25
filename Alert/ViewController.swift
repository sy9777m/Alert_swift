//
//  ViewController.swift
//  Alert
//
//  Created by Siyun Min on 2020/07/06.
//  Copyright © 2020 Siyun Min. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "1.jpg")
    let imgOff = UIImage(named: "2.jpg")
    let imgRemove = UIImage(named: "3.jpg")
    var isLampOn = true
    
    @IBOutlet var lamping: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lamping.image = imgOn
    }


    @IBAction func btnLampOn(_ sender: UIButton) {
        if(!isLampOn) {
            lamping.image = imgOn
            isLampOn = true
        } else {
            let lampOnAlert = UIAlertController(title: "Warning", message: "현재 On 상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }
    }
    @IBAction func btnLampOff(_ sender: UIButton) {
        if(isLampOn) {
            let lampOffAlert = UIAlertController(title: "Turn off lamp", message: "Do you want to turn off?", preferredStyle: UIAlertController.Style.alert)
            
            let offAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {ACTION in self.lamping.image = self.imgOff
                self.isLampOn = false
            })
            
            let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        } else {
            
        }
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "Remove lamp", message: "Do you want to remove the lamp?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "Yes, turn off.", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lamping.image = self.imgOff
            self.isLampOn = false
        })
        
        let onAction = UIAlertAction(title: "No, turn on", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lamping.image = self.imgOn
            self.isLampOn = true
        })
        
        let removeAction = UIAlertAction(title: "Yes, remove it", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lamping.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

