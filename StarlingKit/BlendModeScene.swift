//
//  BlendModeScene.swift
//  StarlingKit
//
//  Created by Thibaut Crenn on 11/12/14.
//  Copyright (c) 2014 Thibaut Crenn. All rights reserved.
//

import Foundation
import SpriteKit

class BlendModeScene:BaseScene {
    
    
    private let button:Button
    private let image:SKSpriteNode
    private let label:SKLabelNode
    
    private var blendModes:[(SKBlendMode, String)] = [
        (SKBlendMode.Add, "Add"),
        (SKBlendMode.Alpha, "Alpha"),
        (SKBlendMode.Multiply, "Multiply"),
        (SKBlendMode.MultiplyX2, "Multiplyx2"),
        (SKBlendMode.Replace, "Replace"),
        (SKBlendMode.Screen, "Screen"),
        (SKBlendMode.Subtract, "Substract"),
    ]
    
    override init()
    {
        
        
        button = Button(texture:SKTexture(imageNamed:"button_normal"), title:"Switch Mode")
        button.position.x = button.frame.width / 2
        button.position.y = 240
        
        image = SKSpriteNode(imageNamed:"starling_rocket")
        image.position.x = 0
        image.position.y = 0
        image.zPosition = 10
        
        label = SKLabelNode(fontNamed: "Helvetica")
        label.position.x = 10
        label.position.y = 180
        
        super.init()
        
        self.userInteractionEnabled = true
        self.addChild(button)
        self.addChild(image)
        self.addChild(label)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        let touch = touches.anyObject() as UITouch
        let location = touch.locationInNode(self)
        let nodes = self.nodesAtPoint(location)
        
        if let myNodes = nodes as? [SKNode]
        {
            for node:SKNode in myNodes
            {
                if node is Button
                {
                    if (node as Button).sceneType == nil
                    {
                        onButtonTriggered()
                        break
                    } else
                    {
                        self.parent?.touchesBegan(touches, withEvent: event)
                    }
                }
            }
        }
    }
    
    func onButtonTriggered() {
        
        let blendInfo = blendModes.removeAtIndex(0)
        
        var (blendMode,title) = blendInfo
        blendModes.append(blendInfo)
        
        label.text = title
        image.blendMode = blendMode
        
    }
    
}