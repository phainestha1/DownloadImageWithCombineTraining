//
//  ListCell.swift
//  DownloadImageWithCombineTraining
//
//  Created by Noah's Ark on 2022/08/22.
//

import SwiftUI

struct ListCell: View {
    let model: PhotoModel
    
    var body: some View {
        HStack {
            ImageView(url: model.url, key: "\(model.id)")
            
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundColor(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)

        }// HStack
    }// body
}// ListCell

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(model: PhotoModel(albumId: 1, id: 1, title: "1", url: "1", thumbnailUrl: "1"))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
