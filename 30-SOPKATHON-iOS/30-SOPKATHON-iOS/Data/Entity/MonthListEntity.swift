//
//  MonthListEntity.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/22.
//

import Foundation

struct MonthListEntity: Codable {
  let month: Int
  let topEmojiLevel: Int
  let days: [DayListEntity]
}


struct DayListEntity: Codable {
  let day: Int
  let emojiLevel: Int
}
