//
//  GameScene.swift
//  BubblePop
//
//  Created by William Mitchell on 4/22/19.
//  Copyright © 2019 William Mitchell. All rights reserved.
//

import SpriteKit
import UIKit

enum BubbleColors {
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
    
    var bubbleArray: [SKShapeNode] = [SKShapeNode]()
    let bubbleLimit: Int = GameSettings.maxBubbles
    var randColor: Int?
    var randXPosition: Int?
    var randYPosition: Int?
    var globalPoints: Int = 0
    var scoreLabel = SKLabelNode()
    var levelTimerLabel = SKLabelNode()
    var prevScoreCalcTime: TimeInterval = 0
    var previousNode: Int?
    
    var levelTimerValue: Int = GameSettings.maxTime {
        didSet {
            levelTimerLabel.text = "Time left: \(levelTimerValue)"
        }
    }
    ///////////////////////////////////////////////////////
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.white
        spawnGameTimer()
        spawnPoints()
        temp()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if currentTime - prevScoreCalcTime > 1 {
            prevScoreCalcTime = currentTime
            wipeScene()
            temp()
        }
    }
    
    func temp() {
        while (bubbleArray.count !=  bubbleLimit) {
            spawnBubbles()
        }
    }
    
    func wipeScene() {
        //for i in 0..<bubbleArray.count {
        //    bubbleArray[i].removeFromParent()
        //}
        while bubbleArray.count > 0 {
            bubbleArray[0].removeFromParent()
            bubbleArray.remove(at: 0)
        }
        bubbleArray.removeAll()
    }
    
    func spawnPoints() {
        scoreLabel = SKLabelNode(text: "Score: \(globalPoints)")
        scoreLabel.fontName = "ArialMT"
        scoreLabel.fontSize = 20.0
        scoreLabel.fontColor = UIColor.black
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 50)
        addChild(scoreLabel)
    }
    
    func spawnGameTimer() {
        levelTimerLabel = SKLabelNode(text: "Time left: ")
        levelTimerLabel.fontName = "ArialMT"
        levelTimerLabel.fontColor = UIColor.black
        levelTimerLabel.fontSize = 20.0
        levelTimerLabel.position = CGPoint(x: frame.minX + 60, y: frame.maxY - 50)
        levelTimerLabel.text = "Time left: \(levelTimerValue)" // maybe remove and just update the timer value
        addChild(levelTimerLabel)
        
        let wait = SKAction.wait(forDuration: 1.0)
        let block = SKAction.run ({
            [unowned self] in
            
            if self.levelTimerValue > 0 {
                self.levelTimerValue -= 1
            } else {
                UserDefaults.standard.set(self.globalPoints, forKey: "RecentScore")
                if self.globalPoints > UserDefaults.standard.integer(forKey: "Highscore"){
                    UserDefaults.standard.set(self.globalPoints, forKey: "Highscore")
                }
                
                let gameOverScene = GameOverScene(size: self.view!.bounds.size)
                self.view?.presentScene(gameOverScene)
            }
        })
        let sequence = SKAction.sequence([wait, block])
        run(SKAction.repeatForever(sequence))
    }
    
    func pointsCalc(_ index:Int) {
        switch bubbleArray[index].fillColor {
        case BubbleColors.colors[0] :
            if previousNode == 0 {
                globalPoints += Int(1.5 * 1)
            } else {
                globalPoints += 1
            }
            previousNode = 0
        case BubbleColors.colors[1] :
            if previousNode == 1 {
                globalPoints += Int(1.5 * 2)
            } else {
                globalPoints += 2
            }
            previousNode = 1
        case BubbleColors.colors[2] :
            if previousNode == 2 {
                globalPoints += Int(1.5 * 5)
            } else {
                globalPoints += 5
            }
            previousNode = 2
        case BubbleColors.colors[3] :
            if previousNode == 3 {
                globalPoints += Int(1.5 * 8)
            } else {
                globalPoints += 8
            }
            previousNode = 3
        case BubbleColors.colors[4] :
            if previousNode == 4 {
                globalPoints += Int(1.5 * 10)
            } else {
                globalPoints += 10
            }
            previousNode = 4
        default :
            print("scoreLabel error")
        }
        scoreLabel.text = ("Score: \(globalPoints)")
    }
    
    func findIndex(_ name: String) -> Int {
        for i in 0..<bubbleArray.count {
            if name == bubbleArray[i].name {
                return i
            }
        }
        return -1
    }

    func isMatch(_ name: String) -> Bool {
        if(findIndex(name) != -1) {
            return true
        }
        return false
    }
    
    func spawnBubbles() {
        
        let bubble = SKShapeNode(circleOfRadius: 35)
        
        //bubble.name = "bubbleName"
        bubble.fillColor = UIColor.white
        
        randXPosition = Int.random(in: (Int(frame.minX+40)...(Int(frame.maxX-40))))
        randYPosition = Int.random(in: (Int(frame.minY+40)...(Int(frame.maxY-40))))        
        //ball.position = CGPoint(x: random(min: 0, max: 1), y: 500 * random(min: 0, max: 1))
        
        bubble.position = CGPoint(x: randXPosition!, y: randYPosition!)
        randColor = Int.random(in: 0...100)
        
        switch randColor! {
        case 0..<6 :    //black
            bubble.fillColor = BubbleColors.colors[4]
        case 6..<16 :    //blue
            bubble.fillColor = BubbleColors.colors[3]
        case 16..<31 :    //green
            bubble.fillColor = BubbleColors.colors[2]
        case 31..<61 :    //pink
            bubble.fillColor = BubbleColors.colors[1]
        case 61..<100 :     //red
            bubble.fillColor = BubbleColors.colors[0]
        default :
            bubble.fillColor = BubbleColors.colors[0]
            print("Error")
        }
        
        var isPositionEmpty = true
        for i in 0..<bubbleArray.count {
            if(bubble.intersects(bubbleArray[i])) {
                isPositionEmpty = false
            }
        }
        if (isPositionEmpty) {
            bubble.name = String(bubbleArray.count)
            print("name: \(bubble.name!)")
            bubbleArray.append(bubble)
            addChild(bubble)
        }
    }
//    func isPositionEmpty (point: CGPoint) -> Bool {
//        if bubble.frame.contains(point) {
//            print("failed")
//            return false
//        }
//        print("success")
//        return true
//    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self) //converts touch location into scene coordinates
            let touchedNode = self.atPoint(location)
                
            if let name = touchedNode.name {
                if isMatch(name) {
                    let index = findIndex(name)
                    pointsCalc(index)
                    bubbleArray[index].removeFromParent()
                    bubbleArray.remove(at: index)
                    spawnBubbles()
                }
            }
        }
    }
    
}
