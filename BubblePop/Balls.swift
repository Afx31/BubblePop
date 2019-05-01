//
//  Balls.swift
//  BubblePop
//
//  Created by William Mitchell on 4/22/19.
//  Copyright © 2019 William Mitchell. All rights reserved.
//

import Foundation
import SpriteKit

class Balls: SKNode {
    
    init(image: SKSpriteNode) {
        super.init()
        
        //determine which side of the x axis the ball will spawn
        let randomNumber = arc4random_uniform(2)
        let x: CGFloat = randomNumber == 0 ? 1 : -1
        
        //set the starting position of the node
        self.position = CGPoint(x: (CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width))) * x), y: UIScreen.main.bounds.height)
        
        //set the size of the node
        self.setScale(0.2)
        
        //apply a physics body to the node
        //self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "ball"), size: CGSize(width: image.size.width * 0.01, height:image.size.width * 0.01))
        
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "ball"), size: CGSize(width: 30.0, height: 30.0))
        
        //add the image to the object
        self.addChild(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
