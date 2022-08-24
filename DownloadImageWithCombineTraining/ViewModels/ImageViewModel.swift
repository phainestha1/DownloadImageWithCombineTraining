//
//  ImageViewModel.swift
//  DownloadImageWithCombineTraining
//
//  Created by Noah's Ark on 2022/08/22.
//

import Foundation
import SwiftUI
import Combine

final class ImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    var cancellables = Set<AnyCancellable>()
    let manager: PhotoCacheManager = PhotoCacheManager.shared
    let urlString: String
    let imageKey: String
    
    init(url: String, key: String) {
        self.urlString = url
        self.imageKey = key
        getImage()
    }
    
    private func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
        } else {
            downloadImage()
        }
    }
    
    private func downloadImage() {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { (data, response) -> UIImage? in
                return UIImage(data: data)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnData in
                self?.image = returnData
            }
            .store(in: &cancellables)
    }
}
