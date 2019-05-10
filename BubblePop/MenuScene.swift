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
    let logoImage = UIImage(named: "logo")
    var imageLogoView = UIImageView()
    var playButton = UIButton()
    var inputTxtField = UITextField()
    var inputErrorLabel = UILabel()
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        view.addSubview(centerContainerView)
        addLogo()
        addButton()
        addInputTxtField()
        addLabel()
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
        
        imageLogoView.translatesAutoresizingMaskIntoConstraints = false
        imageLogoView.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        imageLogoView.bottomAnchor.constraint(equalTo: inputTxtField.topAnchor, constant: -150).isActive = true
        //Centered variable
        inputTxtField.translatesAutoresizingMaskIntoConstraints = false
        inputTxtField.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        inputTxtField.centerYAnchor.constraint(equalTo: centerContainerView.centerYAnchor).isActive = true
        inputTxtField.widthAnchor.constraint(equalTo: centerContainerView.widthAnchor, multiplier: 0.8).isActive = true
        inputTxtField.heightAnchor.constraint(equalTo: centerContainerView.heightAnchor, multiplier: 0.1).isActive = true
        
        inputErrorLabel.translatesAutoresizingMaskIntoConstraints = false
        inputErrorLabel.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        inputErrorLabel.topAnchor.constraint(equalTo: inputTxtField.bottomAnchor, constant: +10).isActive = true
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        playButton.topAnchor.constraint(equalTo: inputTxtField.bottomAnchor, constant: +100).isActive = true
        playButton.widthAnchor.constraint(equalTo: centerContainerView.widthAnchor, multiplier: 0.8).isActive = true
        playButton.heightAnchor.constraint(equalTo: centerContainerView.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    func addLogo() {
        imageLogoView = UIImageView(image: logoImage)
        centerContainerView.addSubview(imageLogoView)
    }
    
    func addButton() {
        playButton = UIButton(frame: CGRect())
        playButton.backgroundColor = .green
        playButton.setTitle("Tap to Play!", for: .normal)
        playButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        centerContainerView.addSubview(playButton)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        if !(inputTxtField.text?.isEmpty)! {
            UserDefaults.standard.set(inputTxtField.text, forKey: "CurrentPlayerName")
            let settingsScene = SettingsScene(size: view!.bounds.size)
            view!.presentScene(settingsScene)
            imageLogoView.isHidden = true
            playButton.isHidden = true
            inputTxtField.isHidden = true
            inputErrorLabel.isHidden = true
        } else {
            //Error message displayed if user doesn't enter a name
            inputErrorLabel.isHidden = false
        }
    }
    
    func addInputTxtField() {
        inputTxtField.frame = CGRect()
        inputTxtField.placeholder = "Enter your name here"
        inputTxtField.textColor = UIColor.black
        inputTxtField.backgroundColor = UIColor.white
        inputTxtField.borderStyle = UITextField.BorderStyle.roundedRect
        centerContainerView.addSubview(inputTxtField)
    }
    
    func addLabel() {
        inputErrorLabel.text = "Please enter your name"
        inputErrorLabel.font = UIFont.boldSystemFont(ofSize: 25)
        inputErrorLabel.textColor = UIColor.red
        inputErrorLabel.isHidden = true
        centerContainerView.addSubview(inputErrorLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view?.endEditing(true)
    }
    
}
