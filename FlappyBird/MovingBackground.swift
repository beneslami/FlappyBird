//
//  MovingBackground.swift
//  FlappyBird
//
//  Created by Ben on 3/8/22.
//

import Foundation
import SpriteKit

class MovingBackground : SKSpriteNode{
    let MovingBackgroundTexture = SKTexture(imageNamed: "MovingBackground")
    let MovingGroundTexture = SKTexture(imageNamed: "MovingGround")
    
    init(size: CGSize){
        super.init(texture: nil, color: UIColor.white, size: CGSize(width: size.width, height: size.height))
        anchorPoint = CGPoint(x: 3, y: 1)
        position = CGPoint(x: 0.0, y: 0.0)
        
        var i:CGFloat = 0
        while i < 3 + self.frame.size.width/(MovingBackgroundTexture.size().width) {
            var groundsprite = SKSpriteNode(texture: MovingBackgroundTexture)
            groundsprite.zPosition = 0
            groundsprite.anchorPoint = CGPoint(x: 2, y: 2)
            groundsprite.position = CGPoint(x: i * groundsprite.size.width + 2, y: i)
            addChild(groundsprite)
            i += 1;
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func begin(){
        let moveGroundSprite = SKAction.moveBy(x: -MovingBackgroundTexture.size().width, y: 0, duration: TimeInterval(0.03*MovingBackgroundTexture.size().width))
        let resetGroundSprite = SKAction.moveBy(x: MovingBackgroundTexture.size().width, y: 0, duration: 0.0)
        let moveSequence = SKAction.sequence([moveGroundSprite, resetGroundSprite])
        run(SKAction.repeatForever(moveSequence))
    }
    
    
}
