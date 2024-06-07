//
//  Question.swift
//  Quizz
//
//  Created by Treasure Letter on 19/04/2024.
//

import Foundation

struct Question {
  let id = UUID()
  let title: String
  let answer: String
  let options: [String]
  var selection: String?
}
