//
//  SceneView.swift
//  SceneKitLumberjackDemo
//
//  Created by Munahil Murrieum on 19/11/2015.
//  Copyright © 2015 Munahil Murrieum. All rights reserved.
//

import UIKit
import SceneKit

class SceneView: SCNView, OverlaySceneDelegate {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit()
    {
        print("commoninit")
        self.scene = SCNScene(named:"lumberJack.dae")
        self.allowsCameraControl = true
        //        self.autoenablesDefaultLighting = true
        
        let overlayScene = OverlayScene(size:UIScreen.mainScreen().bounds.size) //screenSize
        overlayScene.overlayDelegate = self
        
        self.overlaySKScene = overlayScene
    }

    func changedToWhite(boolValue: Bool)
    {
        if (boolValue == false)
        {
            print("change Color OffWhite")
            let objectMaterial = SCNMaterial()
            objectMaterial.diffuse.contents = UIImage(named: "lumberJack_diffuse2.png")
            let node = self.scene!.rootNode.childNodeWithName("lumberJack", recursively: true)!
            node.geometry?.firstMaterial = objectMaterial
            
        }
        else
        {
            print("change Color Green")
            let objectMaterial = SCNMaterial()
            objectMaterial.diffuse.contents = UIImage(named: "lumberJack_diffuse1.png")
            let node = self.scene!.rootNode.childNodeWithName("lumberJack", recursively: true)!
            node.geometry?.firstMaterial = objectMaterial
            
        }
        
    }

}
