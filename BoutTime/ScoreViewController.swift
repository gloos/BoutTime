//
//  ScoreViewController.swift
//  BoutTime
//
//  Created by Gary on 27/07/2016.
//  Copyright © 2016 gloos. All rights reserved.
//

import Foundation
import UIKit

class ScoreViewController: UIViewController {
    
    var score = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        scoreLabel.text = "Your score is \(score)/6"
    }

}