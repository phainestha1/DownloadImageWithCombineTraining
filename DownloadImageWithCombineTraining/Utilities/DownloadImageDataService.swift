//
//  DownloadImageDataService.swift
//  DownloadImageWithCombineTraining
//
//  Created by Noah's Ark on 2022/08/21.
//

import Foundation
import Combine

final class DownloadImageDataService {
    static let shared = DownloadImageDataService() // Singleton
    
    @Published var photoModels: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    
    private init() { downloadData() }
    
    private func downloadData() {
        guard let url = URL(string: Constant.url) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleTryMapOutput)
            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloading data: \(error)")
                }
            } receiveValue: { [weak self] resultData in
                self?.photoModels = resultData
            }
            .store(in: &cancellables)
    }
    
    private func handleTryMapOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        
        return output.data
    }
}
