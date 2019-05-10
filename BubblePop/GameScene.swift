//
//  GameScene.swift
//  BubblePop
//
//  Created by William Mitchell on 4/22/19.
//  Copyright © 2019 William Mitchell. All rights reserved.
//
import SpriteKit
import UIKit

class GameScene: SKScene {
    
    let topContainerView = UIView()
    var bubbleArray: [SKShapeNode] = [SKShapeNode]()
    let bubbleLimit: Int = GameSettings.maxBubbles
    var randColor: Int?
    var randXPosition: Int?
    var randYPosition: Int?
    var gamePoints: Int = 0
    var scoreLabel = UILabel()
    var gameTimeLabel = UILabel()
    var highScoreLabel = UILabel()
    
    var prevScoreCalcTime: TimeInterval = 0
    var previousNode: Int?
    var moveDuration = GameSettings.maxTime
    
    //Set the game timer
    var gameTimerValue: Int = GameSettings.maxTime {
        didSet {
            gameTimeLabel.text = "Time left: \(gameTimerValue)"
        }
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        view.addSubview(topContainerView)
        addLabels()
        addGameTimer()
        setupConstraints()
    }
    
    //The Constraints function is used to create a inner view section where all the
    //variables can be positioned and anchored to one another
    func setupConstraints() {
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.topAnchor.constraint(equalTo: view!.topAnchor).isActive = true
        topContainerView.widthAnchor.constraint(equalTo: view!.widthAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: view!.heightAnchor, multiplier: 0.1).isActive = true
        
        gameTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        gameTimeLabel.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        gameTimeLabel.leftAnchor.constraint(equalTo: scoreLabel.leftAnchor, constant: -150).isActive = true
        //Centered variable
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        highScoreLabel.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        highScoreLabel.rightAnchor.constraint(equalTo: scoreLabel.rightAnchor, constant: +150).isActive = true
    }
    
    func addLabels() {
        gameTimeLabel.text = "Time left: \(gameTimerValue)"
        gameTimeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        gameTimeLabel.textColor = UIColor.white
        topContainerView.addSubview(gameTimeLabel)
        
        scoreLabel.text = "Score: \(gamePoints)"
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 20)
        scoreLabel.textColor = UIColor.white
        topContainerView.addSubview(scoreLabel)
        
