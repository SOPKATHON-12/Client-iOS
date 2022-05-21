//
//  FeedService.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/22.
//

import Foundation


protocol FeedServiceType {
  func getMonthData(month: Int,completion: @escaping (Result<MonthListEntity?, Error>) -> Void)
  func getDayData(month: Int,day: Int,completion: @escaping (Result<DayListEntity?, Error>) -> Void)
}

extension BaseService: FeedServiceType {
  func getMonthData(month: Int,completion: @escaping (Result<MonthListEntity?, Error>) -> Void) {
    requestObject(.getMyRecordInMonth, completion: completion)
  }
  
  func getDayData(month: Int,day: Int,completion: @escaping (Result<DayListEntity?, Error>) -> Void) {
    requestObject(.getMyRecordInDay, completion: completion)
  }
}
