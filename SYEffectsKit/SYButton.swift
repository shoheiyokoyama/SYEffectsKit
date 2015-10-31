//
//  SYButton.swift
//  SYEffectsKit
//
//  Created by Shohei Yokoyama on 2015/10/31.
//  Copyright © 2015年 Shohei. All rights reserved.
//

import UIKit

public enum SYButtonAnimation {
    case Border
    case BorderWithLight
    case Background
}

public class SYButton: UIButton {
    
    public var buttonColor: UIColor = UIColor.clearColor() {
        didSet {
            self.backgroundColor = UIColor.clearColor()
            self.syLayer.backgroundColor = buttonColor
        }
    }
    
    public lazy var syLayer: SYLayer = SYLayer(superLayer: self.layer)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setLayer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayer() {
        self.layer.cornerRadius = 5.0
        self.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        
        self.syLayer.syLayerAnimation = .Background// Default Animation
    }
    
    public var syButtonAnimation: SYButtonAnimation = .Border {
        didSet {
            switch syButtonAnimation {
            case .Border:
                self.syLayer.syLayerAnimation = .Border
            case .BorderWithLight:
                self.syLayer.syLayerAnimation = .BorderWithLight
            case .Background:
                self.syLayer.syLayerAnimation = .Background
            }
        }
    }
    
    
    public func startAnimation() {
        self.syLayer.startAnimation()
    }
    
    public func stopAnimation() {
        self.syLayer.stopAnimation()
    }
    
    
}
