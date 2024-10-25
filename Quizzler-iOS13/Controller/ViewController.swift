//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
	@IBOutlet weak var questionLabel: UILabel!
	@IBOutlet weak var progrssBar: UIProgressView!
	@IBOutlet weak var scoreText: UILabel!
	
	@IBOutlet weak var answerBtn1: UIButton!
	@IBOutlet weak var answerBtn2: UIButton!
	@IBOutlet weak var answerBtn3: UIButton!
	
	var quizBrain = QuizBrain()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		questionLabel.text = quizBrain.getQuestionText()
		progrssBar.progress = quizBrain.getProcess()
		
		answerBtn1.setTitle(quizBrain.getAnswerText(btn: 0), for: .normal)
		answerBtn2.setTitle(quizBrain.getAnswerText(btn: 1), for: .normal)
		answerBtn3.setTitle(quizBrain.getAnswerText(btn: 2), for: .normal)
				
	}
	
	
	@IBAction func answerBtnPressed(_ sender: UIButton) {
		let userAnswer = sender.titleLabel?.text
		let userGotItRight = quizBrain.checkAnswer(userAnswer!)
		
		if userGotItRight {
			sender.backgroundColor = UIColor.green
		} else {
			sender.backgroundColor = UIColor.red
		}
		
		quizBrain.nextQuestion()
		
		Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
		
	}
	
	@objc func updateUI () {
		questionLabel.text = quizBrain.getQuestionText()
		progrssBar.progress = quizBrain.getProcess()
		scoreText.text = "score:\(quizBrain.getScore())"
		
		answerBtn1.setTitle(quizBrain.getAnswerText(btn: 0), for: .normal)
		answerBtn2.setTitle(quizBrain.getAnswerText(btn: 1), for: .normal)
		answerBtn3.setTitle(quizBrain.getAnswerText(btn: 2), for: .normal)
		
		answerBtn1.backgroundColor = UIColor.clear
		answerBtn2.backgroundColor = UIColor.clear
		answerBtn3.backgroundColor = UIColor.clear
	}
}

