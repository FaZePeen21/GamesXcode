//
//  ViewController2.swift
//  ttt
//
//  Created by period8 on 4/21/22.
//

import UIKit

class ViewController2: UIViewController, UICollisionBehaviorDelegate {
    
 
    
    @IBOutlet weak var ball: UIView!
    @IBOutlet weak var paddle: UIView!
    
    var brick: UIView!
    var brickDynamicItem: UIDynamicItemBehavior!
    var bricks = [UIView]()
    var count = 64
    
    
    
    var dynamicAnimator: UIDynamicAnimator!
    var ballDynamicItem:  UIDynamicItemBehavior!
    var paddleDynamicItem: UIDynamicItemBehavior!
    var collisionBehavior: UICollisionBehavior!
    var pushBehavior: UIPushBehavior!
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ball.layer.cornerRadius = 25
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        
        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        
        pushBehavior.pushDirection = CGVector(dx: 10, dy: 10)
        
        pushBehavior.active = true
        pushBehavior.magnitude = 1
        
        
        dynamicAnimator.addBehavior(pushBehavior)
        
        
        
       paddleDynamicItem = UIDynamicItemBehavior(items: [paddle])
        paddleDynamicItem.allowsRotation = false
        paddleDynamicItem.density = 1000
        paddleDynamicItem.friction = 0.0
        paddleDynamicItem.elasticity = 0
        
        
        dynamicAnimator.addBehavior(paddleDynamicItem)
        
        ballDynamicItem = UIDynamicItemBehavior(items: [ball])
        ballDynamicItem.density = 2.5
        ballDynamicItem.resistance = 0
        ballDynamicItem.elasticity = 1.3
        ballDynamicItem.friction = 0
        dynamicAnimator.addBehavior(ballDynamicItem)
        
        for i in 0...7 {
        for r in 0...7 {
            brick = UIView(frame: CGRect(x: CGFloat(Double(i*50)+17.5), y: CGFloat(r*40+100), width: 40, height: 30))
            brick.backgroundColor = UIColor.black
            view.addSubview(brick)
        bricks.append(brick)
            
                        }
        }
        
        brickDynamicItem = UIDynamicItemBehavior(items: bricks)
        brickDynamicItem.density = 1000
        brickDynamicItem.friction = 0.0
        brickDynamicItem.elasticity = 0
        brickDynamicItem.allowsRotation = false
        brickDynamicItem.isAnchored = true
        
        dynamicAnimator.addBehavior(brickDynamicItem)
       
        collisionBehavior = UICollisionBehavior(items: [ball, paddle] + bricks)
        collisionBehavior.collisionMode = .everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        dynamicAnimator.addBehavior(collisionBehavior)
       
        collisionBehavior.collisionDelegate = self
    

        // Do any additional setup after loading the view.
    }
    
    
  
   
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        for i in bricks {
            if(item1.isEqual(ball) && item2.isEqual(i)) {
                i.isHidden = true
                i.removeFromSuperview()
                ballDynamicItem.removeItem(i)
                behavior.removeItem(i)
                count -= 1
            }
        }
    
        
       
        
        
        
        
       
    }
            
    
    @IBAction func panGestureMoved(_ sender: UIPanGestureRecognizer) {
        paddle.center = CGPoint(x: sender.location(in: view).x, y: 730)
        dynamicAnimator.updateItem(usingCurrentState: paddle)
    }
    
    
    
    
    @IBAction func resetButton(_ sender: Any) {
        reset()
    }
    func reset() {
            for i in 0...7 {
            for r in 0...7 {
                brick.willRemoveSubview(brick)
                brick = UIView(frame: CGRect(x: CGFloat(Double(i*50)+17.5), y: CGFloat(r*40+100), width: 40, height: 30))
                brick.backgroundColor = UIColor.black
                view.addSubview(brick)
            bricks.append(brick)
                brickDynamicItem = UIDynamicItemBehavior(items: bricks)
                brickDynamicItem.density = 1000
                brickDynamicItem.friction = 0.0
                brickDynamicItem.elasticity = 0
                brickDynamicItem.allowsRotation = false
                brickDynamicItem.isAnchored = true
                dynamicAnimator.addBehavior(brickDynamicItem)
                            }
            }
    
        
        
        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        
        pushBehavior.pushDirection = CGVector(dx: 10, dy: 10)
        
        pushBehavior.active = true
        pushBehavior.magnitude = 1
        
        
        dynamicAnimator.addBehavior(pushBehavior)
        ball.center = CGPoint(x: 177, y: 569)
        ballDynamicItem.elasticity = CGFloat.maximum(1.2, 1.2)
        ballDynamicItem.density = 0
        ballDynamicItem.resistance = 0
        ballDynamicItem.elasticity = 0
        ballDynamicItem.friction = 0
    
        ballDynamicItem.density = 3
        ballDynamicItem.resistance = 0
        ballDynamicItem.elasticity = 1.2
        ballDynamicItem.friction = 0
        dynamicAnimator.addBehavior(ballDynamicItem)
        collisionBehavior = UICollisionBehavior(items: [ball, paddle] + bricks)
        dynamicAnimator.addBehavior(collisionBehavior)
        collisionBehavior.collisionDelegate = self
        collisionBehavior.collisionMode = .everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
    
    
    
    
}



    
}
