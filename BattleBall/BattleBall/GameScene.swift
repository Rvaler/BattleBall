//
//  GameScene.swift
//  BattleBall
//
//  Created by Rafael Valer on 4/26/16.
//  Copyright (c) 2016 RafaelValer. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let playerOne = PlayerNode(playerTeam: 1)
    let playerTwo = PlayerNode(playerTeam: 2)
    
    let circle = SKShapeNode(circleOfRadius: 10)
    
    var gameBall: SKSpriteNode?
    
    let basePlayerOne = SKSpriteNode(imageNamed: "blueCircle")
    let controlPlayerOne = SKSpriteNode(imageNamed: "redCircle")
    
    let basePlayerTwo = SKSpriteNode(imageNamed: "blueCircle")
    let controlPlayerTwo = SKSpriteNode(imageNamed: "redCircle")
    
    var stickActivePlayerOne : Bool = false
    var stickActivePlayerTwo : Bool = false
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.scaleMode = SKSceneScaleMode.ResizeFill
        
        backgroundColor = SKColor.blackColor()
        
        gameBall = self.childNodeWithName("gameBall") as? SKSpriteNode
        
        self.addChild(basePlayerOne)
        basePlayerOne.position = CGPointMake(60 , 150)
        basePlayerOne.zPosition = 49
        self.addChild(controlPlayerOne)
        controlPlayerOne.position = basePlayerOne.position
        controlPlayerOne.zPosition = 51

        self.addChild(basePlayerTwo)
        basePlayerTwo.position = CGPointMake(self.frame.size.width - 60 , self.frame.size.height - 150)
        basePlayerTwo.zPosition = 49
        self.addChild(controlPlayerTwo)
        controlPlayerTwo.position = basePlayerTwo.position
        controlPlayerTwo.zPosition = 51

        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        
//        circle.fillColor = UIColor.whiteColor()
//        circle.position = CGPointMake(500, 500)
//        circle.physicsBody = SKPhysicsBody(circleOfRadius: 10)
//        circle.physicsBody?.dynamic = true
//        circle.physicsBody?.allowsRotation = false
//        circle.physicsBody?.friction = 0.5
//        circle.physicsBody?.restitution = 0.1
//        circle.physicsBody?.angularDamping = 0
//        circle.physicsBody?.linearDamping = 0
//        circle.zPosition = 34
//    
//        circle.physicsBody?.categoryBitMask = PhysicsBody.PhysicsCategory.BallCategoryBitMask
//        circle.physicsBody?.collisionBitMask = PhysicsBody.PhysicsCategory.FieldCategoryBitMask
//        circle.physicsBody?.contactTestBitMask = PhysicsBody.PhysicsCategory.FieldCategoryBitMask
//        self.addChild(circle)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            if location.y < self.frame.size.height / 2 {
                if CGRectContainsPoint(controlPlayerOne.frame, location) {
                    stickActivePlayerOne = true
                }else{
                    stickActivePlayerOne = false
                }
            } else {
                if CGRectContainsPoint(controlPlayerTwo.frame, location) {
                    stickActivePlayerTwo = true
                }else{
                    stickActivePlayerTwo = false
                }
            }
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if firstBody.categoryBitMask == PhysicsBody.PhysicsCategory.BallCategoryBitMask && secondBody.categoryBitMask == PhysicsBody.PhysicsCategory.FieldCategoryBitMask {
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
           
            if location.y < self.frame.height / 2 && stickActivePlayerOne == true {
//                print("baixo")
                let vector = CGVector(dx: location.x - basePlayerOne.position.x, dy: location.y - basePlayerOne.position.y)
                let angle = atan2(vector.dy, vector.dx)

                let deg = angle * CGFloat(180 / M_PI)
                //            print(deg + 180)
                
                let newVector = CGVector(dx: vector.dx / 50, dy: vector.dy / 50)
                let move = SKAction.moveBy(newVector, duration: 0.1)
                self.gameBall!.runAction(move)
//                self.circle.physicsBody?.applyImpulse(newVector)
//                self.circle.physicsBody.

                let length:CGFloat = basePlayerOne.frame.size.height / 2

                let xDistance:CGFloat = sin(angle - 1.57079633) * length
                let yDistance:CGFloat = cos(angle - 1.57079633) * length

                if CGRectContainsPoint(basePlayerOne.frame, location) {
                    controlPlayerOne.position = location
                }else{
                    controlPlayerOne.position = CGPointMake(basePlayerOne.position.x - xDistance, basePlayerOne.position.y + yDistance)
                }
            }else if location.y > 0 && stickActivePlayerTwo == true {
//                print("cima")
                let vector = CGVector(dx: location.x - basePlayerTwo.position.x, dy: location.y - basePlayerTwo.position.y)
                let angle = atan2(vector.dy, vector.dx)

                let deg = angle * CGFloat(180 / M_PI)
                //            print(deg + 180)

                let length:CGFloat = basePlayerTwo.frame.size.height / 2

                let xDistance:CGFloat = sin(angle - 1.57079633) * length
                let yDistance:CGFloat = cos(angle - 1.57079633) * length
                
                

                if CGRectContainsPoint(basePlayerTwo.frame, location) {
                    controlPlayerTwo.position = location
                }else{
                    controlPlayerTwo.position = CGPointMake(basePlayerTwo.position.x - xDistance, basePlayerTwo.position.y + yDistance)
                }
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            if location.y < 0 && stickActivePlayerOne == true {
                let move:SKAction = SKAction.moveTo(basePlayerOne.position, duration: 0.2)
                move.timingMode = .EaseOut
                controlPlayerOne.runAction(move)
            }else if location.y > 0 && stickActivePlayerTwo == true {
                let move:SKAction = SKAction.moveTo(basePlayerTwo.position, duration: 0.2)
                move.timingMode = .EaseOut
                controlPlayerTwo.runAction(move)
            }
        }
    }
}
