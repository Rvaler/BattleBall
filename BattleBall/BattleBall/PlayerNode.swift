//
//  PlayerNode.swift
//  BattleBall
//
//  Created by Rafael Valer on 4/26/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit
import SpriteKit

class PlayerNode: SKSpriteNode {
    
    init(playerTeam: Int){
        let texture : SKTexture!
        if playerTeam == 1 {
            texture = SKTexture(imageNamed: "blueCircle")
        }else{
            texture = SKTexture(imageNamed: "redCircle")
        }
        
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
//        self.anchorPoint = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

