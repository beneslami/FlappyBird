//
//  MovingForeground.swift
//  FlappyBird
//
//  Created by Ben on 3/31/22.
//

import Foundation
import SpriteKit

class MovingForeground : SKSpriteNode{
    let MovingForegroundTexture = SKTexture(imageNamed: "MovingForeground")
    let MovingGroundTexture = SKTexture(imageNamed: "MovingGround")
    
    init(size:CGSize){
        super.init(texture: nil, color: UIColor.white, size: CGSize(width: size.width, height: size.height))
        anchorPoint = CGPoint(x: 0, y: 0)
        position = CGPoint(x: 0.0, y: 0.0)
        
        var i:CGFloat = 0
        while i < 3 + self.frame.size.width/(MovingForegroundTexture.size().width) {
            var groundsprite = SKSpriteNode(texture: MovingForegroundTexture)
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
        let moveGroundSprite = SKAction.moveBy(x: -MovingForegroundTexture.size().width, y: 0, duration: TimeInterval(0.05*MovingForegroundTexture.size().width))
        let resetGroundSprite = SKAction.moveBy(x: MovingForegroundTexture.size().width, y: 0, duration: 0.0)
        let moveSequence = SKAction.sequence([moveGroundSprite, resetGroundSprite])
        run(SKAction.repeatForever(moveSequence))
    }
    
}
