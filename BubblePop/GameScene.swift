//
//  GameScene.swift
//  BubblePop
//
//  Created by user144252 on 4/22/19.
//  Copyright © 2019 user144252. All rights reserved.
//

import SpriteKit
import UIKit

enum BallColors {
    static let colors = [
        UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0), //red
        UIColor(red: 225/255, green: 0/255, blue: 127/255, alpha: 1.0), //pink
        UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1.0), //green
        UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1.0), //blue
        UIColor(red: 0/255, green: 0/255, blue: 0/225, alpha: 1.0) //black
    ]
}

enum SwitchState: Int {
    case red, pink, green, blue, black
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var currentColorIndex: Int?
    let ball = SKSpriteNode(imageNamed: "ball")
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        setupScene()
        //spawnBalls()
        //adds an action to the list of actions executed by the node, schedules argument block to be run upon complteion of action
        //run(SKAction.repeatForever(SKAction.sequence([SKAction.run(spawnBalls), SKAction.wait(forDuration: 1.0)])))
        
    }
    
    func setupScene() {
        //World Physics
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8/5)
        physicsWorld.contactDelegate = self
        //let moveToSide = SKAction.move(to: CGPoint(x: Int(arc4random()%1000), y: Int(arc4random()%1000)), duration: 2)
        
        //score stuff across top bar CODE here
        let limit = 5
        var counter = 0
        
        while counter < 5 {
            spawnBalls()
            counter = counter + 1
        }
        
        /*print("before")
        enumerateChildNodes(withName: "balls", using: { node, stop in
            counter += 1
            print("why")
            if counter <= limit {
                self.spawnBalls()
                print("true")
            }
            else {
                print("false")
            }
        })
        print("after")*/
    }
    
    func spawnBalls() {
        ball.size = CGSize(width: 50, height: 50)
        ball.name = "balls"
        //ball.position = CGPoint(x: frame.midX, y: frame.midY)
        ball.position = CGPoint(x: 500 * random(min: 0, max: 1), y: 500 * random(min: 0, max: 1))
        addChild(ball)
        
        /*
         if positionIsEmpty(point: position) {
         ball.position = position
         self.addChild(ball)
         //ball.run(parallax1)
         }*/
    }
    
    //this needed?
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func positionIsEmpty (point: CGPoint) -> Bool {
        if ball.frame.contains(point) {
            print("failed")
            return false
        }
        print("success")
        return true
    }
    /*func positionIsEmpty(point: CGPoint) -> Bool {
        self.enumerateChildNodes(withName: "ballname", using: {
            (node, stop) in
            
            let ball = node as! SKSpriteNode
            if (ball.frame.contains(point)) {
                //return false
            }
        })
        return true
    }*/
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self) //converts touch location into scene coordinates
            //let ree = atPoint(location) as? ball { // sussed bookedmarked example
            let node = self.nodes(at: location).first
            
            if node?.name == "ballTouched" {
                //score ++
                ball.removeFromParent()
                spawnBalls()
            } else {
                //let transition = SKTransition.fade(withDuration: 1)
                //gameScene = SKScene(fileNamed: "GameScene")
                //gameScene.scaleMode = .aspectFit
                //self.view?.presentScene(gameScene, transition: transition)
            }
            /*
            let touchedNode = self.atPoint(point)
            if touchedNode.name == "ballname" {
                touchedNode.removeFromParent()
            }*/
        }
    }
    
}
