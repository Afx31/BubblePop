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
    
    let centerContainerView = UIView()
    var playButton = UIButton()
    var inputTxtField = UITextField()
    var highScoreLabel = UILabel()
    var recentScoreLabel = UILabel()
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        setupLayout()
        addButtons()
        addInputTxtField()
        addLabels()
        setupConstraints()
    }
    
    func setupLayout() {
        //centerContainerView.backgroundColor = .red
        view?.addSubview(centerContainerView)
    }
    
    func setupConstraints() {
//        let topContainerView = UIView()
//        topContainerView.backgroundColor = .red
//        view?.addSubview(topContainerView)
//        topContainerView.translatesAutoresizingMaskIntoConstraints = false//
//        topContainerView.leadingAnchor.constraint(equalTo: view!.leadingAnchor).isActive = true
//        topContainerView.trailingAnchor.constraint(equalTo: view!.trailingAnchor).isActive = true
//        topContainerView.topAnchor.constraint(equalTo: view!.topAnchor).isActive = true
//        topContainerView.heightAnchor.constraint(equalTo: view!.heightAnchor, multiplier: 0.5).isActive = true
//        topContainerView.addSubview(playButton)
//        playButton.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
//        playButton.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        
        centerContainerView.translatesAutoresizingMaskIntoConstraints = false
        centerContainerView.centerXAnchor.constraint(equalTo: view!.centerXAnchor).isActive = true
        centerContainerView.centerYAnchor.constraint(equalTo: view!.centerYAnchor).isActive = true
        centerContainerView.widthAnchor.constraint(equalTo: view!.widthAnchor, multiplier: 0.7).isActive = true
        centerContainerView.heightAnchor.constraint(equalTo: view!.heightAnchor, multiplier: 0.7).isActive = true
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        playButton.centerYAnchor.constraint(equalTo: centerContainerView.centerYAnchor).isActive = true
        playButton.widthAnchor.constraint(equalTo: centerContainerView.widthAnchor, multiplier: 0.8).isActive = true
        playButton.heightAnchor.constraint(equalTo: centerContainerView.heightAnchor, multiplier: 0.1).isActive = true
        
        inputTxtField.translatesAutoresizingMaskIntoConstraints = false
        inputTxtField.centerXAnchor.constraint(equalTo: playButton.centerXAnchor).isActive = true
        inputTxtField.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: -60).isActive = true
        inputTxtField.widthAnchor.constraint(equalTo: centerContainerView.widthAnchor, multiplier: 0.8).isActive = true
        inputTxtField.heightAnchor.constraint(equalTo: centerContainerView.heightAnchor, multiplier: 0.1).isActive = true
        
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        highScoreLabel.centerXAnchor.constraint(equalTo: playButton.centerXAnchor).isActive = true
        highScoreLabel.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: +100).isActive = true
        
        recentScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        recentScoreLabel.centerXAnchor.constraint(equalTo: playButton.centerXAnchor).isActive = true
        recentScoreLabel.topAnchor.constraint(equalTo: highScoreLabel.bottomAnchor, constant: -100).isActive = true
    }
    
    func addButtons() {
        playButton = UIButton(frame: CGRect())
        //playButton.center.x = self.view!.center.x
        playButton.backgroundColor = .green
        playButton.setTitle("Tap to Play!", for: .normal)
        playButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        centerContainerView.addSubview(playButton)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let settingsScene = SettingsScene(size: view!.bounds.size)
        view!.presentScene(settingsScene)
        playButton.isHidden = true
        inputTxtField.isHidden = true
        highScoreLabel.isHidden = true
        recentScoreLabel.isHidden = true
        
        //centerContainerView.addSubview(playButton)
    }
    
    func addInputTxtField () {
        inputTxtField.frame = CGRect()
        inputTxtField.placeholder = "Enter your name here"
        inputTxtField.textColor = UIColor.black
        inputTxtField.backgroundColor = UIColor.white
        inputTxtField.borderStyle = UITextField.BorderStyle.roundedRect
        centerContainerView.addSubview(inputTxtField)
    }
    
    func addLabels() {
        highScoreLabel.text = "Highscore: " + "\(UserDefaults.standard.integer(forKey: "Highscore"))"
        highScoreLabel.font = UIFont.boldSystemFont(ofSize: 26)
        highScoreLabel.textColor = UIColor.white
        centerContainerView.addSubview(highScoreLabel)
        
        recentScoreLabel.text = "Recent score: " + "\(UserDefaults.standard.integer(forKey: "RecentScore"))"
        recentScoreLabel.font = UIFont.boldSystemFont(ofSize: 26)
        recentScoreLabel.textColor = UIColor.white
        centerContainerView.addSubview(recentScoreLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view?.endEditing(true)
    }
    
}
