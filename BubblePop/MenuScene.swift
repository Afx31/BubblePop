//
//  MenuScene.swift
//  BubblePop
//
//  Created by user144252 on 4/22/19.
//  Copyright © 2019 user144252. All rights reserved.
//

import SpriteKit
//import UIKit

class MenuScene: SKScene, UITextFieldDelegate {
    
    let playButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    let inputTextField = UITextField()
    //let temp = SKSpriteNode(imageNamed: "ball")
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        addButtons()
        addInputTextField()
        addLabels()
        
        /*temp.position = CGPoint(x: frame.midX, y: frame.midY)
        temp.name = "tempButton"
        temp.size = CGSize(width: 50, height: 50)
        addChild(temp)*/
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let gameScene = GameScene(size: view!.bounds.size)
        view!.presentScene(gameScene)
        playButton.isHidden = true
        inputTextField.isHidden = true
    }
    
    func addButtons() {
        playButton.backgroundColor = .green
        playButton.setTitle("Tap to Play!", for: .normal)
        playButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view?.addSubview(playButton)
    }
    
    func addInputTextField () {
        inputTextField.frame = CGRect(x: frame.midX / 2, y: frame.midY, width: 200, height: 30)
        inputTextField.placeholder = "Enter your name here"
        inputTextField.backgroundColor = UIColor.gray
        inputTextField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view?.addSubview(inputTextField)
    }
    
    func addLabels() {
        
        let playLabel = SKLabelNode(text: "Tap to Play!")
        playLabel.fontName = "AvenirNext-Bold"
        playLabel.fontSize = 50.0
        playLabel.fontColor = UIColor.white
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        //addChild(playLabel)
        //animation(label: playLabel)
        
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //let gameScene = GameScene(size: view!.bounds.size)
        //view!.presentScene(gameScene)
        /*
        if !temp.hasActions() {
            let gameScene = GameScene(size: view!.bounds.size)
            view!.presentScene(gameScene)
        }*/
        
    }
    
}
