//
//  Button.swift
//  StarlingKit
//
//  Created by Thibaut Crenn on 11/12/14.
//  Copyright (c) 2014 Thibaut Crenn. All rights reserved.
//

import Foundation
import SpriteKit

class Button: SKNode {
    
    let background:SKSpriteNode
    let label:SKLabelNode
    
    var sceneType:SceneType?
    
    init(texture:SKTexture, title:String)
    {
        background = SKSpriteNode(texture: texture)
        background.anchorPoint = CGPointMake(0.5, 0.5)
        background.position = CGPointZero

        label = SKLabelNode(text: title)
        label.fontColor = UIColor.blackColor()
        label.fontSize = 18
        label.position = CGPointZero
        label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center

        super.init()

        self.addChild(background)
        self.addChild(label)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}