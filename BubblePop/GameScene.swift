//
//  GameScene.swift
//  BubblePop
//
//  Created by user144252 on 4/22/19.
//  Copyright © 2019 user144252. All rights reserved.
//

import SpriteKit
//import GameplayKit

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

class GameScene: SKScene {
    
    //var redBall: SKSpriteNode!
    //var switchState: SwitchState = .red
    //var currentColorIndex: Int?
    
    
    
    
    
    //score label
    let scoreLabel = SKLabelNode(text: "0")
    var score = 0
    /*
    override func didMove(to view: SKView) {
        setupPhysics()
        layoutScene()
    }*/
    
    func setupPhysics() {
        //physicsWorld.gravity = CGVector(dx: 0, dy: -9.8/5)
        //physicsWorld.contactDelegate = self
    }
    
    func layoutScene() {
        //backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        
        //redBall = SKSpriteNode(imageNamed: "ball")
        //redBall.size = CGSize(width: frame.size.width/3, height: frame.size.width/3)
        //redBall.position
        //redBall.zPosition
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        spawnBalls()
    }
    
    func spawnBalls() {
        let balls = Balls(image: SKSpriteNode(imageNamed: "ball"))
        self.addChild(balls)
    }
    
}
