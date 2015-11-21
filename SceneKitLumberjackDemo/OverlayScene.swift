//
//  OverlayScene.swift
//  SceneKitLumberjackDemo
//
//  Created by Munahil Murrieum on 19/11/2015.
//  Copyright © 2015 Munahil Murrieum. All rights reserved.
//

import UIKit
import SpriteKit

protocol OverlaySceneDelegate{
    func changedToWhite(boolValue: Bool)
}

class OverlayScene: SKScene {

    var overlayDelegate: OverlaySceneDelegate! = nil
    var changedToWhite : Bool!

    var button: SKSpriteNode!

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        changedToWhite = true
        button = SKSpriteNode(texture: SKTexture(imageNamed: "jacketColor_green.png"), size: CGSizeMake(50, 50))
        button.position = CGPointMake(100,100)
        button.name = "changeColor"
        self.addChild(button)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches
        let location = touch.first!.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if (node.name == "changeColor") {
            if (changedToWhite == false)
            {
                overlayDelegate.changedToWhite(true)
                button.texture = SKTexture(imageNamed: "jacketColor_green.png")
                changedToWhite = true
            }
            else
            {
                overlayDelegate.changedToWhite(false)
                button.texture = SKTexture(imageNamed: "jacketColor_offWhite.png")
                changedToWhite = false
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }

    
}
