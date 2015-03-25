//
//  GameScene.swift
//  Game1
//
//  Created by Administrator on 2015-03-14.
//  Copyright (c) 2015 MH. All rights reserved.
//

import SpriteKit


class GameScene: SKScene{
    
    var selectedNodes:[UITouch:SKSpriteNode] = [UITouch:SKSpriteNode]()
    
    override func didMoveToView(view: SKView) {
        
        
        // set up the background image
        var bgImage = SKSpriteNode(imageNamed: "ColourBackground-1") // Colour Background
        bgImage.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        bgImage.zPosition = -1.0
        bgImage.size = self.size
        self.addChild(bgImage)
               
        
        
        
        
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        for touch:AnyObject in touches{
            var location = touch.locationInNode(self)
            //var location = touch.locationInView(self)
            //let node:SKSpriteNode? = self.nodeAtPoint(location) as? SKSpriteNode // only need this if there is an existing node
            
            //let touchObj = touch as UITouch
            //selectedNodes[touchObj] = node!
            
            println("Touch Began \(location)")
            
            
            // Add in the node
            
            
            var hero = SKSpriteNode(imageNamed: "Player")
            hero.name = "player"
            
            // Make sure it is not off of the screen.
            hero.position = location
            self.addChild(hero)
            
            
            let touchObj = touch as UITouch
            selectedNodes[touchObj] = hero
            
        }
        
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        for touch:AnyObject in touches {
            //println("touhex count \(touches.count)")
            let location = touch.locationInNode(self)
            let touchObj = touch as UITouch
            
            //println("Touches moved current loc:  \(location)")
            
            // Update the position of the sprites
            if let node:SKSpriteNode? = selectedNodes[touchObj] {
                if (node?.name == "player" || node?.name == "bar")
                {
                    let size:CGFloat = CGFloat(node!.size.width)/2
                    node?.position = location
                    
                }
            }
            
        }
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        for touch:AnyObject in touches {
            let touchObj = touch as UITouch
            let location = touch.locationInNode(self)
            
            println("Touch Ended \(location)")
            
            if let exists:AnyObject? = selectedNodes[touchObj] {
                println("attempt to remove")
                let node:SKSpriteNode? = self.nodeAtPoint(location) as? SKSpriteNode
                println("ended touch locaiton \(location)")
                println("ended npde position \(node?.position)")
                
                for (node) in selectedNodes{
                    println("Touch n1 \(node.1.position)")
                }
                
                if (node?.name == "player" || node?.name == "bar")
                {
                    println("removed")
                    node?.removeFromParent()
                    selectedNodes[touchObj] = nil
                }
            }
            
            
        }
        
        
    }
    
    override func touchesCancelled(touches: NSSet, withEvent event: UIEvent) {
        println("Touch Cancelled")
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
    }
    
}
