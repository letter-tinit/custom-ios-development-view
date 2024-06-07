//
// Created by Treasure Letter ♥
// 
// https://github.com/tinit4ever
//

import SwiftUI

struct QuestionView: View {
  // MARK: - PROPERTY
  
  @Binding var question: Question
  
  // MARK: - BODY
  
  var body: some View {
      VStack(alignment: .leading, spacing: 20) {
        Text(question.title)
        
        ForEach(question.options, id: \.self) { option in
          HStack {
            Button {
              question.selection = option
            } label: {
              if question.selection == option {
                Circle()
                  .shadow(radius: 3)
                  .frame(width: 24, height: 24)
                  .foregroundStyle(.orange)
              } else {
                Circle()
                  .stroke(.black, lineWidth: 2)
                  .shadow(radius: 3)
                  .frame(width: 24, height: 24)
              }
            }
            Text(option)
          }
          
        }
      }
      .padding(.horizontal, 20)
      .frame(width: 340, height: 550, alignment: .leading)
      .background(
        Color.blue
      )
      .clipShape(RoundedRectangle(cornerRadius: 20))
      .shadow(color: .black.opacity(0.9), radius: 5, x: 2, y: 2)
  }
}

// MARK: PREVIEW
#Preview {
  QuestionView(question: .constant(Question(title: "When was the iPhone first released", answer: "A", options: ["A", "B", "C", "D"])))
}
