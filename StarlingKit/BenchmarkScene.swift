//
//  BenchmarkScene.swift
//  StarlingKit
//
//  Created by Thibaut Crenn on 11/12/14.
//  Copyright (c) 2014 Thibaut Crenn. All rights reserved.
//

import Foundation
import SpriteKit

class BenchmarkScene:BaseScene, EnterFrameProtocol {
    
    
    let button:Button!
    
    private var count:Int = 0
    private var hasStarted:Bool = false
    
    override init() {
        
        super.init()
        button = Button(texture: SKTexture(imageNamed: "button_normal"), title: "Start benchmark")
        button.position.y = 240 - 20;
        button.position.x = -button.frame.width/2
        self.addChild(button)
        
        self.userInteractionEnabled = true
        
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
    
    private func onButtonTriggered() {
        addTestObjects()
        hasStarted = true;
    }
    
    func addTestObjects() {
        
        
        let padding:CGFloat = 15
        let numObjects = 10
        
        for (var i = 0; i<numObjects; i++) {
            var egg:SKSpriteNode = SKSpriteNode(imageNamed: "benchmark_object")
            egg.position.x = -160 + padding + CGFloat(arc4random_uniform(320 - 2 * Int(padding)))
            egg.position.y = -250 + padding + CGFloat(arc4random_uniform(500 - 2 * Int(padding)))
            egg.zPosition = 5
            egg.name = "eggs"
            self.addChild(egg)
        }
    }
    
    func onEnterFrame() {
        
        if (!hasStarted)
        {
            return;
        }
        
        self.enumerateChildNodesWithName("eggs", usingBlock:{
            node, stop in
            if let spriteNode = node as? SKSpriteNode
            {
                spriteNode.zRotation += 0.2
            }
            
        })
        count++;
        if (count < 50)
        {
            addTestObjects();
        }
    }
    
}