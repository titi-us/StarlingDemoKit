//
//  GameScene.swift
//  StarlingKit
//
//  Created by Thibaut Crenn on 11/12/14.
//  Copyright (c) 2014 Thibaut Crenn. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    var mainMenu:MainMenu?
    var currentScene:SKNode?
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        start()
    }
    
    func start() {

        let background = SKSpriteNode(imageNamed: "background")
        background.anchorPoint = CGPointMake(0.5, 0.5)
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(background);
        
        
        mainMenu = MainMenu()
        mainMenu?.position = background.position
        self.addChild(mainMenu!)
    }
    
    func showScene(sceneType:SceneType)
    {
        switch sceneType {
            case .AnimationScene:
                currentScene = AnimationScene()
            case .BenchMarkScene:
                currentScene = BenchmarkScene()
            case .FilterSceene:
                currentScene = BenchmarkScene()
            case .MaskScene:
                currentScene = BenchmarkScene()
            case .TextScene:
                currentScene = BenchmarkScene()
            case .TextureScene:
                currentScene = BenchmarkScene()
            case .BlendModeScene:
                currentScene = BlendModeScene()
            case .MainSceene:
                closeScene()
        }
        
        if let myScene = currentScene
        {
            myScene.position = mainMenu!.position
            self.addChild(myScene)
            if mainMenu!.parent != nil {
                mainMenu?.removeFromParent()
            }
        }
    }
    
    func closeScene()
    {
        if let myScene = currentScene
        {
            myScene.removeFromParent()
            currentScene = nil
        }
        
        if let myMenu = mainMenu
        {
            if myMenu.parent == nil
            {
                self.addChild(myMenu)
            }
        }
    }

    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        let touch = touches.anyObject() as UITouch

        var location = touch.locationInNode(mainMenu!)
        var nodes:[AnyObject]? = mainMenu!.nodesAtPoint(location)
        if let myNodes = nodes as? [SKNode]
        {
            for node:SKNode in myNodes
            {
                if node is Button
                {
                    showScene((node as Button).sceneType!)
                    return
                }
            }
        }
        
        location = touch.locationInNode(self)

        nodes = self.nodesAtPoint(location)
        if let myNodes = nodes as? [SKNode]
        {
            for node:SKNode in myNodes
            {
                if node is Button
                {
                    showScene((node as Button).sceneType!)
                    return
                }
            }
        }

        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        if let myScene = currentScene
        {
            if myScene is EnterFrameProtocol
            {
                (myScene as EnterFrameProtocol).onEnterFrame()
            }
        }
        
    }
}

@objc protocol EnterFrameProtocol {
    
    func onEnterFrame()
}
