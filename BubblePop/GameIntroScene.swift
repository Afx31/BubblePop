//
//  GameIntroScene.swift
//  BubblePop
//
//  Created by William Mitchell on 1/5/19.
//  Copyright © 2019 William Mitchell. All rights reserved.
//

import SpriteKit
import UIKit

class GameIntroScene: SKScene {
    
    var countDown = SKLabelNode()
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        addLabel()
        setupCountDown()
    }
    
    func addLabel() {
        countDown = SKLabelNode(text: "3")
        countDown.fontName = "ArialMT"
        countDown.fontSize = 150.0
        countDown.fontColor = UIColor.white
        countDown.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(countDown)
    
    }
    
    //The func displays a flashing series of 3, 2, 1 to countdown the user into the game
    func setupCountDown() {
        
        countDown.run(SKAction.fadeOut(withDuration: 0.5)) {
            self.countDown.text = "2"
            self.countDown.run(SKAction.fadeIn(withDuration: 0.5)) {
                self.countDown.run(SKAction.fadeOut(withDuration: 0.5)) {
                    self.countDown.text = "1"
                    self.countDown.run(SKAction.fadeIn(withDuration: 0.5)) {
                        self.countDown.run(SKAction.fadeOut(withDuration: 0.5)) {
                            let gameScene = GameScene(size: self.view!.bounds.size)
                            self.view!.presentScene(gameScene)
                        }
                    }
                }
            }
        }
        
    }
    
}
