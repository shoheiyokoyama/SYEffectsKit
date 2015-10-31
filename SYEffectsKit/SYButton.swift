//
//  SYButton.swift
//  SYEffectsKit
//
//  Created by Shohei Yokoyama on 2015/10/31.
//  Copyright © 2015年 Shohei. All rights reserved.
//

import UIKit

public class SYButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setLayer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayer() {
        
    }
}
