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


    @IBOutlet var textViews: [UITextView]!
    @IBAction func topButtonDownvote(sender: AnyObject) {
        swap(&textViews[0].text, &textViews[1].text)
        swap(&textViews[0].tag, &textViews[1].tag)
        print(selectedYears)
        print(yearsQuizRound)
    }
    @IBAction func middleButtonDownvote(sender: AnyObject) {
        swap(&textViews[1].text, &textViews[2].text)
        swap(&textViews[1].tag, &textViews[2].tag)
        print(selectedYears)
        print(yearsQuizRound)
    }
    @IBAction func bottomButtonDownvote(sender: AnyObject) {
        swap(&textViews[2].text, &textViews[3].text)
        swap(&textViews[2].tag, &textViews[3].tag)
        print(selectedYears)
        print(yearsQuizRound)
    }
    @IBAction func topButtonUpvote(sender: AnyObject) {
        swap(&textViews[1].text, &textViews[0].text)
        swap(&textViews[1].tag, &textViews[0].tag)
        print(selectedYears)
        print(yearsQuizRound)
    }
    @IBAction func middleButtonUpvote(sender: AnyObject) {
        swap(&textViews[2].text, &textViews[1].text)
        swap(&textViews[2].tag, &textViews[1].tag)
        print(selectedYears)
        print(yearsQuizRound)
    }
    @IBAction func lastButtonUpvote(sender: AnyObject) {
        swap(&textViews[3].text, &textViews[2].text)
        swap(&textViews[3].tag, &textViews[2].tag)
        print(selectedYears)
        print(yearsQuizRound)
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
    var isGameOver = false
    var totalScore = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(textViews.count)
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
        

        
            for textView in textViews {
                let questionIndex = randomNumber()
                if blacklist.contains(questionIndex) {
                    reset()
                    displayQuestions()
                } else {
                blacklist.append(questionIndex)
                yearsQuizRound.append(events[questionIndex].year)
                textView.text = events[questionIndex].name
                textView.tag = events[questionIndex].year
                print("Blacklist: \(blacklist)")
                yearsQuizRound.sortInPlace({ $0 < $1 })
                }
        }
           }
    
    func checkAnswers() {
        selectedYears.removeAll()
        for textView in textViews {
            selectedYears.append(textView.tag)
        }
        if selectedYears == yearsQuizRound {
            stopTimer()
            if let image = UIImage(named: "next_round_success") {
                nextRound.setImage(image, forState: .Normal)
            }
            totalScore += 1
            round += 1
            
        } else {
            print("Keep going!")
            print(selectedYears)
            print(yearsQuizRound)
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
        for textView in textViews {
            textView.text = nil
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
        if self.counter > 0 && isGameOver == false {
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

