//
//  MovingGround.swift
//  FlappyBird
//
//  Created by Ben on 3/7/22.
//

import Foundation
import SpriteKit

class MovingGround : SKSpriteNode{
    
    let MovingGroundTexture = SKTexture(imageNamed: "MovingGround")
    init(size: CGSize){
        super.init(texture: nil, color: UIColor.white, size: CGSize(width: size.width, height: size.height))
        anchorPoint = CGPoint(x: 2, y: 0)
        position = CGPoint(x: 0.0, y: 0.0)
        zPosition = 1
        
        var i:CGFloat = 0
        while i < 2 + self.frame.size.width/(MovingGroundTexture.size().width) {
            var groundsprite = SKSpriteNode(texture: MovingGroundTexture)
            groundsprite.zPosition = 0
            groundsprite.anchorPoint = CGPoint(x: 1, y: 7.26)
            groundsprite.position = CGPoint(x: i * groundsprite.size.width + 0.9, y: i)
            addChild(groundsprite)
            i += 1;
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func begin(){
        let movingGroundSprite = SKAction.moveBy(x: -MovingGroundTexture.size().width, y: 0, duration: TimeInterval(0.004*MovingGroundTexture.size().width))
        let resetGroundSprite = SKAction.moveBy(x: MovingGroundTexture.size().width, y: 0, duration: 0.0)
        let moveSequence = SKAction.sequence([movingGroundSprite, resetGroundSprite])
        run(SKAction.repeatForever(moveSequence))
    }
}
