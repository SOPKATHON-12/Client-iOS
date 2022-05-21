//
//  DayDetailEntity.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/22.
//

import Foundation

struct DayDetailEntity: Codable {
  let month: Int
  let topEmojiLevel: Int
  let records: [DayDetailListEntity]
}


struct DayDetailListEntity: Codable {
  let emojiLevel: Int
  let score: Int
  let comment: Int
}
