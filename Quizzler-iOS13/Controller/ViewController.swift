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
	
	@IBOutlet weak var trueBtn: UIButton!
	@IBOutlet weak var falseBtn: UIButton!
	
	var quizBrain = QuizBrain()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		questionLabel.text = quizBrain.getQuestionText()
		progrssBar.progress = quizBrain.getProcess()
				
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
		
		trueBtn.backgroundColor = UIColor.clear
		falseBtn.backgroundColor = UIColor.clear
		
	}
	

}

