//
//  GameOverScene.swift
//  BubblePop
//
//  Created by William Mitchell on 5/4/19.
//  Copyright © 2019 William Mitchell. All rights reserved.
//

import SpriteKit
import UIKit

class GameOverScene: SKScene {
    
    var menuButton = UIButton()
    var playAgainButton = UIButton()
    ///////////////////////////////////////////////////////////////////////////
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        addLabels()
        addButtons()
    }
    ///////////////////////////////////////////////////////////////////////////
    @objc func menuButtonAction(sender: UIButton!) {
        let menuScene = MenuScene(size: view!.bounds.size)
        view!.presentScene(menuScene)
        menuButton.isHidden = true
        playAgainButton.isHidden = true
    }
    
    @objc func playAgainButtonAction(sender: UIButton!) {
        let settingsScene = SettingsScene(size: view!.bounds.size)
        view!.presentScene(settingsScene)
        menuButton.isHidden = true
        playAgainButton.isHidden = true
    }
    ///////////////////////////////////////////////////////////////////////////
    func addButtons() {
        menuButton = UIButton(frame: CGRect(x: frame.midX, y: frame.midY + 100, width: 120, height: 80))
        menuButton.center.x = self.view!.center.x - 100
        menuButton.backgroundColor = .green
        menuButton.setTitle("Menu", for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        self.view?.addSubview(menuButton)
        
        playAgainButton = UIButton(frame: CGRect(x: frame.midX, y: frame.midY + 100, width: 120, height: 80))
        playAgainButton.center.x = self.view!.center.x + 100
        playAgainButton.backgroundColor = .red
        playAgainButton.setTitle("Play Again!", for: .normal)
        playAgainButton.addTarget(self, action: #selector(playAgainButtonAction), for: .touchUpInside)
        self.view?.addSubview(playAgainButton)
    }
    ///////////////////////////////////////////////////////////////////////////
    func addLabels() {
        let gameOverLabel = SKLabelNode(text: "Game Over")
        gameOverLabel.fontName = "AvenirNext-Bold"
        gameOverLabel.fontSize = 60.0
        gameOverLabel.fontColor = UIColor.red
        gameOverLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 100)
        addChild(gameOverLabel)
        
        let recentScoreLabel = SKLabelNode(text: "Your Score: " + "\(UserDefaults.standard.integer(forKey: "RecentScore"))")
        recentScoreLabel.fontName = "AvenirNext-Bold"
        recentScoreLabel.fontSize = 40.0
        recentScoreLabel.fontColor = UIColor.white
        //recentScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - recentScoreLabel.frame.height * 2.5)
        recentScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY + 100)
        addChild(recentScoreLabel)
        
        
        let highScoreLabel = SKLabelNode(text: "Highscore: " + "\(UserDefaults.standard.integer(forKey: "Highscore"))")
        highScoreLabel.fontName = "AvenirNext-Bold"
        highScoreLabel.fontSize = 40.0
        highScoreLabel.fontColor = UIColor.white
        //highScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - highScoreLabel.frame.size.height * 4)
        highScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(highScoreLabel)
    }
    
}
