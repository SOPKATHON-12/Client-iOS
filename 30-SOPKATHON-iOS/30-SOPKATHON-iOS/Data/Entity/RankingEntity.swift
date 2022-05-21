//
//  RankingEntityu.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/22.
//

import Foundation

struct RankingEntity: Codable {
  let myRank: Int
  let myEmojiLevel: Int
  let myScore: Int
  let topRankers: [UserRankEntity]
  let rankers: [UserRankEntity]
  
}

struct UserRankEntity: Codable {
  let userName: String
  let emojiLevel: Int
  let score: Int
}
