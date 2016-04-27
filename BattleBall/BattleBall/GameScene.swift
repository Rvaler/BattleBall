//
//  GameScene.swift
//  BattleBall
//
//  Created by Rafael Valer on 4/26/16.
//  Copyright (c) 2016 RafaelValer. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let playerOne = PlayerNode(playerTeam: 1)
    let playerTwo = PlayerNode(playerTeam: 2)
    
    let basePlayerOne = SKSpriteNode(imageNamed: "blueCircle")
    let controlPlayerOne = SKSpriteNode(imageNamed: "redCircle")
    
    let basePlayerTwo = SKSpriteNode(imageNamed: "blueCircle")
    let controlPlayerTwo = SKSpriteNode(imageNamed: "redCircle")
    
    var stickActive : Bool = false
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        backgroundColor = SKColor.whiteColor()
        
        self.anchorPoint = CGPointMake(0.5, 0.5)
        
        self.addChild(basePlayerOne)
        basePlayerOne.position = CGPointMake(0 , -200)
        basePlayerOne.zPosition = 49
        self.addChild(controlPlayerOne)
        controlPlayerOne.position = basePlayerOne.position
        controlPlayerOne.zPosition = 51

        self.addChild(basePlayerTwo)
        basePlayerTwo.position = CGPointMake(0 , 200)
        basePlayerTwo.zPosition = 49
        self.addChild(controlPlayerTwo)
        controlPlayerTwo.position = basePlayerTwo.position
        controlPlayerTwo.zPosition = 51

//        playerOne.position = CGPoint(x: self.frame.size.width / 2, y: 200)
//        playerTwo.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 200)
//        addChild(playerOne)
//        addChild(playerTwo)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            if CGRectContainsPoint(controlPlayerOne.frame, location) {
                stickActive = true
            }else{
                stickActive = false
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            
            if stickActive == true {
                let vector = CGVector(dx: location.x - basePlayerOne.position.x, dy: location.y - basePlayerOne.position.y)
                let angle = atan2(vector.dy, vector.dx)
                
                let deg = angle * CGFloat(180 / M_PI)
                //            print(deg + 180)
                
                let length:CGFloat = basePlayerOne.frame.size.height / 2
                
                let xDistance:CGFloat = sin(angle - 1.57079633) * length
                let yDistance:CGFloat = cos(angle - 1.57079633) * length
                
                if CGRectContainsPoint(basePlayerOne.frame, location) {
                    controlPlayerOne.position = location
                }else{
                    controlPlayerOne.position = CGPointMake(basePlayerOne.position.x - xDistance, basePlayerOne.position.y + yDistance)
                }
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if stickActive == true {
            let move:SKAction = SKAction.moveTo(basePlayerOne.position, duration: 0.2)
            move.timingMode = .EaseOut
            controlPlayerOne.runAction(move)
        }
    }
}
