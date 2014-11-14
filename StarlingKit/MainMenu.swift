
//
//  MainMenu.swift
//  StarlingKit
//
//  Created by Thibaut Crenn on 11/12/14.
//  Copyright (c) 2014 Thibaut Crenn. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenu:SKNode {
    
    
    private var buttons:[Button] = []
    
    override init() {
        
        let logo = SKSpriteNode(imageNamed: "logo")
        
        super.init()
        
        self.addChild(logo)
        logo.position.y = 170;
        
        
        let scenesToCreate = [
            ("Benchmark", SceneType.BenchMarkScene), ("Blend Modes", SceneType.BlendModeScene),
            ("Animations", SceneType.AnimationScene), ("MovieClip", SceneType.MovieScene)
        ]
        
        let texture:SKTexture = SKTexture(imageNamed: "button_medium")
        var count = 0
        
        for sceneInfo in scenesToCreate {
            
            let (sceneName, sceneType) = sceneInfo
            
            var button:Button = Button(texture: texture, title:sceneName)
            button.position.x = count % 2 == 0 ? 28 - 100 : 167 - 100;
            button.position.y = CGFloat(Int(count / 2) * 46);
            button.sceneType = sceneType
            if (scenesToCreate.count % 2 != 0 && count % 2 == 1)
            {
                button.position.y += 24;
            }
            buttons.append(button)
            self.addChild(button)
            count++
            
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
    
}