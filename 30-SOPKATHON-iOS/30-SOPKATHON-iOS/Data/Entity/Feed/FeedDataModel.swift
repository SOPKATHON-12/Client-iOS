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
        FeedDataModel(gaugeImageName: "angry_icon_4", gauge: 3, reason: "늦은 밤에 시끄러운 자식 너무 짜증나잖아!!!! \n화가난다!!!!!!!!!!!!!!"),
        FeedDataModel(gaugeImageName: "angry_icon_4", gauge: 3, reason: "야식 먹어서 폭주했어요.."),
        FeedDataModel(gaugeImageName: "angry_icon_4", gauge: 2, reason: "지하철 아침에 놓침"),
        FeedDataModel(gaugeImageName: "angry_icon_4", gauge: 3, reason: "버스 아침에 놓쳤어요..."),
        FeedDataModel(gaugeImageName: "angry_icon_4", gauge: 3, reason: "떡볶이를 엎었어요.."),
        FeedDataModel(gaugeImageName: "angry_icon_4", gauge: 3, reason: "잠이 와요..")
    ]
}
