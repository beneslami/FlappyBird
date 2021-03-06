//
//  GameScene.swift
//  FlappyBird
//
//  Created by Ben on 3/7/22.
//

import SpriteKit
import GameplayKit
import UIKit

class GameScene: SKScene {
    var movingGround : MovingGround!
    var movingBackground : MovingBackground!
    var movingMidGround : MovingMidground!
    var movingForeground : MovingForeground!
    
    var movingGroundTexture = SKTexture(imageNamed: "MovingGround")
    var MovingBackgroundTexture = SKTexture(imageNamed: "MovingBackground")
    let MovingMidgroundTexture = SKTexture(imageNamed: "MovingMidground")
    let MovingForegroundTexture = SKTexture(imageNamed: "MovingForeground")
    
    var skyColor = UIColor(red: 133.0/255.0, green: 197.0/255.0, blue: 207.0/255.0, alpha: 1.0)
    var moving = SKNode()
    
    
    var alreadyAddedToTheScene = Bool()
    override func didMove(to view: SKView) {
        addChild(moving)
        alreadyAddedToTheScene = false;
        backgroundColor = skyColor
        
        movingGround = MovingGround(size: CGSize(width: movingGroundTexture.size().width, height: movingGroundTexture.size().height))
        moving.addChild(movingGround)
        
        movingBackground = MovingBackground(size: CGSize(width: MovingBackgroundTexture.size().width, height: MovingBackgroundTexture.size().height))
        moving.addChild(movingBackground)
        
        //call an instance of the MovingMidground class
        movingMidGround = MovingMidground(size: CGSize(width: MovingMidgroundTexture.size().width, height: MovingMidgroundTexture.size().height))
        moving.addChild(movingMidGround)
        
        //call an instance of the movingforeground class
        movingForeground = MovingForeground(size: CGSize(width: MovingForegroundTexture.size().width, height: MovingForegroundTexture.size().height))
        moving.addChild(movingForeground)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addStuffTotheScene()
        alreadyAddedToTheScene = true
    }
        
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func addStuffTotheScene(){
        if (alreadyAddedToTheScene == false){
            movingGround.begin()
            movingBackground.begin()
            movingMidGround.begin()
            movingForeground.begin()
        }
    }
}
