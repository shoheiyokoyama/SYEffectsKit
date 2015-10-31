//
//  ViewController.swift
//  SYEffectsKit
//
//  Created by Shohei Yokoyama on 2015/10/31.
//  Copyright © 2015年 Shohei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button = SYButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func setup() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        button.frame = CGRectMake(90, 500, 170, 50)
        button.backgroundColor = UIColor.blueColor()
        button.setTitle("TEXT", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.view.addSubview(button)
    }


}

