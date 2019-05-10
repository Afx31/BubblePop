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
    
    let centerContainerView = UIView()
    var menuButton = UIButton()
    var playAgainButton = UIButton()
    var gameOverLabel = UILabel()
    var recentScoreLabel = UILabel()
    var highScoreLabel = UILabel()
    
    var highScore1Label = UILabel()
    var highScore2Label = UILabel()
    var highScore3Label = UILabel()    
    var player1: String?
    var player2: String?
    var player3: String?
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        view.addSubview(centerContainerView)
        addLabels()
        addButtons()
        setupConstraints()
    }
    
    //The Constraints function is used to create a inner view section where all the
    //variables can be positioned and anchored to one another
    func setupConstraints() {
        centerContainerView.translatesAutoresizingMaskIntoConstraints = false
        centerContainerView.centerXAnchor.constraint(equalTo: view!.centerXAnchor).isActive = true
        centerContainerView.centerYAnchor.constraint(equalTo: view!.centerYAnchor).isActive = true
        centerContainerView.widthAnchor.constraint(equalTo: view!.widthAnchor, multiplier: 0.7).isActive = true
        centerContainerView.heightAnchor.constraint(equalTo: view!.heightAnchor, multiplier: 0.7).isActive = true
        
        gameOverLabel.translatesAutoresizingMaskIntoConstraints = false
        gameOverLabel.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        gameOverLabel.bottomAnchor.constraint(equalTo: recentScoreLabel.topAnchor, constant: -50).isActive = true
        
        recentScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        recentScoreLabel.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        recentScoreLabel.bottomAnchor.constraint(equalTo: highScoreLabel.topAnchor, constant: -30).isActive = true
        
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        highScoreLabel.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        highScoreLabel.bottomAnchor.constraint(equalTo: highScore1Label.topAnchor, constant: -30).isActive = true
        
        highScore1Label.translatesAutoresizingMaskIntoConstraints = false
        highScore1Label.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        highScore1Label.bottomAnchor.constraint(equalTo: highScore2Label.topAnchor, constant: -30).isActive = true
        
        //Centered variable
        highScore2Label.translatesAutoresizingMaskIntoConstraints = false
        highScore2Label.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        highScore2Label.centerYAnchor.constraint(equalTo: centerContainerView.centerYAnchor).isActive = true
        
        highScore3Label.translatesAutoresizingMaskIntoConstraints = false
        highScore3Label.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        highScore3Label.topAnchor.constraint(equalTo: highScore2Label.bottomAnchor, constant: +30).isActive = true
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        menuButton.topAnchor.constraint(equalTo: highScore3Label.bottomAnchor, constant: +50).isActive = true
        menuButton.widthAnchor.constraint(equalTo: centerContainerView.widthAnchor, multiplier: 0.8).isActive = true
        menuButton.heightAnchor.constraint(equalTo: centerContainerView.heightAnchor, multiplier: 0.1).isActive = true
        
        playAgainButton.translatesAutoresizingMaskIntoConstraints = false
        playAgainButton.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        playAgainButton.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: +50).isActive = true
        playAgainButton.widthAnchor.constraint(equalTo: centerContainerView.widthAnchor, multiplier: 0.8).isActive = true
        playAgainButton.heightAnchor.constraint(equalTo: centerContainerView.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    func addButtons() {
        menuButton = UIButton(frame: CGRect())
        menuButton.backgroundColor = .green
        menuButton.setTitle("Menu", for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        centerContainerView.addSubview(menuButton)
        
        playAgainButton = UIButton(frame: CGRect())
        playAgainButton.backgroundColor = .red
        playAgainButton.setTitle("Play Again!", for: .normal)
        playAgainButton.addTarget(self, action: #selector(playAgainButtonAction), for: .touchUpInside)
        centerContainerView.addSubview(playAgainButton)
    }
    
    @objc func menuButtonAction(sender: UIButton!) {
        let menuScene = MenuScene(size: view!.bounds.size)
        view!.presentScene(menuScene)
        menuButton.isHidden = true
        playAgainButton.isHidden = true
        gameOverLabel.isHidden = true
        recentScoreLabel.isHidden = true
        highScoreLabel.isHidden = true
        highScore1Label.isHidden = true
        highScore2Label.isHidden = true
        highScore3Label.isHidden = true
    }
    @objc func playAgainButtonAction(sender: UIButton!) {
        let settingsScene = SettingsScene(size: view!.bounds.size)
        view!.presentScene(settingsScene)
        menuButton.isHidden = true
        playAgainButton.isHidden = true
        gameOverLabel.isHidden = true
        recentScoreLabel.isHidden = true
        highScoreLabel.isHidden = true
        highScore1Label.isHidden = true
        highScore2Label.isHidden = true
        highScore3Label.isHidden = true
    }
    
    func addLabels() {
        gameOverLabel.text = "Game Over"
        gameOverLabel.font = UIFont.boldSystemFont(ofSize: 50)
        gameOverLabel.textColor = UIColor.red
        centerContainerView.addSubview(gameOverLabel)
        
        recentScoreLabel.text = "Your score: " + "\(UserDefaults.standard.integer(forKey: "RecentScore"))"
        recentScoreLabel.font = UIFont.boldSystemFont(ofSize: 30)
        recentScoreLabel.textColor = UIColor.white
        centerContainerView.addSubview(recentScoreLabel)
        
        highScoreLabel.text = "Highscore Board"
        highScoreLabel.font = UIFont.boldSystemFont(ofSize: 30)
        highScoreLabel.textColor = UIColor.white
        centerContainerView.addSubview(highScoreLabel)
        
        highScore1Label.text = "\(UserDefaults.standard.string(forKey: "Player1") ?? "N/A")" + ": " + "\(UserDefaults.standard.integer(forKey: "HighScore1"))"
        highScore1Label.font = UIFont.boldSystemFont(ofSize: 26)
        highScore1Label.textColor = UIColor.white
        centerContainerView.addSubview(highScore1Label)
        
        highScore2Label.text = "\(UserDefaults.standard.string(forKey: "Player2") ?? "N/A")" + ": " + "\(UserDefaults.standard.integer(forKey: "HighScore2"))"
        highScore2Label.font = UIFont.boldSystemFont(ofSize: 26)
        highScore2Label.textColor = UIColor.white
        centerContainerView.addSubview(highScore2Label)
        
        highScore3Label.text = "\(UserDefaults.standard.string(forKey: "Player3") ?? "N/A")" + ": " + "\(UserDefaults.standard.integer(forKey: "HighScore3"))"
        highScore3Label.font = UIFont.boldSystemFont(ofSize: 26)
        highScore3Label.textColor = UIColor.white
        centerContainerView.addSubview(highScore3Label)
    }
    
}
