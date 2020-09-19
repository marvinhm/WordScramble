//
//  ContentView.swift
//  WordScramble
//
//  Created by Marvin Matovu on 20/08/2020.
//  Copyright © 2020 Marvin Matovu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var usedWords = [String]()
  @State private var rootWord = ""
  @State private var newWord = ""
  
  func addNewWord() {
    let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    guard answer.count > 1 else {
      return
    }
    
    usedWords.insert(answer, at: 0)
    newWord = ""
  }
    
  var body: some View {
    NavigationView {
      VStack {
          TextField("Enter your word", text: $newWord, onCommit: addNewWord)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .autocapitalization(.none)
          
          List(usedWords, id: \.self) {
            Image(systemName: "\($0.count).circle")
            Text($0)
          }
      }
   
      .navigationBarTitle(rootWord)
    }
  
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
