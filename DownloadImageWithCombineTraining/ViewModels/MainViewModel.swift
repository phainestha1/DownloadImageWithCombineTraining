//
//  MainViewModel.swift
//  DownloadImageWithCombineTraining
//
//  Created by Noah's Ark on 2022/08/21.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    @Published var dataArray: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    let dataService: DownloadImageDataService = DownloadImageDataService.shared
    
    init() { addSubscriber() }
    
    private func addSubscriber() {
        dataService.$photoModels
            .sink { [weak self] returnData in
                self?.dataArray = returnData
            }
            .store(in: &cancellables)
    }
}
