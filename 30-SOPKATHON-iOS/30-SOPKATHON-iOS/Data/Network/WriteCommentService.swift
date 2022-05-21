//
//  RankService.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/22.
//

import Foundation

protocol WriteCommentServiceType {
  func writeRankList(type: String,score: Int, comment: String, emojiLevel: Int, completion: @escaping (Result<Bool?, Error>) -> Void)
}

extension BaseService: WriteCommentServiceType {
  func writeRankList(type: String,score: Int, comment: String, emojiLevel: Int, completion: @escaping (Result<Bool?, Error>) -> Void) {
    requestObject(.postGameResult(type: type,
                                  score: score,
                                  comment: comment,
                                  emojiLevel: emojiLevel), completion: completion)
  }
}
