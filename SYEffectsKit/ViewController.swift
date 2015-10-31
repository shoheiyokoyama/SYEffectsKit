//
//  ViewController.swift
//  SYEffectsKit
//
//  Created by Shohei Yokoyama on 2015/10/31.
//  Copyright © 2015年 Shohei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let borderAnimationButton = SYButton()
    let borderWithLightAnimationButton = SYButton()
    let backgroundAnimationButton = SYButton()
    let textAnimationButton = SYButton()
    let rippleAnimationButton = SYButton()
    
    var isBorderAnimating: Bool = false
    var isBorderWithLightAnimating: Bool = false
    var isBackgroundAnimating: Bool = false
    var isTextAnimating: Bool = false
    var isRippleAnimating: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func setup() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.borderAnimationButton.frame = CGRectMake(120, 70, 150, 40)
        self.borderAnimationButton.setTitle("Border", forState: .Normal)
        self.borderAnimationButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.borderAnimationButton.buttonColor = UIColor.clearColor()
        self.borderAnimationButton.addTarget(self, action: "borderAnimation:", forControlEvents: .TouchUpInside)
        self.borderAnimationButton.syButtonAnimation = .Border
        self.view.addSubview(self.borderAnimationButton)
        
        self.borderWithLightAnimationButton.frame = CGRectMake(120, 120, 150, 40)
        self.borderWithLightAnimationButton.setTitle("BorderWithLight", forState: .Normal)
        self.borderWithLightAnimationButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.borderWithLightAnimationButton.buttonColor = UIColor.clearColor()
        self.borderWithLightAnimationButton.addTarget(self, action: "borderWithLightAnimation:", forControlEvents: .TouchUpInside)
        self.borderWithLightAnimationButton.syButtonAnimation = .BorderWithLight
        self.view.addSubview(self.borderWithLightAnimationButton)
        
        self.backgroundAnimationButton.frame = CGRectMake(120, 170, 150, 40)
        self.backgroundAnimationButton.setTitle("Background", forState: .Normal)
        self.backgroundAnimationButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.backgroundAnimationButton.buttonColor = UIColor.clearColor()
        self.backgroundAnimationButton.addTarget(self, action: "backgroundAnimation:", forControlEvents: .TouchUpInside)
        self.backgroundAnimationButton.syButtonAnimation = .Background
        self.view.addSubview(self.backgroundAnimationButton)
        
        self.textAnimationButton.frame = CGRectMake(120, 220, 150, 40)
        self.textAnimationButton.setTitle("Text", forState: .Normal)
        self.textAnimationButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.textAnimationButton.buttonColor = UIColor.clearColor()
        self.textAnimationButton.addTarget(self, action: "textAnimation:", forControlEvents: .TouchUpInside)
        self.textAnimationButton.syButtonAnimation = .Text
        self.view.addSubview(self.textAnimationButton)
        
        self.rippleAnimationButton.frame = CGRectMake(120, 270, 150, 40)
        self.rippleAnimationButton.setTitle("Ripple", forState: .Normal)
        self.rippleAnimationButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.rippleAnimationButton.buttonColor = UIColor.clearColor()
        self.rippleAnimationButton.addTarget(self, action: "rippleAnimation:", forControlEvents: .TouchUpInside)
        self.rippleAnimationButton.syButtonAnimation = .Ripple
        self.view.addSubview(self.rippleAnimationButton)
    }
    
    internal func borderAnimation(sender: SYButton) {
        
        if !isBorderAnimating {
            self.borderAnimationButton.startAnimation()
            isBorderAnimating = true
        } else {
            self.borderAnimationButton.stopAnimation()
            isBorderAnimating = false
        }
    }
    
    internal func borderWithLightAnimation(sender: SYButton) {
        
        if !isBorderWithLightAnimating {
            self.borderWithLightAnimationButton.startAnimation()
            isBorderWithLightAnimating = true
        } else {
            self.borderWithLightAnimationButton.stopAnimation()
            isBorderWithLightAnimating = false
        }
    }
    
    internal func backgroundAnimation(sender: SYButton) {
        
        if !isBackgroundAnimating {
            self.backgroundAnimationButton.startAnimation()
            isBackgroundAnimating = true
        } else {
            self.backgroundAnimationButton.stopAnimation()
            isBackgroundAnimating = false
        }
    }
    
    internal func textAnimation(sender: SYButton) {
        
        if !isTextAnimating {
            self.textAnimationButton.startAnimation()
            isTextAnimating = true
        } else {
            self.textAnimationButton.stopAnimation()
            isTextAnimating = false
        }
    }
    
    internal func rippleAnimation(sender: SYButton) {
        
        if !isRippleAnimating {
            self.rippleAnimationButton.startAnimation()
            isRippleAnimating = true
        } else {
            self.rippleAnimationButton.stopAnimation()
            isRippleAnimating = false
        }
    }


}

