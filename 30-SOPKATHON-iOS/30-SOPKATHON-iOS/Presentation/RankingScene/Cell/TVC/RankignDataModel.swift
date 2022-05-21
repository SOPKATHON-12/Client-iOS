//
//  RankignDataModel.swift
//  30-SOPKATHON-iOS
//
//  Created by 강윤서 on 2022/05/22.
//

import UIKit

struct RankingDataModel {
    let rankingLabel: String
    let userImg: String
    let nameLabel: String
    let decibelLabel: String
}

extension RankingDataModel {
    static let sampleData: [RankingDataModel] = [
        RankingDataModel(rankingLabel: "1", userImg: "sdf", nameLabel: "user1", decibelLabel: "99"),
        RankingDataModel(rankingLabel: "1", userImg: "sdf", nameLabel: "user1", decibelLabel: "99"),
        RankingDataModel(rankingLabel: "1", userImg: "sdf", nameLabel: "user1", decibelLabel: "99"),
        RankingDataModel(rankingLabel: "1", userImg: "sdf", nameLabel: "user1", decibelLabel: "99"),
        RankingDataModel(rankingLabel: "1", userImg: "sdf", nameLabel: "user1", decibelLabel: "99"),
        RankingDataModel(rankingLabel: "1", userImg: "sdf", nameLabel: "user1", decibelLabel: "99"),
        RankingDataModel(rankingLabel: "1", userImg: "sdf", nameLabel: "user1", decibelLabel: "99"),
        RankingDataModel(rankingLabel: "1", userImg: "sdf", nameLabel: "user1", decibelLabel: "99"),
        RankingDataModel(rankingLabel: "1", userImg: "sdf", nameLabel: "user1", decibelLabel: "99")
    ]
}
