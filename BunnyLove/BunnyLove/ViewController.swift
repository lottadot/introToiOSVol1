//
//  ViewController.swift
//  BunnyLove
//
//  Created by Shane Zatezalo on 3/24/16.
//  Copyright © 2016 Lottadot LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var bunnyProvider:BunnyProvider = {
        let bp = BunnyProvider.init()
        return bp
    }()
    
    lazy var scoreKeeper:ScoreKeeper = {
        let sc = ScoreKeeper.init()
        return sc
    }()
    
    @IBOutlet var bunnyImageView: UIImageView!
    @IBOutlet weak var cuteButton: UIButton!
    @IBOutlet weak var uglyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bunnyImageView.layer.borderColor = UIColor.whiteColor().CGColor
        bunnyImageView.layer.cornerRadius = CGRectGetWidth(self.bunnyImageView.frame) * 0.25
        bunnyImageView.clipsToBounds = true
        
        bunnyImageView.alpha = 0.0
        bunnyImageView.transform = CGAffineTransformMakeScale(0.0, 0.0)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        showFirstBunny()
        
        UIView.animateWithDuration(1.0) {
            self.bunnyImageView.transform = CGAffineTransformIdentity
            self.bunnyImageView.alpha = 1.0
        }
    }
    
    @IBAction func cuteButtonTapped(sender: AnyObject) {
        showNextBunny()
        scoreKeeper.upVote()
    }
    
    @IBAction func uglyButtonTapped(sender: AnyObject) {
        showNextBunny()
        scoreKeeper.downVote()
    }
    
    private func showFirstBunny() {
        guard let image = bunnyProvider.nextBunnyImage() else {
            return
        }
        self.bunnyImageView.image = image
    }
    
    private func showNextBunny() {
        guard let image = bunnyProvider.nextBunnyImage() else {
            showResults()
            return
        }
        
        //showAnimatedBunny(image)
        showAnimatedBunnyWithSpring(image)
    }
    
    private func showAnimatedBunny(image: UIImage) {
        
        self.bunnyImageView.transform = CGAffineTransformMakeScale(1, 1)
        UIView.animateWithDuration(0.5, animations: {
            self.bunnyImageView.transform = CGAffineTransformMakeScale(0.1, 0.1)
        }) { (completed) in
            
            if completed {
                UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: {
                    self.bunnyImageView.image = image
                    self.bunnyImageView.transform = CGAffineTransformIdentity
                    }, completion:  nil
                )
            }
        }
    }
    
    private func showAnimatedBunnyWithSpring(image: UIImage) {
        
        self.bunnyImageView.transform = CGAffineTransformMakeScale(1, 1)
        UIView.animateWithDuration(0.5, animations: {
            self.bunnyImageView.transform = CGAffineTransformMakeScale(0.1, 0.1)
        }) { (completed) in
            
            if completed {
                
                UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: .CurveEaseInOut, animations: {
                    self.bunnyImageView.image = image
                    self.bunnyImageView.transform = CGAffineTransformIdentity
                    
                    }, completion: nil)
            }
        }
    }
    
    private func showResults() {
        let (upvotes, downvotes) = scoreKeeper.score()
        let title = "Results"
        let message = "You voted for \(upvotes) cute bunnies and \(downvotes) ugly bunnies"
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction.init(title: title, style: .Default) { (action) -> Void in
            self.hideBunny()
        }
        alert.addAction(action)
        self.presentViewController(alert, animated: true) { () -> Void in
            
        }
    }
    
    private func hideBunny() {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.bunnyImageView.alpha = 0.0
        }
    }

}

