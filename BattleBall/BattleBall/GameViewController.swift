//
//  GameViewController.swift
//  BattleBall
//
//  Created by Rafael Valer on 4/26/16.
//  Copyright (c) 2016 RafaelValer. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = GameScene(fileNamed: "GameScene") as GameScene? {
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            skView.showsPhysics = true
            skView.ignoresSiblingOrder = false
            
            scene.scaleMode = .AspectFill
            scene.size = skView.bounds.size
            skView.presentScene(scene)
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}