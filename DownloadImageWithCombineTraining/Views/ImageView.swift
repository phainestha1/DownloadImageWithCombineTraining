//
//  ImageView.swift
//  DownloadImageWithCombineTraining
//
//  Created by Noah's Ark on 2022/08/22.
//

import SwiftUI

struct ImageView: View {
    @StateObject var imageViewModel: ImageViewModel

    init(url: String, key: String) {
        _imageViewModel = StateObject(wrappedValue: ImageViewModel(url: url, key: key))
    }
    
    var body: some View {
        ZStack {
            if imageViewModel.isLoading {
                ProgressView()
            } else if let image = imageViewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: Constant.url, key: "1")
    }
}
