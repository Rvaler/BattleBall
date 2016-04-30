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
        self.initPhysics(self)
//        self.anchorPoint = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
    }
    
    func initPhysics(playerNode: PlayerNode){
        playerNode.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "blueCircle"), size: CGSize(width: 52, height: 52))
        playerNode.physicsBody?.dynamic = true
        playerNode.physicsBody?.affectedByGravity = false
        playerNode.physicsBody?.friction = 1
        playerNode.physicsBody?.restitution = 1
        playerNode.physicsBody?.linearDamping = 0
        playerNode.physicsBody?.angularDamping = 0
        
        playerNode.physicsBody?.categoryBitMask = PhysicsBody.PhysicsCategory.PlayerCategoryBitMask
        playerNode.physicsBody?.collisionBitMask = PhysicsBody.PhysicsCategory.BallCategoryBitMask | PhysicsBody.PhysicsCategory.FieldCategoryBitMask
        playerNode.physicsBody?.contactTestBitMask = PhysicsBody.PhysicsCategory.BallCategoryBitMask | PhysicsBody.PhysicsCategory.FieldCategoryBitMask
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

