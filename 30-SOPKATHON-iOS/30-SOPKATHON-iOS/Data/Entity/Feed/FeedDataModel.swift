//
//  FeedDataModel.swift
//  30-SOPKATHON-iOS
//
//  Created by Juhyeon Byun on 2022/05/22.
//

import UIKit

struct FeedDataModel {
    let gaugeImageName: String
    var gaugeImage: UIImage? {
        return UIImage(named: gaugeImageName)
    }
    let gauge: Int
    let reason: String
}

extension FeedDataModel {
    static let sampleData: [FeedDataModel] = [
        FeedDataModel(gaugeImageName: "angry_icon_4", gauge: 3, reason: "나를 빡치게한 이유 어쩌구"),
        FeedDataModel(gaugeImageName: "angry_icon_4", gauge: 3, reason: "나를 빡치게한 이유 어쩌구"),
        FeedDataModel(gaugeImageName: "angry_icon_4", gauge: 3, reason: "나를 빡치게한 이유 어쩌구"),
        FeedDataModel(gaugeImageName: "angry_icon_4", gauge: 3, reason: "나를 빡치게한 이유 어쩌구"),
        FeedDataModel(gaugeImageName: "angry_icon_4", gauge: 3, reason: "나를 빡치게한 이유 어쩌구"),
        FeedDataModel(gaugeImageName: "angry_icon_4", gauge: 3, reason: "나를 빡치게한 이유 어쩌구")
    ]
}
