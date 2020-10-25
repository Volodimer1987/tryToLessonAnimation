//
//  ViewController.swift
//  tryToLessonAnimation
//
//  Created by vladimir gennadievich on 20.10.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var viewForAnimation: UIImageView!

    @IBOutlet var xConstraint: NSLayoutConstraint!
    @IBOutlet var viewCenterYConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 

        animationTry7()
    }
    
    func firstAnimation() {
    viewForAnimation.animationImages = [UIImage(named: "pf"),
                                        UIImage(named: "ts"),
                                        UIImage(named: "ch"),
                                        UIImage(named: "cc")] as? [UIImage]
    viewForAnimation.animationDuration = 3
    viewForAnimation.startAnimating()
    }
    
    func secondAnimation() {
        UIView.animate(withDuration: 1.5, animations: {
            self.viewForAnimation.center = self.view.center
            self.viewForAnimation.alpha = 0
        })
    }
    
    func thirdAnimation() {
        UIView.animate(withDuration: 2, animations: {
            self.viewForAnimation.center = self.view.center
            self.viewForAnimation.transform = CGAffineTransform(rotationAngle: -3 * .pi/2).scaledBy(x: 1.5, y: 1.5).translatedBy(x: 0, y: +50)},
                       
            completion: { _ in
                UIView.animate(withDuration: 1.5) {
                    self.viewForAnimation.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                }
        })
    }
    func fouthAnimation() {
        self.viewForAnimation.frame.origin.x = 0
        
        UIView.animateKeyframes(withDuration: 2.5 , delay: 0.2,options: [.calculationModeLinear] ,animations: {
            self.viewForAnimation.frame.origin.x = self.view.bounds.maxX - self.viewForAnimation.frame.width
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.3) {
            self.viewForAnimation.backgroundColor = .red
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5)  {
                self.viewForAnimation.transform = .init(rotationAngle: .pi/2)
            }
        
        }, completion: nil)
    }
    
    func fiveAnimationsWithConstrains() {
        viewCenterYConstraint.constant = 0
        UIView.animate(withDuration: 2, animations: {
              self.xConstraint.constant = self.view.frame.maxX
              self.view.layoutIfNeeded()
            UIView.animate(withDuration: 1, animations: {
                self.xConstraint.constant = 0
                self.view.layoutIfNeeded()
            })
            
        })
    }
    func sixAnimations() {
        viewCenterYConstraint.constant = 0
        UIView.animateKeyframes(withDuration:2, delay: 1, options: [.repeat], animations: {
            self.xConstraint.constant = self.view.frame.maxX
            self.view.layoutIfNeeded()
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 1) {
                self.viewForAnimation.frame.origin.x = self.view.frame.maxX
            }
        }, completion: nil)
    }
    
    func animationTry7() {
        UIView.animateKeyframes(withDuration: 1, delay: 0.7, animations: {
            self.viewForAnimation.center = self.view.center
        }, completion: nil)
    }
    
}


 
