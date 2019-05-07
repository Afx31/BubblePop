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
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        setupCountDown()        
    }
    
    func setupCountDown() {
        
        let countDown = SKLabelNode(text: "3")
        countDown.fontName = "ArialMT"
        countDown.fontSize = 150.0
        countDown.fontColor = UIColor.white
        countDown.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(countDown)
        
        //make them 0.5 or 0.4
        ////////////////
        ////////////////
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        countDown.run(SKAction.fadeOut(withDuration: 0.1)) {
            countDown.text = "2"
            countDown.run(SKAction.fadeIn(withDuration: 0.1)) {
                countDown.run(SKAction.fadeOut(withDuration: 0.1)) {
                    countDown.text = "1"
                    countDown.run(SKAction.fadeIn(withDuration: 0.1)) {
                        countDown.run(SKAction.fadeOut(withDuration: 0.1)) {
                            let gameScene = GameScene(size: self.view!.bounds.size)
                            self.view!.presentScene(gameScene)
                        }
                    }
                }
            }
        }
    }
    
}
