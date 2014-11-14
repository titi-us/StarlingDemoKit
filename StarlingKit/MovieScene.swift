//
//  MovieScene.swift
//  StarlingKit
//
//  Created by Thibaut Crenn on 11/13/14.
//  Copyright (c) 2014 Thibaut Crenn. All rights reserved.
//

import Foundation
import SpriteKit

class MovieScene:BaseScene {
    
    override init()
    {
        var textures:[SKTexture] = [];
        var i = 0;
        for (i; i < 14; i++)
        {
            let dec = Int(i/10)
            let rem = i - dec*10
            textures.append(SKTexture(imageNamed: "flight_"+String(dec)+String(rem)))
        }
        
        let movieClip = SKSpriteNode(texture: textures[0])
        let action = SKAction.repeatActionForever(SKAction.animateWithTextures(textures, timePerFrame: 0.05))
        movieClip.runAction(action)
        
        super.init()
        
        self.addChild(movieClip)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
