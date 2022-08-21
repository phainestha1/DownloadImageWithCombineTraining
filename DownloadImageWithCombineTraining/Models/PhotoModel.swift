//
//  PhotoModel.swift
//  DownloadImageWithCombineTraining
//
//  Created by Noah's Ark on 2022/08/21.
//

import Foundation

struct PhotoModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
