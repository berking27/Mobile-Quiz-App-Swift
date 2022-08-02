//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
     @IBOutlet weak var scoreLabel: UILabel!
     @IBOutlet weak var questionLabel: UILabel!
     @IBOutlet weak var progressBar: UIProgressView!
     @IBOutlet weak var choice1Button: UIButton!
     @IBOutlet weak var choice2Button: UIButton!
     @IBOutlet weak var choice3Button: UIButton!
     
     
     var quizBrain = QuizBrain()
     var score = 0
     
    
     
     
     override func viewDidLoad() {
        super.viewDidLoad()
          
          updateUI()

     }

     @IBAction func answerButtonPressed(_ sender: UIButton) {
          let userAnswer = sender.currentTitle!
          let userGotItRight = quizBrain.checkAnswer(userAnswer)
          
          
          if userGotItRight {
               
               sender.backgroundColor = UIColor.green
          }
          else {
               sender.backgroundColor = UIColor.red
          }
          
          quizBrain.nextQuestion()
        
          Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateUI),userInfo: nil, repeats: false)
     }
     
     @objc func updateUI(){
          let answerChoices = quizBrain.getAnswers()
          choice1Button.setTitle(answerChoices[0], for: .normal)
          choice2Button.setTitle(answerChoices[1], for: .normal)
          choice3Button.setTitle(answerChoices[2], for: .normal)
          
          questionLabel.text = quizBrain.getQuestionText()
          progressBar.progress = quizBrain.getProgress()
          scoreLabel.text = "Score: \(quizBrain.getScore())"
          choice1Button.backgroundColor = UIColor.clear
          choice2Button.backgroundColor = UIColor.clear
          choice3Button.backgroundColor = UIColor.clear

     }
     
}

