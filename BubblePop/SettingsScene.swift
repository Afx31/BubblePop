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
    
    let centerContainerView = UIView()
    var playButton = UIButton()
    var gameTimeLabel = UILabel()
    var maxBubblesLabel = UILabel()
    var gameTimeSlider = UISlider()
    var maxBubblesSlider = UISlider()
    
    var tempMaxTime = GameSettings.maxTime
    var tempMaxBubbles = GameSettings.maxBubbles
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        view.addSubview(centerContainerView)
        addSliders()
        addButtons()
        addLabels()
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
        
        gameTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        gameTimeLabel.centerXAnchor.constraint(equalTo: playButton.centerXAnchor).isActive = true
        gameTimeLabel.topAnchor.constraint(equalTo: gameTimeSlider.topAnchor, constant: -60).isActive = true
        
        gameTimeSlider.translatesAutoresizingMaskIntoConstraints = false
        gameTimeSlider.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        gameTimeSlider.bottomAnchor.constraint(equalTo: maxBubblesLabel.topAnchor, constant: -30).isActive = true
        gameTimeSlider.widthAnchor.constraint(equalTo: centerContainerView.widthAnchor).isActive = true
        gameTimeSlider.heightAnchor.constraint(equalTo: centerContainerView.heightAnchor, multiplier: 0.1).isActive = true
        //Centered variable
        maxBubblesLabel.translatesAutoresizingMaskIntoConstraints = false
        maxBubblesLabel.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        maxBubblesLabel.centerYAnchor.constraint(equalTo: centerContainerView.centerYAnchor).isActive = true
        
        maxBubblesSlider.translatesAutoresizingMaskIntoConstraints = false
        maxBubblesSlider.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        maxBubblesSlider.topAnchor.constraint(equalTo: maxBubblesLabel.bottomAnchor, constant: +30).isActive = true
        maxBubblesSlider.widthAnchor.constraint(equalTo: centerContainerView.widthAnchor).isActive = true
        maxBubblesSlider.heightAnchor.constraint(equalTo: centerContainerView.heightAnchor, multiplier: 0.1).isActive = true
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        playButton.topAnchor.constraint(equalTo: maxBubblesSlider.bottomAnchor, constant: +80).isActive = true
        playButton.widthAnchor.constraint(equalTo: centerContainerView.widthAnchor, multiplier: 0.8).isActive = true
        playButton.heightAnchor.constraint(equalTo: centerContainerView.heightAnchor, multiplier: 0.1).isActive = true
    }

    func addButtons() {
        playButton = UIButton(frame: CGRect())
        playButton.backgroundColor = .green
        playButton.setTitle("Lets Play!", for: .normal)
        playButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        centerContainerView.addSubview(playButton)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        GameSettings.maxTime = tempMaxTime
        GameSettings.maxBubbles = tempMaxBubbles
        
        let gameIntroScene = GameIntroScene(size: self.view!.bounds.size)
        self.view!.presentScene(gameIntroScene)
        playButton.isHidden = true
        gameTimeSlider.isHidden = true
        maxBubblesSlider.isHidden = true
        gameTimeLabel.isHidden = true
        maxBubblesLabel.isHidden = true
    }
    
    func addSliders() {
        gameTimeSlider = UISlider(frame: CGRect(x: 10, y: 100, width: 300, height: 20))
        gameTimeSlider.minimumValue = 1
        gameTimeSlider.maximumValue = 60
        gameTimeSlider.value = Float(GameSettings.maxTime)
        gameTimeSlider.isContinuous = true
        gameTimeSlider.tintColor = UIColor.white
        gameTimeSlider.addTarget(self, action: #selector(gameTimeSliderAction), for: .valueChanged)
        centerContainerView.addSubview(gameTimeSlider)
        
        maxBubblesSlider = UISlider(frame: CGRect(x: 10, y: 300, width: 300, height: 20))
        maxBubblesSlider.minimumValue = 1
        maxBubblesSlider.maximumValue = 15
        maxBubblesSlider.value = Float(GameSettings.maxBubbles)
        maxBubblesSlider.isContinuous = true
        maxBubblesSlider.tintColor = UIColor.white
        maxBubblesSlider.addTarget(self, action: #selector(maxBubblesSliderSliderAction), for: .valueChanged)
        centerContainerView.addSubview(maxBubblesSlider)
    }
    
    @objc func gameTimeSliderAction(sender: UISlider!) {
        tempMaxTime = Int(sender.value)
        gameTimeLabel.text = "Game time: \(tempMaxTime)"
    }
    
    @objc func maxBubblesSliderSliderAction(sender: UISlider!) {
        tempMaxBubbles = Int(sender.value)
        maxBubblesLabel.text = "Maximum Bubbles: \(tempMaxBubbles)"
    }
    
    func addLabels() {
        gameTimeLabel.text = "Game Time: \(tempMaxTime)"
        gameTimeLabel.font = UIFont.boldSystemFont(ofSize: 26)
        gameTimeLabel.textColor = UIColor.white
        centerContainerView.addSubview(gameTimeLabel)
        
        maxBubblesLabel.text = "Maximum Bubbles: \(tempMaxBubbles)"
        maxBubblesLabel.font = UIFont.boldSystemFont(ofSize: 26)
        maxBubblesLabel.textColor = UIColor.white
        centerContainerView.addSubview(maxBubblesLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view?.endEditing(true)
    }
    
}
