//
//  ContentView.swift
//  AusweisAppiOS
//
//  Created by Zarzecki, Matthias (MATERNA External) on 07.04.26.
//

import SwiftUI

struct ContentView: View {
  let viewModel = eIDViewModel()

  var body: some View {
    VStack {
      HStack {
        Image(systemName: "person.text.rectangle.fill")
          .foregroundStyle(.red)
          .font(.system(size: 46))

        Text("eID Login")
          .font(.largeTitle)
      }

      Button(
        action: {
          viewModel.startProcess();
        },
        label: {
          Text("Start")
            .foregroundStyle(.white)
            .padding()
            .background(Color.red)
            .cornerRadius(12)
        }
      )
      .padding()

      Button(
        action: {

        },
        label: {
          Text("Stop")
            .foregroundStyle(.white)
            .padding()
            .background(Color.red)
            .cornerRadius(12)
        }
      )
      .padding()
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
