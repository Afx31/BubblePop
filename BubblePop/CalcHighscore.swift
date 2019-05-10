//
//  CalcHighscore.swift
//  BubblePop
//
//  Created by user144252 on 5/9/19.
//  Copyright © 2019 user144252. All rights reserved.
//

import SpriteKit

class CalcHighscore: SKScene {
    
    init(gamePoints: Int) {
        super.init()
        
        let HighScore1 = UserDefaults.standard.integer(forKey: "HighScore1")
        let HighScore2 = UserDefaults.standard.integer(forKey: "HighScore2")
        let HighScore3 = UserDefaults.standard.integer(forKey: "HighScore3")
        let Player1 = UserDefaults.standard.string(forKey: "Player1")
        let Player2 = UserDefaults.standard.string(forKey: "Player2")
        let currentPlayerName = UserDefaults.standard.string(forKey: "CurrentPlayerName")
        
        UserDefaults.standard.set(gamePoints, forKey: "RecentScore")
        if gamePoints > HighScore1 {
            UserDefaults.standard.set(HighScore1, forKey: "HighScore2")
            UserDefaults.standard.set(Player1, forKey: "Player2")
        
            UserDefaults.standard.set(gamePoints, forKey: "HighScore1")
            UserDefaults.standard.set(currentPlayerName, forKey: "Player1")
        } else if gamePoints > HighScore2 {
            UserDefaults.standard.set(HighScore2, forKey: "HighScore3")
            UserDefaults.standard.set(Player2, forKey: "Player3")
        
            UserDefaults.standard.set(gamePoints, forKey: "HighScore2")
            UserDefaults.standard.set(currentPlayerName, forKey: "Player2")
        } else if gamePoints > HighScore3 {
            UserDefaults.standard.set(gamePoints, forKey: "HighScore3")
            UserDefaults.standard.set(currentPlayerName, forKey: "Player3")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
