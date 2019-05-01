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
    
//    var colorSwitch: SKSpriteNode!
//
//    var switchState:SwitchState = .red        //turning circle colour
//    var currentColorIndex: Int?           // balls current colour
    //color: PlayColors.colors[currentColorIndex!]

    ///////////////////////////////////////////////////////
    var bubbleArray: [SKShapeNode] = [SKShapeNode]()
    let bubbleLimit: Int = 15
    
    var currentColorIndex: Int?
    var randColor: Int?
    var randXPosition: Int?
    var randYPosition: Int?
    ///////////////////////////////////////////////////////
    
    override func didMove(to view: SKView) {
        
        backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        while (bubbleArray.count !=  bubbleLimit) {
            spawnBubbles()
        }
        
    }
    
    func spawnBubbles() {
        
        //currentColorIndex = Int.random(in: 0...3)
        let bubble = SKShapeNode(circleOfRadius: 40)
        
        bubble.name = "bubbleName"
        bubble.fillColor = UIColor.white
        
        randXPosition = Int.random(in: (Int(frame.minX+25)...(Int(frame.maxX-25))))
        randYPosition = Int.random(in: (Int(frame.minY+25)...(Int(frame.maxY-25))))
        //ball.position = CGPoint(x: random(min: 0, max: 1), y: 500 * random(min: 0, max: 1))
        
        bubble.position = CGPoint(x: randXPosition!, y: randYPosition!)
        
        randColor = Int.random(in: 0...100)
        
        switch randColor! {
        case 0..<6 :    //black
            //bubble.fillColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
            bubble.fillColor = BubbleColors.colors[4]
        case 6..<16 :    //blue
            //bubble.fillColor = UIColor(red: 0/255, green: 255/255, blue: 255/255, alpha: 1.0)
            bubble.fillColor = BubbleColors.colors[3]
        case 16..<31 :    //green
            //bubble.fillColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1.0)
            bubble.fillColor = BubbleColors.colors[2]
        case 31..<61 :    //pink
            //bubble.fillColor = UIColor(red: 225/255, green: 0/255, blue: 127/255, alpha: 1.0)
            bubble.fillColor = BubbleColors.colors[1]
        case 61..<100 :     //red
            //bubble.fillColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
            bubble.fillColor = BubbleColors.colors[0]
        default :
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
            print(bubble.name!)
            bubbleArray.append(bubble)
            addChild(bubble)
        }
        print("size\(isPositionEmpty)")
        
//        if isPositionEmpty(point: position) {
//            //bubble.position = position
//
//            bubbleArray.append(bubble)
//        }
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
            //let location = atPoint(self) as? bubble { // sussed bookedmarked example
            let node = self.nodes(at: location).first
            
            if node?.name == "bubbleName" {
                //score ++
                //bubble.removeFromParent()
                bubbleArray[index].
                spawnBubbles()
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
