//
//  FieldNode.swift
//  BattleBall
//
//  Created by Rafael Valer on 4/27/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit
import SpriteKit

class FieldNode: SKSpriteNode {
    
    init(frameSize: CGSize){
        let texture: SKTexture = SKTexture(imageNamed: "fieldBattleBall")
        
        let newSize = CGSize(width: frameSize.width - 103, height: frameSize.height - 100)
        super.init(texture: nil, color: UIColor.clearColor(), size: newSize)
        
        self.initPhysics(self, frameSize: newSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initPhysics(fieldNode: FieldNode, frameSize : CGSize) {
        
        let offsetX = frameSize.width * fieldNode.anchorPoint.x
        let offsetY = frameSize.height * fieldNode.anchorPoint.y
        
        let path: CGMutablePath = CGPathCreateMutable()

        let fieldHeight = frameSize.height
        let fieldWidth = frameSize.width

        CGPathMoveToPoint(path, nil, 103 - offsetX, fieldHeight - offsetY - 50)
        CGPathAddLineToPoint(path, nil, -103 + fieldWidth - offsetX, fieldHeight - offsetY - 50)
        CGPathAddLineToPoint(path, nil, -103 + fieldWidth - offsetX, (fieldHeight / 2) - offsetY + 63.5)
        CGPathAddLineToPoint(path, nil, -51.5 + fieldWidth - offsetX, (fieldHeight / 2) - offsetY + 63.5)
        CGPathAddLineToPoint(path, nil, -51.5 + fieldWidth - offsetX, (fieldHeight / 2) - offsetY - 63.5)
        CGPathAddLineToPoint(path, nil, -103 + fieldWidth - offsetX, (fieldHeight / 2) - offsetY - 63.5)
        CGPathAddLineToPoint(path, nil, -103 + fieldWidth - offsetX, -offsetY + 50)
        CGPathAddLineToPoint(path, nil, 103 - offsetX, -offsetY + 50)
        CGPathAddLineToPoint(path, nil, 103 - offsetX, (fieldHeight / 2) - offsetY - 63.5)
        CGPathAddLineToPoint(path, nil, 51.5 - offsetX, (fieldHeight / 2) - offsetY - 63.5)
        CGPathAddLineToPoint(path, nil, 51.5 - offsetX, (fieldHeight / 2) - offsetY + 63.5)
        CGPathAddLineToPoint(path, nil, 103 - offsetX, (fieldHeight / 2) - offsetY + 63.5)
        CGPathCloseSubpath(path)

        
        
//        CGPathMoveToPoint(path, nil, 47 - offsetX, 364 - offsetY)
//        CGPathAddLineToPoint(path, nil, 837 - offsetX, 364 - offsetY)
//        CGPathAddLineToPoint(path, nil, 837 - offsetX, 223 - offsetY)
//        CGPathAddLineToPoint(path, nil, 862 - offsetX, 223 - offsetY)
//        CGPathAddLineToPoint(path, nil, 862 - offsetX, 160 - offsetY)
//        CGPathAddLineToPoint(path, nil, 837 - offsetX, 160 - offsetY)
//        CGPathAddLineToPoint(path, nil, 837 - offsetX, 18 - offsetY)
//        CGPathAddLineToPoint(path, nil, 47 - offsetX, 18 - offsetY)
//        CGPathAddLineToPoint(path, nil, 46 - offsetX, 160 - offsetY)
//        CGPathAddLineToPoint(path, nil, 21 - offsetX, 160 - offsetY)
//        CGPathAddLineToPoint(path, nil, 21 - offsetX, 223 - offsetY)
//        CGPathAddLineToPoint(path, nil, 47 - offsetX, 223 - offsetY)
//        CGPathCloseSubpath(path)
        
        
//        fieldNode.color = UIColor.whiteColor()
        
        fieldNode.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "fieldBattleBall"), size: frameSize)
        fieldNode.physicsBody?.dynamic = false
        fieldNode.physicsBody?.affectedByGravity = false
        fieldNode.physicsBody?.friction = 1
        fieldNode.physicsBody?.restitution = 1
        fieldNode.physicsBody?.linearDamping = 0
        fieldNode.physicsBody?.angularDamping = 0
        
//        fieldNode.physicsBody?.categoryBitMask = PhysicsBody.PhysicsCategory.FieldCategoryBitMask
//        fieldNode.physicsBody?.collisionBitMask = PhysicsBody.PhysicsCategory.BallCategoryBitMask
//        fieldNode.physicsBody?.contactTestBitMask = PhysicsBody.PhysicsCategory.BallCategoryBitMask
    }
    
}