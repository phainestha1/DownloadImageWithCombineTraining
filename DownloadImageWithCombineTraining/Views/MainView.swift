//
//  MainView.swift
//  DownloadImageWithCombineTraining
//
//  Created by Noah's Ark on 2022/08/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Hello, world!")
                    .padding()
            }
            .navigationTitle("Main")
            
        }// NavigationView
    }// body
}// MainView

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
