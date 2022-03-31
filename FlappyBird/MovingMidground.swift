//
//  MovingMidground.swift
//  FlappyBird
//
//  Created by Ben on 3/31/22.
//

import Foundation
import SpriteKit

class MovingMidground : SKSpriteNode{
    let MovingMidgroundTexture = SKTexture(imageNamed: "MovingMidground")
    let MovingGroundTexture = SKTexture(imageNamed: "MovingGround")
    
    init(size:CGSize){
        super.init(texture: nil, color: UIColor.white, size: CGSize(width: MovingMidgroundTexture.size().width, height: MovingMidgroundTexture.size().height))
        anchorPoint = CGPoint(x: 0, y: 0)
        position = CGPoint(x: 0.0, y: 0.0)
        
        //looping the midground texture
        var i:CGFloat = 0
        while i < 3 + self.frame.size.width/(MovingMidgroundTexture.size().width) {
            var groundsprite = SKSpriteNode(texture: MovingMidgroundTexture)
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
        let moveGroundSprite = SKAction.moveBy(x: -MovingMidgroundTexture.size().width, y: 0, duration: TimeInterval(0.04*MovingMidgroundTexture.size().width))
        let resetGroundSprite = SKAction.moveBy(x: MovingMidgroundTexture.size().width, y: 0, duration: 0.0)
        let moveSequence = SKAction.sequence([moveGroundSprite, resetGroundSprite])
        run(SKAction.repeatForever(moveSequence))
    }
}
