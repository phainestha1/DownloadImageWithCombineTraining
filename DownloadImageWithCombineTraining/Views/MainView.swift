//
//  MainView.swift
//  DownloadImageWithCombineTraining
//
//  Created by Noah's Ark on 2022/08/21.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var mainViewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(mainViewModel.dataArray) { model in
                    ListCell(model: model)
                }
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
