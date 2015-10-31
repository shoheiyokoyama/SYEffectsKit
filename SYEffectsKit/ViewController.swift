//
//  ViewController.swift
//  SYEffectsKit
//
//  Created by Shohei Yokoyama on 2015/10/31.
//  Copyright © 2015年 Shohei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
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
    
    let backgroundAnimationLabel = SYLabel()
    let textAnimationLabel = SYLabel()
    let borderAnimationLabel = SYLabel()
    let borderWithLightAnimationLabel = SYLabel()
    let rippleAnimationLabel = SYLabel()
    
    let borderAnimationTextField = SYTextField()
    let borderWithLightAnimationTextField = SYTextField()
    let rippleWithLightAnimationTextField = SYTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func setup() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.borderAnimationButton.frame = CGRectMake(10, 30, 150, 40)
        self.borderAnimationButton.setTitle("Border", forState: .Normal)
        self.borderAnimationButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.borderAnimationButton.buttonColor = UIColor.clearColor()
        self.borderAnimationButton.animationBorderColor = UIColor.SunsetOrange()
        self.borderAnimationButton.addTarget(self, action: "borderAnimation:", forControlEvents: .TouchUpInside)
        self.borderAnimationButton.syButtonAnimation = .Border
        self.view.addSubview(self.borderAnimationButton)
        
        self.borderWithLightAnimationButton.frame = CGRectMake(170, 30, 150, 40)
        self.borderWithLightAnimationButton.setTitle("BorderWithLight", forState: .Normal)
        self.borderWithLightAnimationButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.borderWithLightAnimationButton.buttonColor = UIColor.clearColor()
        self.borderWithLightAnimationButton.animationBorderColor = UIColor.MediumTurquoise()
        self.borderWithLightAnimationButton.addTarget(self, action: "borderWithLightAnimation:", forControlEvents: .TouchUpInside)
        self.borderWithLightAnimationButton.syButtonAnimation = .BorderWithLight
        self.view.addSubview(self.borderWithLightAnimationButton)
        
        self.backgroundAnimationButton.frame = CGRectMake(10, 80, 150, 40)
        self.backgroundAnimationButton.setTitle("Background", forState: .Normal)
        self.backgroundAnimationButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.backgroundAnimationButton.animationBackgroundColor = UIColor.RebeccaPurple()
        self.backgroundAnimationButton.buttonColor = UIColor.clearColor()
        self.backgroundAnimationButton.addTarget(self, action: "backgroundAnimation:", forControlEvents: .TouchUpInside)
        self.backgroundAnimationButton.syButtonAnimation = .Background
        self.view.addSubview(self.backgroundAnimationButton)
        
        self.textAnimationButton.frame = CGRectMake(170, 80, 150, 40)
        self.textAnimationButton.setTitle("Text", forState: .Normal)
        self.textAnimationButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.textAnimationButton.buttonColor = UIColor.AliceBlue()
        self.textAnimationButton.animationTextColor = UIColor.Wistful()
        self.textAnimationButton.addTarget(self, action: "textAnimation:", forControlEvents: .TouchUpInside)
        self.textAnimationButton.syButtonAnimation = .Text
        self.view.addSubview(self.textAnimationButton)
        
        self.rippleAnimationButton.frame = CGRectMake(10, 150, 150, 40)
        self.rippleAnimationButton.setTitle("Ripple", forState: .Normal)
        self.rippleAnimationButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.rippleAnimationButton.buttonColor = UIColor.AquaIsland()
        self.rippleAnimationButton.addTarget(self, action: "rippleAnimation:", forControlEvents: .TouchUpInside)
        self.rippleAnimationButton.syButtonAnimation = .Ripple
        self.view.addSubview(self.rippleAnimationButton)
        
        self.textAnimationLabel.frame = CGRectMake(40, 200, 100, 40)
        self.textAnimationLabel.text = "LABEL TEXT"
        self.textAnimationLabel.animationTextColor = UIColor.WaxFlower()
        self.textAnimationLabel.syLabelAnimation = .Text
        self.textAnimationLabel.startAnimation()
        self.view.addSubview(textAnimationLabel)
        
        self.backgroundAnimationLabel.frame = CGRectMake(200, 200, 170, 40)
        self.backgroundAnimationLabel.text = "LABEL Background"
        self.backgroundAnimationLabel.animationBackgroundColor = UIColor.SanMarino()
        self.backgroundAnimationLabel.syLabelAnimation = .Background
        self.backgroundAnimationLabel.startAnimation()
        self.view.addSubview(self.backgroundAnimationLabel)
        
        self.borderAnimationLabel.frame = CGRectMake(20, 250, 140, 40)
        self.borderAnimationLabel.text = "LABEL Border"
        self.borderAnimationLabel.layer.cornerRadius = 5.0 // TODO
        self.borderAnimationLabel.animationBorderColor = UIColor.SanMarino()
        self.borderAnimationLabel.syLabelAnimation = .Border
        self.borderAnimationLabel.startAnimation()
        self.view.addSubview(self.borderAnimationLabel)
        
        self.borderWithLightAnimationLabel.frame = CGRectMake(180, 150, 190, 40)
        self.borderWithLightAnimationLabel.text = "Label BorderWithLight"
        self.borderWithLightAnimationLabel.layer.cornerRadius = 5.0 // TODO
        self.borderWithLightAnimationLabel.animationBorderColor = UIColor.SanMarino()
        self.borderWithLightAnimationLabel.syLabelAnimation = .BorderWithLight
        self.borderWithLightAnimationLabel.startAnimation()
        self.view.addSubview(self.borderWithLightAnimationLabel)
        
        self.rippleAnimationLabel.frame = CGRectMake(180, 250, 190, 40)
        self.rippleAnimationLabel.text = "Label Ripple"
        self.rippleAnimationLabel.labelColor = UIColor.Snuff()
        self.rippleAnimationLabel.animationRippleColor = UIColor.ChestnutRose()
        self.rippleAnimationLabel.syLabelAnimation = .Ripple
        self.rippleAnimationLabel.startAnimation()
        self.view.addSubview(self.rippleAnimationLabel)
        
        self.borderAnimationTextField.frame = CGRectMake(20, 300, 150, 40)
        self.borderAnimationTextField.delegate = self
        self.borderAnimationTextField.syTextFieldAnimation = .Border
        self.borderAnimationTextField.animationBorderColor = UIColor.ChestnutRose()
        self.borderAnimationTextField.startAnimation()
        self.view.addSubview(borderAnimationTextField)
        
        self.rippleWithLightAnimationTextField.frame = CGRectMake(200, 300, 150, 40)
        self.rippleWithLightAnimationTextField.delegate = self
        self.rippleWithLightAnimationTextField.syTextFieldAnimation = .Ripple
        self.rippleWithLightAnimationTextField.animationRippleColor = UIColor.AliceBlue()
        self.rippleWithLightAnimationTextField.startAnimation()
        self.view.addSubview(rippleWithLightAnimationTextField)
        
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
    
    //MARK: - UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }


}

