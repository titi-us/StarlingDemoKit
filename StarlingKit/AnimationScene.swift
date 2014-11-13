
//
//  AnimationScene.swift
//  StarlingKit
//
//  Created by Thibaut Crenn on 11/12/14.
//  Copyright (c) 2014 Thibaut Crenn. All rights reserved.
//

import Foundation
import SpriteKit

class AnimationScene:BaseScene {
    
    
    let image:SKSpriteNode
    let button:Button
    let label:SKLabelNode
    
    let actions:[SKAction] = []
    var index:Int = 0
    
    override init()
    {
        button = Button(texture: SKTexture(imageNamed: "button_normal"), title: "Start Animation")
        image = SKSpriteNode(imageNamed: "starling_front")
        label = SKLabelNode(text: "")
        
        var moveAction:SKAction = SKAction.moveByX(10, y: 20, duration: 2)
        
        var rotateAction:SKAction = SKAction.rotateByAngle(1.5, duration: 1)
        
        var scaleAction:SKAction = SKAction.scaleTo(1.5, duration: 0.2)
        var scaleDownAction:SKAction = SKAction.scaleTo(1, duration: 0.7)
        
        let foreverAction = SKAction.repeatActionForever(SKAction.sequence([scaleAction, scaleDownAction]))

        actions = [moveAction, rotateAction, foreverAction]
        
        super.init()
        
        button.position.x = button.frame.width / 2;
        button.position.y = -240 + 20;

        
        self.addChild(button)
        self.addChild(image)
        label.position.y = button.position.y + 40;
        
        self.addChild(label)
        
        self.userInteractionEnabled = true

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
                        onStartButtonTriggered()
                        break
                    } else
                    {
                        self.parent?.touchesBegan(touches, withEvent: event)
                    }
                }
            }
        }
    }

    
    private func resetEgg() {
        image.position.x = 20
        image.position.y = 100
        image.xScale = 1.0
        image.yScale = 1.0
        image.zRotation = 0.0
        image.removeAllActions()
    }

    private func onStartButtonTriggered() {
        
        resetEgg()
        label.text = index.description
        image.runAction(actions[index]);
        index = (index+1) % (actions.count)
    }
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}