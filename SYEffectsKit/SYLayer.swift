//
//  SYLayer.swift
//  SYEffectsKit
//
//  Created by Shohei Yokoyama on 2015/10/31.
//  Copyright © 2015年 Shohei. All rights reserved.
//

import UIKit

public enum SYLayerAnimation {
    case Border
    case BorderWithLight
    case Background
    case Text
}

public class SYLayer {
    
    private var superLayer: CALayer!
    private var textLayer = CATextLayer()
    
    private var borderColorAnimtion = CABasicAnimation()
    private var borderWidthAnimation = CABasicAnimation()
    private var shadowAnimation = CABasicAnimation()
    private var backgroundColorAnimation = CABasicAnimation()
    private var textColorAnimation = CABasicAnimation()
    
    public var animationBorderColor = UIColor.blackColor() {
        didSet {
            self.borderColorAnimtion.toValue = self.animationBorderColor.CGColor
            self.animationShadowColor = animationBorderColor
        }
    }
    public var animationTextColor = UIColor.redColor() {
        didSet {
            self.textColorAnimation.toValue = self.animationTextColor.CGColor
        }
    }
    public var animationBackgroundColor = UIColor.blackColor() {
        didSet {
            self.backgroundColorAnimation.toValue = self.animationBackgroundColor.CGColor
        }
    }
    public var animationShadowColor = UIColor.blackColor() {
        didSet {
            self.superLayer.shadowColor = self.animationShadowColor.CGColor
        }
    }
    
    public var animationDuration: CFTimeInterval = 1.0
    
    public var textColor = UIColor()
    public var backgroundColor = UIColor.clearColor() {
        didSet {
            self.superLayer.backgroundColor = self.backgroundColor.CGColor
        }
    }
    
    public var borderWidth: CGFloat = 0.0 {
        didSet {
            self.superLayer.borderWidth = self.borderWidth
        }
    }
    
    public var borderColor = UIColor.clearColor() {
        didSet {
            self.superLayer.borderColor = self.borderColor.CGColor
        }
    }
    
    public var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.superLayer.shadowRadius = self.shadowRadius
        }
    }
    
    public var shadowOpacity: Float = 0.0 {
        didSet {
            self.superLayer.shadowOpacity = self.shadowOpacity
        }
    }
    
    public var shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
        didSet {
            self.superLayer.shadowOffset = self.shadowOffset
        }
    }
    
    public init(superLayer: CALayer) {
        self.superLayer = superLayer
        
        self.setLayer()
    }
    
    private func setLayer() {
        self.superLayer.shadowColor = self.animationShadowColor.CGColor
        self.superLayer.borderColor = self.borderColor.CGColor
        
        self.superLayer.borderWidth = self.borderWidth
        
        self.clearSuperLayerShadow()
    }
    
    public func setTextLayer(textLayer: CATextLayer) {
        self.textLayer = textLayer
        self.superLayer.addSublayer(self.textLayer)
    }
    
    private func clearSuperLayerShadow() {
        self.superLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.superLayer.shadowRadius = 0.0
        self.superLayer.shadowOpacity = 0.0
    }
    
    public var syLayerAnimation: SYLayerAnimation = .Border {
        didSet {
            switch syLayerAnimation {
            case .Border:
                self.setBorderAnimation()
            case .BorderWithLight:
                self.setBorderWithLightAnimation()
            default:
                return
                
            }

        }
    }
    
    private func setBorderAnimation() {
        self.setBorderColorAnimation()
        self.setBorderWidthAnimation(0.0, toValue: 1.0)
    }
    
    private func setBorderWithLightAnimation() {
        self.setBorderColorAnimation()
        self.setShadowAnimation(0.0, toValue: 0.5)
        self.setBorderWidthAnimation(0.0, toValue: 0.6)
    }
    
    private func setBorderColorAnimation() {
        borderColorAnimtion = CABasicAnimation(keyPath: "borderColor")
        borderColorAnimtion.fromValue = UIColor.clearColor().CGColor
        borderColorAnimtion.toValue = self.animationBorderColor.CGColor
//        self.superLayer.borderColor = self.animationBorderColor.CGColor
    }
    
    private func setBorderWidthAnimation(fromValue: CGFloat, toValue: CGFloat) {
        borderWidthAnimation = CABasicAnimation(keyPath: "borderWidth")
        borderWidthAnimation.fromValue = fromValue
        borderWidthAnimation.toValue = toValue
//        self.superLayer.borderWidth = toValue
    }
    
    private func setShadowAnimation(fromValue: Float, toValue: Float) {
        shadowAnimation = CABasicAnimation(keyPath: "shadowOpacity")
        shadowAnimation.fromValue = fromValue
        shadowAnimation.toValue = toValue
        self.superLayer.shadowOpacity = toValue
    }
    
    public func startAnimation() {
        switch syLayerAnimation {
            
        case .Border:
            self.animateBorderOrBorderWithLight()
        case .BorderWithLight:
            self.animateBorderOrBorderWithLight()
        case .Background:
            self.animateBackground()
        case .Text:
            self.animateText()
        }
    }
    
    public func stopAnimation() {
        self.superLayer.removeAllAnimations()
        self.textLayer.removeAllAnimations()
        
        self.clearSuperLayerShadow()
        self.superLayer.backgroundColor = self.backgroundColor.CGColor
        self.textLayer.foregroundColor = self.textColor.CGColor
    }
    
    public func animateBorderOrBorderWithLight() {
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = self.animationDuration
        groupAnimation.animations = [borderColorAnimtion, borderWidthAnimation]
        groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        groupAnimation.delegate = self
        groupAnimation.autoreverses = true
        groupAnimation.repeatCount = 1e100
        syLayerAnimation == .BorderWithLight ? self.animateBorderWithLight(groupAnimation) : self.superLayer.addAnimation(groupAnimation, forKey: "Border")
    }
    
    private func animateBorderWithLight(groupAnimation: CAAnimationGroup) {
        self.superLayer.backgroundColor = UIColor.whiteColor().CGColor
        self.superLayer.shadowRadius = 5.0
        groupAnimation.animations?.append(shadowAnimation)
        self.superLayer.addAnimation(groupAnimation, forKey: "LightBorder")
    }
    
    private func animateBackground() {
//        self.clearSupeLayerBorder()
//        self.clearSuperLayerShadow()
        
        self.backgroundColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        self.backgroundColorAnimation.fromValue = UIColor.clearColor().CGColor
        self.backgroundColorAnimation.toValue = self.animationBackgroundColor.CGColor
        self.superLayer.backgroundColor = self.animationBackgroundColor.CGColor
        self.backgroundColorAnimation.duration = self.animationDuration
        self.backgroundColorAnimation.autoreverses = true
        self.backgroundColorAnimation.repeatCount = 1e100
        self.backgroundColorAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        self.superLayer.addAnimation(backgroundColorAnimation, forKey: "Background")
    }
    
    private func animateText() {
        self.textColorAnimation = CABasicAnimation(keyPath: "foregroundColor")
        self.textColorAnimation.duration = self.animationDuration
        self.textColorAnimation.autoreverses = true
        self.textColorAnimation.repeatCount = 1e100
        self.textColorAnimation.fromValue = UIColor.clearColor().CGColor
        self.textColorAnimation.toValue = self.animationTextColor.CGColor
        self.textLayer.foregroundColor = self.animationTextColor.CGColor
        self.textLayer.addAnimation(textColorAnimation, forKey: "TextColor")
    }
    
    
}
