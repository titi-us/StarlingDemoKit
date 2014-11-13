//
//  BaseScene.swift
//  StarlingKit
//
//  Created by Thibaut Crenn on 11/12/14.
//  Copyright (c) 2014 Thibaut Crenn. All rights reserved.
//

import Foundation
import SpriteKit

class BaseScene:SKNode {
    
    let backButton:Button
    
    override init() {
        
        backButton = Button(texture: SKTexture(imageNamed: "button_back"), title: "Back")
        backButton.sceneType = .MainSceene
        super.init()
        
        self.addChild(backButton)
        backButton.position.x = -160 - backButton.frame.width / 2;
        backButton.position.y = 240 - backButton.frame.height + 1;

    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}