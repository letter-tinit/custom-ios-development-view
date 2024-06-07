//
//  ContentView.swift
//  Quizz
//
//  Created by Treasure Letter on 19/04/2024.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTY
  @AppStorage("survey") var isSurveyViewActive: Bool = false
  
  @State var manager = QuizManager()
  
  // MARK: - BODY
  
  var body: some View {
    TabView {
      ForEach(manager.mockQuestion.indices, id: \.self) { index in
        ZStack {
          QuestionView(question: $manager.mockQuestion[index])
          
          if let lastQuestion = manager.mockQuestion.last,
             lastQuestion.id == manager.mockQuestion[index].id {
            VStack {
              Spacer()
              
              Button {
                // ACTION
                print(manager.gradeQuiz())
              } label: {
                ZStack {
                  RoundedRectangle(cornerRadius: 20, style: .continuous)
                  
                  Text("Submit")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .padding()
                    .foregroundStyle(.white)
                }
              }
              .frame(width: 340, height: 40)
              .padding(.bottom, 20)
              .disabled(!manager.canSubmit())
            }
            .shadow(color: .black.opacity(0.9), radius: 5, x: 2, y: 2)
          }
        }
      }
    }
    .tabViewStyle(.page(indexDisplayMode: .never))
  }
}


// MARK: PREVIEW
#Preview {
  ContentView()
}
