//
//  RankService.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/22.
//

import Foundation

protocol RankServiceType {
  func getRankList(type: String,completion: @escaping (Result<RankingEntity?, Error>) -> Void)
}

extension BaseService: RankServiceType {
  func getRankList(type: String,completion: @escaping (Result<RankingEntity?, Error>) -> Void) {
    requestObject(.getRanking(type: type), completion: completion)
  }
}
