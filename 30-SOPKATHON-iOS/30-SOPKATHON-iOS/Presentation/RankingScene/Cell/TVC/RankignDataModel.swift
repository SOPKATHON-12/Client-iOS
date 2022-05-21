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
        RankingDataModel(rankingLabel: "3", userImg: "angry_icon_4", nameLabel: "이승헌", decibelLabel: "99"),
        RankingDataModel(rankingLabel: "1", userImg: "angry_icon_4", nameLabel: "변주현", decibelLabel: "110"),
        RankingDataModel(rankingLabel: "2", userImg: "angry_icon_4", nameLabel: "손연주", decibelLabel: "100"),
        RankingDataModel(rankingLabel: "3", userImg: "angry_icon_4", nameLabel: "이승헌", decibelLabel: "99"),
        RankingDataModel(rankingLabel: "4", userImg: "angry_icon_4", nameLabel: "강윤서", decibelLabel: "95"),
        RankingDataModel(rankingLabel: "5", userImg: "angry_icon_4", nameLabel: "송지훈", decibelLabel: "90"),
        RankingDataModel(rankingLabel: "6", userImg: "angry_icon_4", nameLabel: "이유리", decibelLabel: "87"),
        RankingDataModel(rankingLabel: "7", userImg: "angry_icon_4", nameLabel: "김시하", decibelLabel: "83"),
        RankingDataModel(rankingLabel: "8", userImg: "angry_icon_4", nameLabel: "김혜정", decibelLabel: "70"),
        RankingDataModel(rankingLabel: "9", userImg: "angry_icon_4", nameLabel: "김현희", decibelLabel: "70")
    ]
}
