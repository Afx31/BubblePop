//
//  Settings.swift
//  BubblePop
//
//  Created by William Mitchell on 4/22/19.
//  Copyright © 2019 William Mitchell. All rights reserved.
//

import SpriteKit

enum GameSettings {
    static var maxBubbles = 15
    static var maxTime = 60
}

enum ZPositions {
    static let label: CGFloat = 1
    static let ball: CGFloat = 0
}

enum BubbleColors {
    static let colors = [
        UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0), //red
        SKColor.magenta, //pink
        UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1.0), //green
        UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1.0), //blue
        UIColor(red: 0/255, green: 0/255, blue: 0/225, alpha: 1.0) //black
    ]
}
