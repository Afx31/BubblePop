//
//  SettingsScene.swift
//  BubblePop
//
//  Created by William Mitchell on 5/5/19.
//  Copyright © 2019 William Mitchell. All rights reserved.
//
import SpriteKit
import UIKit

class SettingsScene: SKScene {
    
    var playButton = UIButton()
    var gameTimeTxtField = UITextField()
    var maxBubblesTxtField = UITextField()
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        addButtons()
        addTxtFields()
        addLabels()
    }
    
    @objc func buttonAction(sender: UIButton!) {
        UserDefaults.standard.set(self.gameTimeTxtField.text!, forKey: "GameTime")
        UserDefaults.standard.set(self.maxBubblesTxtField.text!, forKey: "MaxBubbles")
        let gameIntroScene = GameIntroScene(size: self.view!.bounds.size)
        self.view!.presentScene(gameIntroScene)
        playButton.isHidden = true
        gameTimeTxtField.isHidden = true
        maxBubblesTxtField.isHidden = true
    }

    func addButtons() {
        playButton = UIButton(frame: CGRect(x: frame.midX, y: frame.midY + 200, width: 120, height: 80))
        playButton.center.x = self.view!.center.x
        playButton.backgroundColor = .green
        playButton.setTitle("Lets Play!", for: .normal)
        playButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view?.addSubview(playButton)
    }
    
    func addTxtFields() {
        gameTimeTxtField.frame = CGRect(x: frame.midX, y: frame.midY - 100, width: 120, height: 80)
        gameTimeTxtField.center.x = self.view!.center.x
        gameTimeTxtField.backgroundColor = UIColor.white
        gameTimeTxtField.textColor = UIColor.black
        gameTimeTxtField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view?.addSubview(gameTimeTxtField)
        
        maxBubblesTxtField.frame = CGRect(x: frame.midX, y: frame.midY + 60, width: 120, height: 80)
        maxBubblesTxtField.center.x = self.view!.center.x
        maxBubblesTxtField.backgroundColor = UIColor.white
        maxBubblesTxtField.textColor = UIColor.black
        maxBubblesTxtField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view?.addSubview(maxBubblesTxtField)        
    }
    
    func addLabels() {
        let gameTimeLabel = SKLabelNode(text: "Game time: _ / 60 secs")
        gameTimeLabel.fontName = "ArialMT"
        gameTimeLabel.fontSize = 30
        gameTimeLabel.fontColor = UIColor.white
        gameTimeLabel.position = CGPoint(x: frame.midX, y: frame.midY + 120)
        addChild(gameTimeLabel)
        
        let maxBubblesLabel = SKLabelNode(text: "Maximum bubbles: _ / 15")
        maxBubblesLabel.fontName = "ArialMT"
        maxBubblesLabel.fontSize = 30
        maxBubblesLabel.fontColor = UIColor.white
        maxBubblesLabel.position = CGPoint(x: frame.midX, y: frame.midY - 40)
        addChild(maxBubblesLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view?.endEditing(true)
    }
    
}
