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
    var inputTxtField = UITextField()
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        //setupLayout()
        addButtons()
        addInputTxtField()
        addLabels()        
    }
    
//    func setupLayout() {
//        let topContainerView = UIView()
//        topContainerView.backgroundColor = .blue
//        view?.addSubview(topContainerView)
//
//        topContainerView.translatesAutoresizingMaskIntoConstraints = false
//
//        topContainerView.leadingAnchor.constraint(equalTo: view!.leadingAnchor).isActive = true
//        topContainerView.trailingAnchor.constraint(equalTo: view!.trailingAnchor).isActive = true
//        topContainerView.topAnchor.constraint(equalTo: view!.topAnchor).isActive = true
//        topContainerView.heightAnchor.constraint(equalTo: view!.heightAnchor, multiplier: 0.5).isActive = true
//
//        topContainerView.addSubview(playButton)
//        playButton.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
//        playButton.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
//
//    }
    
    @objc func buttonAction(sender: UIButton!) {
        let settingsScene = SettingsScene(size: view!.bounds.size)
        view!.presentScene(settingsScene)
        playButton.isHidden = true
        inputTxtField.isHidden = true
    }
    
    func addButtons() {
        playButton = UIButton(frame: CGRect(x: frame.midX, y: frame.midY - 100, width: 120, height: 80))
        playButton.center.x = self.view!.center.x
        playButton.backgroundColor = .green
        playButton.setTitle("Tap to Play!", for: .normal)
        playButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view?.addSubview(playButton)
    }
    
    func addInputTxtField () {
        inputTxtField.frame = CGRect(x: frame.midX, y: frame.midY, width: 250, height: 40)
        inputTxtField.center.x = self.view!.center.x
        inputTxtField.placeholder = "Enter your name here"
        inputTxtField.textColor = UIColor.black
        inputTxtField.backgroundColor = UIColor.white
        inputTxtField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view?.addSubview(inputTxtField)
    }
    
    func addLabels() {
        let highScoreLabel = SKLabelNode(text: "Highscore: " + "\(UserDefaults.standard.integer(forKey: "Highscore"))")
        highScoreLabel.fontName = "ArialMT"
        highScoreLabel.fontSize = 40.0
        highScoreLabel.fontColor = UIColor.white
        highScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - highScoreLabel.frame.size.height * 4)
        addChild(highScoreLabel)
        
        let recentScoreLabel = SKLabelNode(text: "Recent score: " + "\(UserDefaults.standard.integer(forKey: "RecentScore"))")
        recentScoreLabel.fontName = "ArialMT"
        recentScoreLabel.fontSize = 40.0
        recentScoreLabel.fontColor = UIColor.white
        recentScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - recentScoreLabel.frame.height*2.5)
        addChild(recentScoreLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view?.endEditing(true)
    }
    
}
