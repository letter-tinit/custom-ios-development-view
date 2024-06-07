//
//  QuizManager.swift
//  Quizz
//
//  Created by Treasure Letter on 19/04/2024.
//

import Foundation
import Observation

@Observable class QuizManager {
  var mockQuestion = [
    Question(title: "Question 1", answer: "A", options: ["A", "B", "C", "D"]),
    Question(title: "Question 2", answer: "A", options: ["A", "B", "C", "D"]),
    Question(title: "Question 3", answer: "A", options: ["A", "B", "C", "D"]),
    Question(title: "Question 4", answer: "A", options: ["A", "B", "C", "D"]),
  ]
  
  func canSubmit() -> Bool {
    return mockQuestion.filter({ $0.selection == nil}).isEmpty
  }
  
  func gradeQuiz() -> String {
    var correct: CGFloat = 0
    for question in mockQuestion {
      if question.answer == question.selection {
        correct += 1
      }
    }
    
    return "\((correct/CGFloat(mockQuestion.count)) * 100)%"
  }
}
