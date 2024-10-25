//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by eddie chang on 2024/10/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question: Codable {
	let title: String
	let answers: [String]
	let correctAnswer: String
	
	init(q: String, a: [String], correctAnswer: String){
		self.title = q
		self.answers = a
		self.correctAnswer = correctAnswer
	}
}

