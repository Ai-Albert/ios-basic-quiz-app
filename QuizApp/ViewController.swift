//
//  ViewController.swift
//  QuizApp
//
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var quizQuestion: UILabel!
    
    let quiz = Quiz()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestion()
    }
    
    func setupQuestion() {
        let currQuestion = quiz.getQuestion()
        quizImage.image = currQuestion.image
        quizQuestion.text = currQuestion.question
    }
    
    @IBAction func trueButtonTouched(_ sender: Any) {
        let result = quiz.check(answer: true)
        showResult(isCorrect: result)
    }
    
    @IBAction func falseButtonTouched(_ sender: Any) {
        let result = quiz.check(answer: false)
        showResult(isCorrect: result)
    }
    
    func showResult(isCorrect correct: Bool) {
        let title = correct ? "Correct" : "Incorrect"
        let message = correct ? "You got the right answer" : "you got the wrong answer"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let nextQuestionAction = UIAlertAction(title: "Next Question", style: .default) { (action) in
            if self.quiz.nextQuestion() {
                self.setupQuestion()
                alert.dismiss(animated: true, completion: nil)
            }
            else {
                alert.dismiss(animated: true, completion: nil)
                self.showFinalScore()
            }
        }
        
        alert.addAction(nextQuestionAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showFinalScore() {
        let alert = UIAlertController(title: "Final Score", message: quiz.getScore(), preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.quiz.reset()
            self.setupQuestion()
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
