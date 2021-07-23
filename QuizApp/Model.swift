//
//  Model.swift
//  QuizApp
//
//  Created by Albert Ai on 7/21/21.
//  Copyright © 2021 Gwinyai. All rights reserved.
//

import Foundation
import UIKit

struct QuizQuestion {
    var answer: Bool
    var question: String
    var image: UIImage
}

class Quiz {
    // List of the questions
    private var questions: [QuizQuestion] = [
        QuizQuestion(answer: true, question: "Is this a tree?", image: UIImage(named: "tree")!),
        QuizQuestion(answer: false, question: "Is this a dog?", image: UIImage(named: "car")!),
        QuizQuestion(answer: false, question: "Is this a person?", image: UIImage(named: "mug")!)
    ]
    
    private var score: Int = 0
    private var questionIndex: Int = 0
    
    // Gets score at end of quiz
    func getScore() -> String {
        return "\(score)/\(questions.count)"
    }
    
    // Gets a question
    func getQuestion() -> QuizQuestion {
        return questions[questionIndex]
    }
    
    // Checks if a selected answer is correct
    func check(answer: Bool) -> Bool {
        let question = getQuestion()
        if question.answer == answer {
            score += 1
            return true
        }
        return false
    }
    
    // Moves onto next question if it exists
    func nextQuestion() -> Bool {
        questionIndex += 1
        if questionIndex > questions.count - 1 {
            return false
        }
        return true
    }
    
    // Resets instance variables at end of quiz
    func reset() {
        questionIndex = 0
        score = 0
    }
}