        highScoreLabel.text = "Highscore: " + "\(UserDefaults.standard.integer(forKey: "HighScore1"))"
        highScoreLabel.font = UIFont.boldSystemFont(ofSize: 20)
        highScoreLabel.textColor = UIColor.white
        topContainerView.addSubview(highScoreLabel)
        
    }
    
    //The func counts down from the preset game timer until it hits zero
    //If the game timer equals zero, the user will be redirected to the GameOverScene
    func addGameTimer() {
        let wait = SKAction.wait(forDuration: 1.0)
        let block = SKAction.run ({
            [unowned self] in
            
            if self.gameTimerValue > 0 {
                self.gameTimerValue -= 1
            } else {
                self.calcHighScores()
                let gameOverScene = GameOverScene(size: self.view!.bounds.size)
                self.view?.presentScene(gameOverScene)
                self.scoreLabel.isHidden = true
                self.gameTimeLabel.isHidden = true
                self.highScoreLabel.isHidden = true
            }
        })
        let sequence = SKAction.sequence([wait, block])
        run(SKAction.repeatForever(sequence))
    }
    
    //The func runs every second, this is where the bubbles are respawned every second
    override func update(_ currentTime: TimeInterval) {
        if currentTime - prevScoreCalcTime > 1 {
            prevScoreCalcTime = currentTime
            resetSceneBubbles()
            while (bubbleArray.count !=  bubbleLimit) {
                spawnBubbles()
            }
        }
    }
    
    //The func resets the bubbles on screen every second
    func resetSceneBubbles() {
        while bubbleArray.count > 0 {
            bubbleArray[0].removeFromParent()
            bubbleArray.remove(at: 0)
        }
        bubbleArray.removeAll()
    }
    
    //The func calculates the points based upon what coloured bubble is touched
    //If the same coloured bubble is touched more than once in a row, the points
    //received are 1.5 * the base points
    func calcPoints(_ index:Int) {
        switch bubbleArray[index].fillColor {
        case BubbleColors.colors[0] :
            if previousNode == 0 { gamePoints += Int(1.5 * 1) }
            else { gamePoints += 1 }
            previousNode = 0
            
        case BubbleColors.colors[1] :
            if previousNode == 1 { gamePoints += Int(1.5 * 2) }
            else { gamePoints += 2 }
            previousNode = 1
            
        case BubbleColors.colors[2] :
            if previousNode == 2 { gamePoints += Int(1.5 * 5) }
            else { gamePoints += 5 }
            previousNode = 2
            
        case BubbleColors.colors[3] :
            if previousNode == 3 { gamePoints += Int(1.5 * 8) }
            else { gamePoints += 8 }
            previousNode = 3
            
        case BubbleColors.colors[4] :
            if previousNode == 4 { gamePoints += Int(1.5 * 10) }
            else { gamePoints += 10 }
            previousNode = 4
            
        default :
            print("Score Error")
        }
        scoreLabel.text = ("Score: \(gamePoints)")
    }
    
    //The func finds the given indexed based on the name in the array, and returns it
    func findIndex(_ name: String) -> Int {
        for i in 0..<bubbleArray.count {
            if name == bubbleArray[i].name {
                return i
            }
        }
        return -1
    }

    //The func passes the clicked bubble index name through to the findIndex func
    func isMatch(_ name: String) -> Bool {
        if(findIndex(name) != -1) {
            return true
        }
        return false
    }
    
    //The func is responsible for spawning the bubbles
    //The colour of the bubbles run off a probabilty system, done through a switch case
    func spawnBubbles() {
        let bubble = SKShapeNode(circleOfRadius: 35)
        
        //Creates random location for each bubble to spawn at
        randXPosition = Int.random(in: (Int(frame.minX+40)...(Int(frame.maxX-40))))
        randYPosition = Int.random(in: (Int(frame.minY+40)...(Int(frame.maxY-40))))
        bubble.position = CGPoint(x: randXPosition!, y: randYPosition!)
        
        randColor = Int.random(in: 0...100)
        switch randColor! {
        case 0..<6 :    //black
            bubble.fillColor = BubbleColors.colors[4]
            bubble.strokeColor = BubbleColors.colors[4]
        case 6..<16 :    //blue
            bubble.fillColor = BubbleColors.colors[3]
            bubble.strokeColor = BubbleColors.colors[3]
        case 16..<31 :    //green
            bubble.fillColor = BubbleColors.colors[2]
            bubble.strokeColor = BubbleColors.colors[2]
        case 31..<61 :    //pink
            bubble.fillColor = BubbleColors.colors[1]
            bubble.strokeColor = BubbleColors.colors[1]
        case 61..<100 :     //red
            bubble.fillColor = BubbleColors.colors[0]
            bubble.strokeColor = BubbleColors.colors[0]
        default :   //red
            bubble.fillColor = BubbleColors.colors[0]
            bubble.strokeColor = BubbleColors.colors[0]
        }
        
        //Checks for a empty location on the screen to spawn the bubbles, so none overlap
        var isPositionEmpty = true
        for i in 0..<bubbleArray.count {
            if(bubble.intersects(bubbleArray[i])) {
                isPositionEmpty = false
            }
        }
        //adds the bubble to be spawned if the random location is free
        if (isPositionEmpty) {
            bubble.name = String(bubbleArray.count)
            bubbleArray.append(bubble)
            addChild(bubble)
            
            //move bubbles up whilst playing
            let moveBy = randYPosition! + 1000
            bubble.run(SKAction.moveTo(y: CGFloat(moveBy), duration: Double(moveDuration)))
        }
    }
    
    //The func calculates the top 3 highscores with the associated players name
    //They are later used in the GameOverScene to display a scoreboard
    func calcHighScores() {
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
            UserDefaults.standard.set(HighScore2, forKey: "HighScore3")
            UserDefaults.standard.set(Player2, forKey: "Player3")
            
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //This func relates to a user touching the screen, checks if a bubble was actually clicked
        //If confirmed, points are calculated below and the individual bubble is removed from the scene
        //With another being spawned
        for touch in touches {
            let location = touch.location(in: self) //converts touch location into scene coordinates
            let touchedNode = self.atPoint(location)
                
            if let name = touchedNode.name {
                if isMatch(name) {
                    let index = findIndex(name)
                    calcPoints(index)
                    bubbleArray[index].removeFromParent()
                    bubbleArray.remove(at: index)
                    spawnBubbles()
                }
            }
        }
    }
    
}
