//
//  ViewController.swift
//  BoutTime
//
//  Created by Gary Luce on 24/07/2016.
//  Copyright © 2016 gloos. All rights reserved.
//

import UIKit
import GameKit
import SafariServices

class ViewController: UIViewController {
    
    @IBOutlet var labels: [UILabel]!
    @IBAction func topButtonDownvote(sender: AnyObject) {
        swap(&labels[0].text, &labels[1].text)
        swap(&labels[0].tag, &labels[1].tag)
    }
    @IBAction func middleButtonDownvote(sender: AnyObject) {
        swap(&labels[1].text, &labels[2].text)
        swap(&labels[1].tag, &labels[2].tag)
    }
    @IBAction func bottomButtonDownvote(sender: AnyObject) {
        swap(&labels[2].text, &labels[3].text)
        swap(&labels[2].tag, &labels[3].tag)
    }
    @IBAction func topButtonUpvote(sender: AnyObject) {
        swap(&labels[1].text, &labels[0].text)
        swap(&labels[1].tag, &labels[0].tag)
    }
    @IBAction func middleButtonUpvote(sender: AnyObject) {
        swap(&labels[2].text, &labels[1].text)
        swap(&labels[2].tag, &labels[1].tag)
    }
    @IBAction func lastButtonUpvote(sender: AnyObject) {
        swap(&labels[3].text, &labels[2].text)
        swap(&labels[3].tag, &labels[2].tag)
    }
    @IBAction func nextRoundButton(sender: AnyObject) {
        if round >= 6 {
            //add view controller to display the score
            print("Presenting new VC")
            let vc =  self.storyboard?.instantiateViewControllerWithIdentifier("scoreController") as! ScoreViewController
            vc.score = totalScore
            self.presentViewController(vc, animated: true, completion: nil)
        } else {
            launchNextRound()
        }
        
    }
    @IBOutlet weak var nextRound: UIButton!
    
    var round: Int = 0
    var blacklist = [Int]()
    var yearsQuizRound = [Int]()
    var selectedYears = [Int]()
    var timer = NSTimer()
    var counter = 60
    var totalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(labels.count)
        displayQuestions()
        startTimer()
    }

    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            checkAnswers()
        }
    }

    //MARK: Populate text fields
    
    func displayQuestions() {
            for label in labels {
                let questionIndex = randomNumber()
                // we blacklist the index to make sure no event appears twice in a single round
                if blacklist.contains(questionIndex) {
                    //if the index is in the blacklist, we reset the properties and start again
                    reset()
                    displayQuestions()
                } else {
                blacklist.append(questionIndex)
                yearsQuizRound.append(events[questionIndex].year)
                label.text = events[questionIndex].name
                label.tag = events[questionIndex].year
                //We sort the years by ascending order
                yearsQuizRound.sortInPlace({ $0 < $1 })
                }
        }
           }
    
    func checkAnswers() {
        selectedYears.removeAll()
        for label in labels {
            selectedYears.append(label.tag)
        }
        // If the array of years the user has selected is equal to the array of years defined in the model, we present a green button and increase the total score and number of rounds played
        if selectedYears == yearsQuizRound {
            stopTimer()
            if let image = UIImage(named: "next_round_success") {
                nextRound.setImage(image, forState: .Normal)
            }
            totalScore += 1
            round += 1
            
        } else {
            if let image = UIImage(named: "next_round_fail") {
                nextRound.setImage(image, forState: .Normal)
            }
            round += 1
        }
    }
    
    //MARK: Helper methods
    
    func reset() {
        blacklist.removeAll()
        yearsQuizRound.removeAll()
        for label in labels {
            label.text = nil
        }
    }
    
    func launchNextRound() {
        nextRound.setImage(nil, forState: .Normal)
        reset()
        displayQuestions()
        startTimer()
    }
    
    
    func randomNumber() -> Int {
        return GKRandomSource.sharedRandom().nextIntWithUpperBound(events.count)
    }
    

    //MARK: Timer methods
    
    func startTimer() {
        self.counter = 60
        nextRound.setTitle(String(self.counter), forState: .Normal)
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func updateCounter() {
        if self.counter > 0 {
            nextRound.setTitle(String(self.counter--), forState: .Normal)
        } else if self.counter == 0 {
            stopTimer()
            checkAnswers()
            nextRound.setTitle(String(0), forState: .Normal)
        }
    }
    
    func stopTimer() {
         self.timer.invalidate()
    }
    


}

