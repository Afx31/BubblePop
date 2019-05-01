//
//  MenuScene.swift
//  BubblePop
//
//  Created by William Mitchell on 4/22/19.
//  Copyright © 2019 William Mitchell. All rights reserved.
//

import SpriteKit
import UIKit

class MenuScene: SKScene, UITextFieldDelegate {
    
    var playButton = UIButton()
    var inputTextField = UITextField()
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        addButtons()
        addInputTextField()
        addLabels()
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let gameIntroScene = GameIntroScene(size: view!.bounds.size)
        view!.presentScene(gameIntroScene)
        playButton.isHidden = true
        inputTextField.isHidden = true
    }
    
    func addButtons() {
        playButton = UIButton(frame: CGRect(x: frame.midX, y: frame.midY - 100, width: 100, height: 50))
        playButton.center.x = self.view!.center.x
        playButton.backgroundColor = .green
        playButton.setTitle("Tap to Play!", for: .normal)
        playButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view?.addSubview(playButton)
    }
    
    func addInputTextField () {
        inputTextField.frame = CGRect(x: frame.midX, y: frame.midY, width: 200, height: 30)
        inputTextField.center.x = self.view!.center.x
        inputTextField.placeholder = "Enter your name here"
        inputTextField.backgroundColor = UIColor.gray
        inputTextField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view?.addSubview(inputTextField)
    }
    
    func addLabels() {
        
        let highScoreLabel = SKLabelNode(text: "Highscore: " + "\(UserDefaults.standard.integer(forKey: "Highscore"))")
        highScoreLabel.fontName = "AvenirNext-Bold"
        highScoreLabel.fontSize = 40.0
        highScoreLabel.fontColor = UIColor.white
        highScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - highScoreLabel.frame.size.height * 4)
        addChild(highScoreLabel)
        
        let recentScoreLabel = SKLabelNode(text: "Recent score: " + "\(UserDefaults.standard.integer(forKey: "RecentScore"))")
        recentScoreLabel.fontName = "AvenirNext-Bold"
        recentScoreLabel.fontSize = 40.0
        recentScoreLabel.fontColor = UIColor.white
        recentScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - recentScoreLabel.frame.height*2.5)
        addChild(recentScoreLabel)
        
    }
    
}
